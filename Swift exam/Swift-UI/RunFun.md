## Running app

```swift

struct ContentView : View {
    var body: some View {
        TabbedView {
            ActivityView().tabItemLabel(Text("Activity")).tag(0)
            DetailView().tabItemLabel(Text("History")).tag(1)
        }
    }
}


struct ActivityView: View {
    
    @State var manager = SLM(start: CLLocation(latitude: 0.0, longitude: 0.0))
    
    var body: some View {
        VStack {
           
            Spacer()
            VStack {
                  Text("\(manager.distance / 1000)").font(.system(size: 30))
                  Text("Distance").font(.system(size: 19)).bold()
            }
         
            Button(action: {
                let run = Run(dist: "\(self.manager.distance)")
                let s = Saver(ename: "Activities", key: "runs", obj: run)
                s.save()
                print("Saved")
            }) {
                Text("Save manually")
                } // Trully weird :D
            
            Spacer()
            
            MapView(loc2D: CLLocationCoordinate2D(latitude: manager.lastLoc.coordinate.latitude, longitude: manager.lastLoc.coordinate.longitude))
            
        }
    }
}
```


## DetailView
```swift


class FV: BindableObject {
    var didChange = PassthroughSubject<FV, Never>()
    
    var runs: [Run] {
        didSet{
            didChange.send(self)
        }
    }
    
    init(){
        let l = Fetcher(ename: "Activities", key: "runs")
        let data = l.fetchR()
        self.runs = data
    }
}



struct DetailView: View {
    @State var manager = FV()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(manager.runs.identified(by: \.dist)){ run in
                        RunCell(run: run)
                        }.onDelete(perform: delete)
                }
            }
        }
    }
    
    func delete(at offsets: IndexSet){
        guard let index = Array(offsets).first else {return}
        manager.runs.remove(at: index)
    }
}


// https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-new-view-using-presentationbutton
struct RunCell: View {
    var run: Run
    var body: some View {
        NavigationButton(destination: RunDetail(run: run)) {
            HStack {
                Image("iceland").resizable().frame(width: 60, height: 60).clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(run.dist).font(.system(size: 20))
                    Text("08.06.2019")
                }
            }
        }
        // PresentationButton(Text("Show"), destination: RunDetail(run: run)) - WEIRD STYLE
    }
}


// https://stackoverflow.com/questions/56553527/show-user-location-on-map-swiftui
```

## SLM
```swift

class SLM: NSObject, CLLocationManagerDelegate, BindableObject {
    private var manager = CLLocationManager()
    var didChange = PassthroughSubject<SLM, Never>()
    
    var lastLoc: CLLocation {
        didSet {
            didChange.send(self)
        }
    }
    
    var firstLoc: CLLocation {
        didSet {
            didChange.send(self)
        }
    }
    
    var distance: Double {
        didSet {
            didChange.send(self)
        }
    }
    
    var start: CLLocation
    
    init(manager: CLLocationManager = CLLocationManager(), start: CLLocation){
        self.start = start
        self.manager = manager
        self.lastLoc = CLLocation(latitude: 0.0, longitude: 0.0)
        self.firstLoc = CLLocation(latitude: 0.0, longitude: 0.0)
        self.distance = 0.0
        super.init()
        self.startUpdate()
    }
    
    
    func startUpdate(){
        self.manager.delegate = self
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.last != nil {
            
            if UserDefaults.standard.value(forKey: "poi") == nil {
                firstLoc = locations.last!
                UserDefaults.standard.set("mo", forKey: "poi")
            }
            
            lastLoc = locations.last!
            distance = locations.last!.distance(from: firstLoc) // from: start
            print("DIST \(distance)")
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
}

```


## RunDetail

```swift

struct RunDetail: View {
    @State var show = false
    
    var run: Run
    var body: some View {
        VStack {
            Button(action: {
                print("Show alert")
                self.show = true
            }) {
                Text("Alert me")
                }.presentation($show){
                    Alert(title: Text("Message"), message: Text("Message"), dismissButton: .default(Text("Yup!")))
            }
            
            Spacer()
            
            Text(run.dist)
                .font(.system(size: 30)).color(Color.green)
                .gesture(TapGesture().onEnded {_ in
                 print("Hey")
            })
            
            }.frame(width: 300, height: 200)
    }
}
```
