# Swift UI

```swift
struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(users.identified(by: \.name)){ user in
                    UCell(user: user)
                }
            }
        }
    }
}


struct UCell: View {
    var user: User
    
    var body: some View {
        return NavigationButton(destination: Text(user.name)) {
            
            
            Image("butterfly").frame(width: 50, height: 50).clipped().clipShape(Circle())
            Text(user.name).font(.headline)
            
            Spacer()
            VStack(alignment: .leading) {
                Text("Next").font(.headline)
                Text("→").font(.subheadline).fontWeight(.heavy)
            }
        }
    }
}

```
