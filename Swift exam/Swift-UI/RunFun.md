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
    @State var manager = LMO()
    var body: some View {
        VStack {
            Text("\(manager.location.latitude)").font(.system(size: 40)).offset(x: 0, y: 70)
            Text("0.0").font(.system(size: 40)).offset(x: 0, y: 90)
            
            Button(action: {
                let run = Run(dist: "3.2")
                let s = Saver(ename: "Activities", key: "runs", obj: run)
                s.save()
                
                print("Saved")
            }) {
                Text("Save manually")
                }.offset(x: 0, y: 160) // Trully weird :D
            
            MapView(loc2D: CLLocationCoordinate2D(latitude: manager.location.latitude, longitude: manager.location.longitude)).offset(x: 0, y: 200)
        }
    }
}


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
                List(manager.runs.identified(by: \.dist)) {
                    RunCell(run: $0)
                }
              // return List(manager.runs, rowContent: RunCell.init)
            }
        }
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




struct MapView: UIViewRepresentable {
    var loc2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    init(loc2D: CLLocationCoordinate2D){
        self.loc2D = loc2D
    }
    
    var LM: CLLocationManager = {
        let lm = CLLocationManager()
        lm.desiredAccuracy = kCLLocationAccuracyBest
        lm.requestAlwaysAuthorization()
        return lm
    }()
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MapView.UIViewType {
        // MKMapView(frame: .zero)
        
        let map: MKMapView = {
            let map = MKMapView()
            map.showsUserLocation = true
            // user tracing mode
            return map
        }()
        
        return map
        
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        //  LM.startUpdatingLocation()
        
        let coord = LM.location?.coordinate
        print("COORD  \(String(describing: coord?.latitude))")
        
        print("\(loc2D.latitude)  OJ")
        
        if coord != nil {
            let coord = CLLocationCoordinate2D(latitude: loc2D.latitude, longitude: loc2D.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007) // 0.005
            
            let region = MKCoordinateRegion(center: coord, span: span)
            view.setRegion(region, animated: false)
        }
    }
}



class LMO: BindableObject {
    
    var didChange = PassthroughSubject<LMO, Never>()
    
    var location: CLLocationCoordinate2D {
        didSet{
            didChange.send(self)
        }
    }
    
    
    init(){
        let LM: CLLocationManager = {
            let lm = CLLocationManager()
            lm.desiredAccuracy = kCLLocationAccuracyBest
            lm.requestWhenInUseAuthorization()
            return lm
        }()
        
        self.location = LM.location?.coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)
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
            Text(run.dist).font(.system(size: 30)).color(Color.green)
            
            }.frame(width: 300, height: 200)
        
    }
}


```
