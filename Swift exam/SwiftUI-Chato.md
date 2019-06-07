```swift

import SwiftUI

struct User: Identifiable {
    var id: Int
    let name: String
    let age: Int
}


let users:[User] = [User(id: 0, name: "Filip", age: 19), User(id: 1, name: "Terka", age: 20)]


struct AllView: View {
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
    
    var size: CGFloat = 18.0
    
    
    var body: some View {
        
        let dest = ChatView(user: user)
        
        return NavigationButton(destination: dest) {
            Image("butterfly").frame(width: 70, height: 70)
                .clipped().clipShape(Circle())
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text(user.name).fontWeight(.heavy).font(.system(size: 23))
                
                HStack {
                    VStack {
                        Text("Swim").font(.system(size: size))
                        Text("23:00").fontWeight(.bold)
                    }
                    
                    VStack {
                        Text("Run").font(.system(size: size))
                        Text("43:00").fontWeight(.bold)
                    }
                    
                    VStack {
                        Text("Races").font(.system(size: size))
                        Text("22:00").fontWeight(.bold)
                    }
                    
                    
                    }.frame(width: 400, height: nil, alignment: .leading)
            }
        }
    }
}

```


## ChatView.swift

```swift
var posts = ["This is some very long text which I hope will align vertically and resize as I wish. Swift UI is real Breeze.", "This is some very long text which I hope will align vertically and resize as I wish. Swift UI is real Breeze."]

struct ChatView : View {
    
    var user: User
    
    var body: some View {
        VStack(alignment: .center) {
            
            Text(user.name).font(.system(size: 30)).fontWeight(.black).padding(.leading, 20).foregroundColor(.black)
            
            CImage() // set to custom frame
            
            
            
            List {
                ForEach(posts.identified(by: \.self)){ post in
                    ChatCell(text: post, incoming: false)
                }
            }
        }
    }
}



struct CImage: View {
    var body: some View {
        Image("butterfly")
            .frame(width: 90, height: 90, alignment: .center)
            .clipShape(Circle())
    }
}



struct ChatCell: View {
    var text: String
    var incoming: Bool
    
    var body: some View {
        Text(text)
            .lineLimit(1000)
            .frame(width: 190)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

```
