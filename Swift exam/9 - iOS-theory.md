# Experiments app

* speech

```swift
    let city = "London"
        let url = URL(string: "http://samples.openweathermap.org/data/2.5/weather?q=" + city.replacingOccurrences(of: "", with: "%20") + ",uk&appid=c6c1e68cdb11c2d42cd5b7b57027c7d3")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil{
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
