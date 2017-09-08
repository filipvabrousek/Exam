# Experiments app

* speech

```swift
        let city = "London"
        let url = URL(string: "http://samples.openweathermap.org/data/2.5/weather?q=" + city.replacingOccurrences(of: "", with: "%20") + ",uk&appid=c6c1e68cdb11c2d42cd5b7b57027c7d3")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print(error)
            } else {
                if let urlContent = data{
                    
                    do{
                        let JSONResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let description = ((JSONResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String{
                            
                            DispatchQueue.main.async(execute: {
                                print(description)
                            })
                            
                        }
                        
                    } catch{
                        
                        print("JSON Proccessing failed")
                    }
                }
                
            }
            
            
        }
        
        
        task.resume()
        
        
        /*---------------------------------------SWIPE-----------------------------------------*/
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
    }

```


## audioPlayer
```swift
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.motionShake{
            
            let sounds = ["hard-sun", "dreams", "yo-vivire"]
            let random = Int(arc4random_uniform(UInt32(sounds.count)))
            
            
            let location = Bundle.main.path(forResource: sounds[random], ofType: ".mp3")
            
            do {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: location!))
                player.play()
            }
                
            catch{
                
                
            }
            
            
        }
    }
    

```
## Animation
```swift
 @IBAction func animate(_ sender: Any) {
        let btn = sender as! UIButton
        let bounds = btn.bounds
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            btn.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
        }) { (s: Bool) in
            if s {
                btn.bounds = bounds
            }
        }
        
    }
    
    


```

## Pulse.swift
```swift
import UIKit

public class Pulse: CALayer{
    
    var animationGroup = CAAnimationGroup()
    
    var initalPulseScale: Float = 0
    var nextPulseAfter: TimeInterval = 0
    var dur: TimeInterval = 1.5
    var radius: CGFloat = 200
    var numberOfPulses: Float = Float.infinity
    
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required public init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    init(numberOfPulses:Float = Float.infinity, radius: CGFloat, position: CGPoint){
        
        super.init()
        
        
        self.backgroundColor = UIColor.black.cgColor
        self.contentsScale = UIScreen.main.scale
        self.opacity = 0
        self.radius = radius
        self.numberOfPulses = numberOfPulses
        self.position = position
        self.bounds = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2)
        self.cornerRadius = cornerRadius
        
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            self.setupAnimationGroup()
            DispatchQueue.main.async {
                self.add(self.animationGroup, forKey: "pulse")
            }
        }
    }
    
    
    
    func createScaleAnimation() -> CABasicAnimation {
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = NSNumber(value: initalPulseScale)
        scaleAnimation.toValue = NSNumber(value: 1)
        scaleAnimation.duration = dur
        return scaleAnimation
    }
    
    
    func createOpacityAnimation() -> CAKeyframeAnimation{
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = dur
        opacityAnimation.values = [0.4, 0.8, 0]
        opacityAnimation.keyTimes = [0, 0.2, 1]
        return opacityAnimation
    }
    
    
    func setupAnimationGroup(){
        self.animationGroup = CAAnimationGroup()
        self.animationGroup.duration = dur + nextPulseAfter
        self.animationGroup.repeatCount = numberOfPulses
        
        let defaultCurve = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        self.animationGroup.timingFunction = defaultCurve
        self.animationGroup.animations = [createScaleAnimation(), createOpacityAnimation()]
    }

}






```


## Animations
```swift
func pulse(){
        let pulse = Pulse(numberOfPulses: 3, radius: 110, position: square.center)
        pulse.dur = 0.8
        pulse.backgroundColor = UIColor.orange.cgColor
        self.view.layer.insertSublayer(pulse, below: square.layer)
    }
```


```swift
    
 func blend(){
        let pulse = Pulse(numberOfPulses: 3, radius: 110, position: square.center)
        pulse.dur = 0.8
        pulse.backgroundColor = UIColor.orange.cgColor
        self.view.layer.insertSublayer(pulse, below: square.layer)
    }
```

```swift
    
    func propertyAnimator(){
        let timing = UICubicTimingParameters(animationCurve: .easeInOut)
        let animator = UIViewPropertyAnimator(duration: 1.0, timingParameters: timing)
        
        animator.addAnimations {
            self.square.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }
        
        animator.addAnimations { _ in
            self.square.alpha = 0.8
        }
        animator.startAnimation()
        
    }
 ```
 
 
 ```swift
    
    
    func rotator(){
        let animator = UIViewPropertyAnimator(duration: 3, curve: .easeInOut) {
            
            for _ in 0..<10{
                let rotation = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                self.square.transform = self.square.transform.concatenating(rotation)
            }
        }
        
        animator.startAnimation()
    }
    
```    
    
```swift    
    func opacityAnimator(){
        let timing = UICubicTimingParameters(animationCurve: .easeInOut)
        let animator = UIViewPropertyAnimator(duration: 3, timingParameters: timing)
        
        animator.addAnimations {
            self.square.alpha = 0.1
        }
        animator.startAnimation()
    }
    
```    
 ```swift 
    func blur(){
        
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blur.frame = imgView.bounds
        imgView.addSubview(blur)
    }

```
