# Regular VC

```swift
class LegacyVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}


struct SimpleVC: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<SimpleVC>) {
        print("Update")
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = LegacyVC()
        return vc
    }
}


struct ContentView: View {
    var body: some View {
        SimpleVC()
    }
}

```
