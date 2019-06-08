## Sample.md

### ContentView
```swift

struct ContentView : View {
    @State var users = [String]()
    @State var name: String = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                TextField($name, placeholder: Text("Enter name"))
                
                Button(action: {
                    self.users.append(self.name)
                }) {
                    Text("Add user")
                }
                
                List(users.identified(by: \.self)){
                    UCell(user: $0)
                }
                
            }
        }
    }
}
```


### UCell
```swift


struct UCell: View {
    var user: String
    
    var body: some View {
        return NavigationButton(destination: DetailView(name: user)){
            HStack {
                Image("iceland").frame(width: 70, height: 70).clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(user).font(.system(.headline))
                    Text("19")
                }
            }
        }
    }
}

```



### DetailView
```swift
struct DetailView : View {
    var name: String
    
    var body: some View {
        Text("\(name)").font(.system(size: 30)).foregroundColor(Color.green)
    }
}
```
