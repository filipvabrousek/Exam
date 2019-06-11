## Mix UIKit and SwiftUI

```swift

class Legacy: UIViewController {
    var v: UIView = {
        let v = UIView()
        v.backgroundColor = .green
        return v
    }()
    
    let bwrap: UIHostingController = { () -> UIHostingController<btn> in
        let h = UIHostingController(rootView: btn())
        h.view.backgroundColor = .clear
        return h
    }()
    
    let btable: UIHostingController = { () -> UIHostingController<RacesList> in
        
        let h = UIHostingController(rootView: RacesList())
        return h
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(bwrap.view)
        view.addSubview(btable.view)
        btable.view.frame = CGRect(x: 0, y: 300, width: view.frame.width, height: view.frame.height - 300)
        bwrap.view.frame = CGRect(x: 90, y: 30, width: 200, height: 60)
    }
}
```
## Manager
```swift
class Manager: BindableObject {
    var didChange = PassthroughSubject<Manager, Never>()
    
    var users = [RO](){
        didSet {
            didChange.send(self)
        }
    }
    
    init(){
        let f = TextFetcher()
        f.mefetcha(url: "http://swimrunny.co/database.txt") { (resa) in
            
            var us = [RO]()
            
            for (i, _) in resa.enumerated(){
                let el = RO(value: resa[i], isSelected: false)
                us.append(el)
            }
            
            DispatchQueue.main.async {
                self.users = us
            }
            
        }
    }
}

```

## RaceList
```swift
struct RO: Decodable {
    let value: String
    let isSelected: Bool
}


struct RacesList:View {
    @State var manager = Manager()
    
    var body: some View {
        List(manager.users.identified(by: \.value)){
            Text($0.value)
        }
    }
}
```


## Sheet
```swift

struct btn: View {
    @State var show = false
    @State var showsheet = false
    
    var sheet: ActionSheet {
        ActionSheet(title: Text("action"),
                    message: Text("ss"),
                    buttons: [.default(Text("Woo"),
                                       onTrigger: {
                                        self.showsheet = false
                    }), .cancel({
                        self.showsheet = false
                    })])
    }
    
    var body: some View {
        Button(action: {
            self.showsheet = true
            print("Oh yes! I am the happiest person alive.")
        }) {
            Text("Please")
            }
            .font(.system(size: 30))
            .presentation(showsheet ? sheet : nil)
    }
}

```
