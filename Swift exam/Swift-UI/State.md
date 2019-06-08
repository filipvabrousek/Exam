# State

```swift
struct ContentView: View {
    @State var first = ""
    @State var users = [String]()
    
    var body: some View {
        
        NavigationView { // only one return type
            VStack {
                TextField($first, placeholder: Text("Enter name"))
                
                Button(action: {
                    self.users.append(self.first)
                }) {
                    Text("Append user")
                }
            }
            
            List (users.identified(by: \.self)){
                Text($0)
            }
            
        }
    }
}
```
