# Swift UI

```swift
struct User: Identifiable {
    var id: Int
    let name: String
    let age: Int
}


let users:[User] = [User(id: 0, name: "Filip", age: 19), User(id: 1, name: "Terka", age: 20)]


struct ContentView: View {
    var body: some View {
        
        NavigationView {
            List(users) { user in
                UCell(user: user)
            }
        }
    }
}




struct UCell: View {
    var user: User
    
    var body: some View {
        return NavigationButton(destination: Text(user.name)) {
            Image("butterfly").frame(width: 70, height: 70)
                .clipped().clipShape(Circle())
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text(user.name).fontWeight(.heavy).font(.system(size: 23))
                Text("Age \(user.age)")
            }
        }
    }
}

```
