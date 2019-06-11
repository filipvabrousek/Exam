## LoginView

```swift
struct RO: Decodable {
    let value: String
    let isSelected: Bool
}

struct LoginView : View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    
    
    var body: some View {
        
        ZStack {
            Image("iceland")
            
            
            VStack {
                NavigationView {
                    Text("Log in").font(.headline)
                    Spacer()
                    TextField($username, placeholder: Text("Enter username")).padding(12)
                    TextField($password, placeholder: Text("Enter password")).padding(12)
                    
                    NavigationButton(destination: XView(name: username)){
                        Text("Log in")
                    }
                    
                    Spacer()
                } //.background(Image("iceland"))
                }.padding(.bottom, 200)
        }
        
    }
}



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
            
            self.users = us
        }
    }
}
```


## XView
```swift

struct XView: View {
    var name: String
    
    @State var manager = Manager()

    var body: some View {
        VStack {
            Text("Hi, \(name)").font(.system(size: 40)) // pass variable from UITextField
            
            List(manager.users.identified(by: \.value)){
                Text($0.value)
            }
        }
        
    }
}
```
