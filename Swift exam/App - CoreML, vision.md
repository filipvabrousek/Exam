# Image recognition

```swift
func detect(){
        
        resultLabel.text = "Thinking"
        
        guard let model = try? VNCoreMLModel(for: GoogLeNetPlaces().model) else {
            fatalError("Failed to load model")
        }
        
        // 1
        let request = VNCoreMLRequest(model: model) {[weak self] request, error in
            guard let results = request.results as? [VNClassificationObservation],
                let topResult = results.first
                else {
                    fatalError("Unexpected results")
            }
            
            
            // 2
            DispatchQueue.main.async { [weak self] in
                self?.resultLabel.text = "\(topResult.identifier) with \(Int(topResult.confidence * 100))% confidence"
            }
        }
        
        guard let ciImage = CIImage(image: self.imgView.image!)
            else { fatalError("Can`t create CIImage from UIImage") }
        
        // 3
        let handler = VNImageRequestHandler(ciImage: ciImage)
        DispatchQueue.global().async {
            do {
                try handler.perform([request])
            } catch {
                print(error)
            }
        }
        
        
    }
    
```

* load image in viewDidLoad()
* import Model from developer.apple.com

## Face recognition

```swift
func detectFaces(){
        
        guard let imageToDetect = imgView.image else { return }
        
        let request = VNDetectFaceRectanglesRequest { (request, error) in
            if let error = error {
                print(error)
            }
            
            if let results = request.results as? [VNFaceObservation]{
                
                for face in results{
                    print(face.boundingBox)
                    
                    
                    DispatchQueue.main.async {
                        
                        let imageRect = self.imgView.frame
                        let boundingBox = face.boundingBox
                        
                        let width = boundingBox.size.width * imageRect.width
                        let height = boundingBox.size.height * imageRect.height
                        let x = boundingBox.origin.x * imageRect.width
                        let y = (1 - boundingBox.origin.y) * imageRect.height - height
                        
                        let faceView = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
                        faceView.backgroundColor = UIColor.orange
                        faceView.alpha = 0.5
                        faceView.layer.cornerRadius = 15
                        faceView.clipsToBounds = true
                        faceView.layer.borderColor = UIColor.groupTableViewBackground.cgColor
                        self.view.addSubview(faceView)
                    }
                    
                }
            }
        }
        
        
        guard let cgImage = imageToDetect.cgImage else { return }
        
        DispatchQueue.global().async {
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            
            
            do {
                try handler.perform([request])
            }
                
            catch {
                print(error)
            }
        }
    }
    
```
