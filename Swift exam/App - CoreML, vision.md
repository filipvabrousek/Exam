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

# Face recognition

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

# Object tracking

```swift
import UIKit
import AVKit
import Vision

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    @IBOutlet var cameraView: UIView!
    @IBOutlet var resultLabel: UILabel!
    
    
    
     /*------------------------------------------------------------------------------------------------------
     1 - get input from the device
     2 - get output from the camera
     3 - display the output
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1
        let session = AVCaptureSession()
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        
        guard let input = try? AVCaptureDeviceInput(device: device) else { return }
        session.addInput(input)
        session.startRunning()
        
        // get output from camare
        let cameraOutput = AVCaptureVideoDataOutput()
        cameraOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "video"))
        session.addOutput(cameraOutput)
        
        
        // display the output
        let preview = AVCaptureVideoPreviewLayer(session: session)
        preview.frame = CGRect(x: 0, y: 0, width: cameraView.frame.size.width, height: cameraView.frame.size.width)
        cameraView.layer.addSublayer(preview)
    }
    
    
    
    /*------------------------------------------------------------------------------------------------------*/
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        detect(pixelBuffer: pixelBuffer)
    }
    
    
    
    
     /*------------------------------------------------------------------------------------------------------*/
    func detect(pixelBuffer: CVPixelBuffer){
        
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else { return }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else { return }
            
            guard let first = results.first else { return }
            print(first.identifier)
            
            DispatchQueue.main.async {
                self.resultLabel.text = first.identifier
            }
            
        }
        
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
        
        DispatchQueue.global().async {
            try? handler.perform([request])
        }
        
    }
    
    
}


```


# Drag and drop

```swift
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextDragDelegate, UITableViewDropDelegate {
    
    @IBOutlet var textView: UITextView!
    @IBOutlet var tableView: UITableView!
    
    var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.dropDelegate = self as? UITableViewDropDelegate
        textView.textDragDelegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    
    
    /*----------------------------------------------------------------DRAG PREVIEW FRO LIFTING ITEM----------------------------------------------------------------*/
    func textDraggableView(_ textDraggableView: UIView & UITextDraggable, dragPreviewForLiftingItem item: UIDragItem, session: UIDragSession) -> UITargetedDragPreview? {
        
        let imgView = UIImageView(image: UIImage(named: "hand.jpg"))
        imgView.backgroundColor = UIColor.clear
        
        let dragPoint = session.location(in: textDraggableView)
        let target = UIDragPreviewTarget(container: textDraggableView, center: dragPoint)
        return UITargetedDragPreview(view: imgView, parameters: UIDragPreviewParameters(), target: target)
    }
    
    
    
    /*------------------------------------------------------------------------ITEM FOR DRAG--------------------------------------------------------------------*/
    func textDraggableView(_ textDraggableView: UIView & UITextDraggable, itemsForDrag dragRequest: UITextDragRequest) -> [UIDragItem] {
        
        if let draggedString = textView.text(in: dragRequest.dragRange){
            let itemProvider = NSItemProvider(object: draggedString as NSItemProviderWriting)
            return [UIDragItem(itemProvider: itemProvider)]
        } else {
            return []
        }
    }
    
    /*------------------------------------------------------------------------PERFORM DROP WITH-------------------------------------------------------------------*/
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        var destIndexPath: IndexPath
        
        if let indexPath = coordinator.destinationIndexPath {
            destIndexPath = indexPath
        } else {
            let row = tableView.numberOfRows(inSection: 0)
            destIndexPath = IndexPath(row: row, section: 0)
        }
        coordinator.session.loadObjects(ofClass: NSString.self) { (items) in
            guard let arr = items as? [String] else {return}
            let str = arr.first
            self.data.insert(str!, at: destIndexPath.row)
            tableView.insertRows(at: [destIndexPath], with: .automatic)
        }
    }
    
}



```
