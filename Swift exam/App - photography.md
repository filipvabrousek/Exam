# Filtery 

# Import View Controller
```swift
import UIKit

class ImportViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    @IBOutlet var imgView: UIImageView!
    
    
    
    @IBAction func importPhoto(_ sender: Any) {
        let IP = UIImagePickerController()
        IP.allowsEditing = true;
        IP.sourceType = UIImagePickerControllerSourceType.photoLibrary
        IP.delegate = self
        present(IP, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let img = info[UIImagePickerControllerEditedImage] as? UIImage
        let data = UIImagePNGRepresentation(img!)
        UserDefaults.standard.set(data, forKey: "saved")
        
        imgView.image = img
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

```

## Edit View Controller

```swift
import UIKit

class EditViewController: UIViewController, SOCropVCDelegate {

    
    
    
    @IBOutlet var slider: UISlider!
    
    
    var delegate: SOCropVCDelegate?
    var context:CIContext = CIContext(options: nil)
    var filter: CIFilter!
    
    
    @IBOutlet var imgView: UIImageView!
    
    
    var filterA:AdjustableFilter?
    var fvalue: Double = 0.5
    
    
    
    @IBAction func addFilter(_ sender: Any) {
        showFilterSheet()
    }
    
    func showFilterSheet(){
        
        // sheet
        let sheet = UIAlertController(title: "Select Filter", message: "Add filter to you photo", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let weird = UIAlertAction(title: "Weird", style: .default) { (action) in
            self.weird()
        }
        
        let custom = UIAlertAction(title: "Custom", style: .default) { (action) in
            self.custom()
        }
        
        
        sheet.addAction(weird)
        sheet.addAction(cancel)
        sheet.addAction(custom)
        present(sheet, animated: true, completion: nil)
        
    }
    
    
    
    
    
    func custom(){
        
        let image = Image(image: imgView.image!)
        let f1 = MixFilter()
        let f2 = O(intensity: 0.6)
        let image2 = f1.apply(input: image)
        let image3 = f2.apply(input: image2)
        imgView.image = image3.toUIImage()
    }
    
    
    
    
    
    func weird(){
        
        let image = Image(image: imgView.image!)
        let f = O(intensity: 0.1)
        let image2 = f.apply(input: image)
        imgView.image = image2.toUIImage()
    }
    
    
    
    @IBAction func save(_ sender: Any) {
        let data = UIImageJPEGRepresentation(imgView.image!, 0.9)
        let compressed = UIImage(data: data!)
        UIImageWriteToSavedPhotosAlbum(compressed!, nil, nil, nil)
    }
    
    
    
    
    @IBAction func share(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [imgView.image], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
        
    }
    
    @IBAction func adapt(_ sender: Any) {
        
        adaptIntensity()
        
    }
    
    func adaptIntensity(){
        
        let image = Image(image: imgView.image!)
        let f1 = O(intensity: fvalue)
        let image2 = f1.apply(input: image)
        imgView.image = image2.toUIImage()
        
    }
    
    
    @IBAction func sliderChanged(_ sender: Any) {
        fvalue = Double(slider.value)
        print(fvalue)
    }
    
    
    
    @IBAction func cropA(_ sender: Any) {
        if imgView.image != nil {
            let obj = Crop()
            obj.imgOriginal = imgView.image
            obj.isAllowCropping = true
            obj.cropSize = CGSize(width: 320, height: 320)
            obj.delegate = self
            self.navigationController?.pushViewController(obj, animated: true)
        }
    }
    
    
    
    func imagecropvc(_ imagecropvc:Crop, finishedcropping:UIImage) {
        imgView.image = finishedcropping
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetched = UserDefaults.standard.value(forKey: "saved")
        let realImage = UIImage(data: fetched as! Data)
        imgView.image = realImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
```




## RGBAPixel.swift
```swift


import UIKit

public struct RGBAPixel {
    
    /*-----------------------------------------------------------------------------------------------------------------------------*/
    public init(rawVal: UInt32){
        raw = rawVal
    }
    
    
    public var raw: UInt32
    
    public var red:UInt8 {
        get { return UInt8(raw & 0xFF) }
        set { raw = UInt32(newValue) | (raw & 0xFFFFFF00)}
    }
    
    
    public var green:UInt8 {
        get { return UInt8( (raw & 0xFF00) >> 8)}
        set { raw = (UInt32(newValue) << 8) | (raw & 0xFFFF00FF)}
    }
    
    
    public var blue:UInt8 {
        get { return UInt8( (raw & 0xFF0000) >> 16) }
        set { raw = (UInt32(newValue) << 16) | (raw & 0xFF00FFFF)}
    }
    
    
    public var alpha:UInt8 {
        get { return UInt8( (raw & 0xFF000000) >> 24) }
        set { raw = (UInt32(newValue) << 24) | (raw & 0x00FFFFFF)}
    }
    
}


```
## Image.swift

```swift
import UIKit


public class Image {
    
    let pixels: UnsafeMutableBufferPointer<RGBAPixel>
    let height: Int
    let width: Int
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let bitmapInfo: UInt32 = CGBitmapInfo.byteOrder32Big.rawValue | CGImageAlphaInfo.premultipliedLast.rawValue
    let bitsPerComponent = Int(8)
    let bytesPerRow: Int
    
    
    /*-----------------------------------------------------------------------------------------------------------------------------*/
    public init(width: Int, height: Int){
        
        self.height = height
        self.width = width
        bytesPerRow = 4 * width
        let rawData = UnsafeMutablePointer<RGBAPixel>.allocate(capacity: (width * height))
        pixels = UnsafeMutableBufferPointer<RGBAPixel>(start: rawData, count: width * height)
    }
    
    
    
    /*-----------------------------------------------------------------------------------------------------------------------------*/
    public init(image: UIImage){
        
        height = Int(image.size.height)
        width = Int(image.size.width)
        bytesPerRow = 4 * width
        
        let rawData = UnsafeMutablePointer<RGBAPixel>.allocate(capacity: (width * height))
        let CGPointZero = CGPoint(x: 0, y: 0)
        let rect = CGRect(origin: CGPointZero, size: image.size)
        
        let imageContext = CGContext(data: rawData,
                                     width: width,
                                     height: height,
                                     bitsPerComponent: bitsPerComponent,
                                     bytesPerRow: bytesPerRow,
                                     space: colorSpace,
                                     bitmapInfo: bitmapInfo)
        
        imageContext?.draw(image.cgImage!, in: rect)
        
        pixels = UnsafeMutableBufferPointer<RGBAPixel>(start: rawData, count: width * height)
    }
    
    
    
    
    
    
    
    
    
    
    /*---------------------------------------------------------TO UIIMAGE--------------------------------------------------------------------*/
    public func toUIImage() -> UIImage{
        let outContext = CGContext(data: pixels.baseAddress, width: width, height: height, bitsPerComponent: bitsPerComponent,bytesPerRow: bytesPerRow,space: colorSpace,bitmapInfo: bitmapInfo,releaseCallback: nil,releaseInfo: nil)
        
        return UIImage(cgImage: outContext!.makeImage()!)
    }
    
    
    /*------------------------------------------------------------GET AND SET PIXEL-----------------------------------------------------------------*/
    public func getPixel(x: Int, y:Int) -> RGBAPixel{
        return pixels[x+y*width]
    }
    
    
    public func setPixel(value: RGBAPixel, x: Int, y:Int) {
        pixels[x+y*width] = value
    }
    
    
    
    /*------------------------------------------------------------------TRANSFORM PIXELS-----------------------------------------------------------*/
    public func transformPixels(transformFunc: (RGBAPixel) -> RGBAPixel) -> Image{
        
        let newImage = Image(width: self.width, height: self.height)
        
        for y in 0 ..< height {
            for x in 0 ..< width {
                let p1 = getPixel(x: x, y: y)
                let p2 = transformFunc(p1)
                newImage.setPixel(value: p2, x: x, y: y)
            }
        }
        return newImage
    }
    
}



```


## Filter.swift


```swift
import Foundation

protocol Filter{
    func apply(input: Image) -> Image
}

protocol AdjustableFilter: Filter{
    var value: Double {get set}
    var min: Double { get }
    var max: Double {get }
    var defaultValue:Double {get}
}



```

## Filters.swift
```swift
import Foundation

class O:Filter {

    let intensity:Double
    init(intensity:Double){
    self.intensity = intensity
    }

    
    
    func apply(input: Image) -> Image {
        return input.transformPixels( transformFunc: {(p1: RGBAPixel) -> RGBAPixel in
        var p = p1
        p.alpha = UInt8(Double(p.alpha) * self.intensity)
        return p
        })
    }
    
}




/*---------------------------------------------------------------MIX FILTER---------------------------------------------------------------*/
class MixFilter: Filter{
    
    
    func apply(input: Image) -> Image {
        return input.transformPixels( transformFunc: { (p1: RGBAPixel) -> RGBAPixel in
            var p = p1
            let r = p.red
            p.red = p.blue
            p.blue = p.green
            p.green = r
            return p
        })
    }
}



class Intensity:Filter, AdjustableFilter{
    
    var value: Double
    let min:Double = 0.0
    let max:Double = 0.0
    let defaultValue:Double = 0.5
    
    init(setValue:Double ){
        self.value = setValue
    }
    
    func apply(input: Image) -> Image {
        return input.transformPixels(transformFunc: { (p1: RGBAPixel) -> RGBAPixel in
            var p = p1
            p.red = UInt8(Double(p.red) * self.value)
            p.green = UInt8(Double(p.green) * self.value)
            p.blue = UInt8(Double(p.green) * self.value)
            return p
        })
    }
}

```









## Cropclass

```swift
import UIKit
import CoreGraphics

internal protocol SOCropVCDelegate {
    func imagecropvc(_ imagecropvc:Crop, finishedcropping:UIImage)
}




/*-----------------------------------------------------------------------CROP----------------------------------------------------------------------------------*/

internal class Crop: UIViewController {
    
    var imgOriginal: UIImage!
    var delegate: SOCropVCDelegate?
    var cropSize: CGSize!
    var isAllowCropping = false
    fileprivate var imgCropped: UIImage!
    fileprivate var imageCropView: SOImageCropView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.isNavigationBarHidden = true
        self.setupCropView()
    }
    
    
    
    
    //------------------------------------------- VIEW WILL LAYOUT SUBVIEWS
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.imageCropView.frame = self.view.bounds
        setupBottomViewView()
    }
    
    
    /*------------------------------------------- SETUP BOTTOM VIEWS
     1 - add bottomView and cancel and crop views and add correposnding actions
     */
    
    func setupBottomViewView() {
        
        let viewBottom = UIView()
        viewBottom.frame = CGRect(x: 0, y: self.view.frame.size.height-64, width: self.view.frame.size.width, height: 64)
        viewBottom.backgroundColor = UIColor.darkGray
        self.view.addSubview(viewBottom)
        
        let btnCancel = UIButton()
        btnCancel.frame = CGRect(x: 10, y: 17, width: 60, height: 30)
        btnCancel.layer.cornerRadius = 5.0
        btnCancel.layer.masksToBounds = true
        btnCancel.setTitleColor(UIColor.black, for: UIControlState())
        btnCancel.setTitle("Cancel", for: UIControlState())
        btnCancel.backgroundColor = UIColor.white
        btnCancel.addTarget(self, action: #selector(actionCancel), for: .touchUpInside)
        viewBottom.addSubview(btnCancel)
        
        let btnCrop = UIButton()
        btnCrop.frame = CGRect(x: self.view.frame.size.width-50-10, y: 17, width: 50, height: 30)
        btnCrop.layer.cornerRadius = 5.0
        btnCrop.layer.masksToBounds = true
        btnCrop.setTitleColor(UIColor.black, for: UIControlState())
        btnCrop.setTitle("Crop", for: UIControlState())
        btnCrop.backgroundColor = UIColor.white
        btnCrop.addTarget(self, action: #selector(actionCrop), for: .touchUpInside)
        viewBottom.addSubview(btnCrop)
        
    }
    
    //------------------------------------------- ACTIONS
    func actionCancel(_ sender: AnyObject?) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionCrop(_ sender: AnyObject) {
        imgCropped = self.imageCropView.croppedImage()
        self.delegate?.imagecropvc(self, finishedcropping:imgCropped)
        self.actionCancel(nil)
    }
    
    
    /*------------------------------------------- SETUP CROP VIEWS
     2 - setup cropview using:
     "SOImageCropView(frame: self.view.bounds)"
     stick the frame to the image
     */
    
    fileprivate func setupCropView() {
        self.imageCropView = SOImageCropView(frame: self.view.bounds)
        self.imageCropView.imgCrop = imgOriginal
        self.imageCropView.isAllowCropping = self.isAllowCropping
        self.imageCropView.cropSize = cropSize
        self.view.addSubview(self.imageCropView)
    }
}

```


## SOCropBorderView

```swift
internal class SOCropBorderView: UIView {
    fileprivate let kCircle: CGFloat = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
    }
    
    
    /*------------------------------------------- DRAW
     draw the frame wround cropped image
     */
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        context?.setStrokeColor(UIColor(red: 0.16, green: 0.25, blue: 0.75, alpha: 0.5).cgColor)
        context?.setLineWidth(1.5)
        context?.addRect(CGRect(x: kCircle / 2, y: kCircle / 2,
                                width: rect.size.width - kCircle, height: rect.size.height - kCircle))
        context?.strokePath()
        
        context?.setFillColor(red: 0.16, green: 0.25, blue: 0.35, alpha: 0.95)
        for handleRect in calculateAllNeededHandleRects() {
            context?.fillEllipse(in: handleRect)
        }
    }
    
    
    /*------------------------------------------- CALCULATE ALL NEEDED
     calculate position of the handlers
     1 - Position handle circles (in the corners and in the middle of the sides)
     2 - starting with the upper left corner and then following clockwise (topLeft - TL)
     */
    
    fileprivate func calculateAllNeededHandleRects() -> [CGRect] {
        
        let width = self.frame.width
        let height = self.frame.height
        
        // 1
        let leftColX: CGFloat = 0
        let rightColX = width - kCircle
        let centerColX = rightColX / 2
        
        let topRowY: CGFloat = 0
        let bottomRowY = height - kCircle
        let middleRowY = bottomRowY / 2
        
        //  2
        let TL = CGRect(x: leftColX, y: topRowY, width: kCircle, height: kCircle)
        let TC = CGRect(x: centerColX, y: topRowY, width: kCircle, height: kCircle)
        let TR = CGRect(x: rightColX, y: topRowY, width: kCircle, height: kCircle)
        let MR = CGRect(x: rightColX, y: middleRowY, width: kCircle, height: kCircle)
        let BR = CGRect(x: rightColX, y: bottomRowY, width: kCircle, height: kCircle)
        let BC = CGRect(x: centerColX, y: bottomRowY, width: kCircle, height: kCircle)
        let BL = CGRect(x: leftColX, y: bottomRowY, width: kCircle, height: kCircle)
        let ML = CGRect(x: leftColX, y: middleRowY, width: kCircle, height: kCircle)
        
        return [TL, TC, TR, MR, BR, BC, BL, ML]
    }
}


```




## ScrollView
* calculate position of the handlers
* 1 - center horiontally
* 2 - center vertically
 
 
```swift
private class ScrollView: UIScrollView {
    
    /*------------------------------------------- LAYOUT SUBVIEWS
     calculate position of the handlers
     1 - center horiontally
     2 - center vertically
     */
    
    fileprivate override func layoutSubviews() {
        super.layoutSubviews()
        
        if let zoomView = self.delegate?.viewForZooming?(in: self) {
            let size = self.bounds.size
            var frameToCenter = zoomView.frame
            
            // 1
            if frameToCenter.size.width < size.width {
                frameToCenter.origin.x = (size.width - frameToCenter.size.width) / 2
            } else {
                frameToCenter.origin.x = 0
            }
            
            // 2
            if frameToCenter.size.height < size.height {
                frameToCenter.origin.y = (size.height - frameToCenter.size.height) / 2
            } else {
                frameToCenter.origin.y = 0
            }
            
            zoomView.frame = frameToCenter
        }
    }
}

```




## SOImageCropView
* 1 -  Calculate rect that needs to be cropped
* 2 - transform visible rect to image orientation using "ORIENTATION TRANSFORMED FOT THE RECT OF THE IMAGE"
* 3 - finally crop image
* 4 - first of all, get the size scale by taking a look at the real image dimensions. Here it
     doesn't matter if you take the width or the hight of the image, because it will always
     be scaled in the exact same proportion of the real image
     
* 5 - get the postion of the cropping rect inside the image
* 6 - scaled width/height in regards of real width to crop width
* 7 - extract visible rect from scrollview and scale it

```swift
internal class SOImageCropView: UIView, UIScrollViewDelegate {
    var isAllowCropping = false
    
    fileprivate var scrollView: UIScrollView!
    fileprivate var imageView: UIImageView!
    fileprivate var cropOverlayView: SOCropOverlayView!
    fileprivate var xOffset: CGFloat!
    fileprivate var yOffset: CGFloat!
    
    
    
    //------------------------------------------- SCALE RECT
    fileprivate static func scaleRect(_ rect: CGRect, scale: CGFloat) -> CGRect {
        return CGRect(
            x: rect.origin.x * scale,
            y: rect.origin.y * scale,
            width: rect.size.width * scale,
            height: rect.size.height * scale)
    }
    
    
    
    //------------------------------------------- IMG CROP
    var imgCrop: UIImage? {
        get {
            return self.imageView.image
        }
        set {
            self.imageView.image = newValue
        }
    }
    
    
    
    //------------------------------------------- CROP SIZE
    var cropSize: CGSize {
        get {
            return self.cropOverlayView.cropSize
        }
        
        set {
            if let view = self.cropOverlayView {
                view.cropSize = newValue
            } else {
                if self.isAllowCropping {
                    self.cropOverlayView = SOResizableCropOverlayView(frame: self.bounds,
                                                                      initialContentSize: CGSize(width: newValue.width, height: newValue.height))
                } else {
                    self.cropOverlayView = SOCropOverlayView(frame: self.bounds)
                }
                self.cropOverlayView.cropSize = newValue
                self.addSubview(self.cropOverlayView)
            }
        }
        
    }
    
    
    
    //------------------------------------------- INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.isUserInteractionEnabled = true
        self.backgroundColor = UIColor.black
        self.scrollView = ScrollView(frame: frame)
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.delegate = self
        self.scrollView.clipsToBounds = false
        self.scrollView.decelerationRate = 0
        self.scrollView.backgroundColor = UIColor.clear
        self.addSubview(self.scrollView)
        
        self.imageView = UIImageView(frame: self.scrollView.frame)
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.backgroundColor = UIColor.black
        self.scrollView.addSubview(self.imageView)
        
        self.scrollView.minimumZoomScale =
            self.scrollView.frame.width / self.scrollView.frame.height
        self.scrollView.maximumZoomScale = 20
        self.scrollView.setZoomScale(1.0, animated: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
   
    
    //------------------------------------------- OVERRIDE LAYOUT SUBVIEWS
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = self.cropSize;
        let toolbarSize = CGFloat(UIDevice.current.userInterfaceIdiom == .pad ? 0 : 54)
        self.xOffset = floor((self.bounds.width - size.width) * 0.5)
        self.yOffset = floor((self.bounds.height - toolbarSize - size.height) * 0.5)
        
        let height = self.imgCrop!.size.height
        let width = self.imgCrop!.size.width
        
        var factor: CGFloat = 0
        var factoredHeight: CGFloat = 0
        var factoredWidth: CGFloat = 0
        
        if width > height {
            factor = width / size.width
            factoredWidth = size.width
            factoredHeight =  height / factor
        } else {
            factor = height / size.height
            factoredWidth = width / factor
            factoredHeight = size.height
        }
        
        self.cropOverlayView.frame = self.bounds
        self.scrollView.frame = CGRect(x: xOffset, y: yOffset, width: size.width, height: size.height)
        self.scrollView.contentSize = CGSize(width: size.width, height: size.height)
        self.imageView.frame = CGRect(x: 0, y: floor((size.height - factoredHeight) * 0.5),
                                      width: factoredWidth, height: factoredHeight)
    }
    
    
    //------------------------------------------- VIEW FOR ZOOMING
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    
    
    /*------------------------------------------- CROPPED IMAGE
     1 -  Calculate rect that needs to be cropped
     2 - transform visible rect to image orientation using "ORIENTATION TRANSFORMED FOT THE RECT OF THE IMAGE"
     3 - finally crop image
     */
    
    func croppedImage() -> UIImage {
        // 1
        var visibleRect = isAllowCropping ?
            calcVisibleRectForResizeableCropArea() : calcVisibleRectForCropArea()
        
        // 2
        let rectTransform = orientationTransformedRectOfImage(imgCrop!)
        visibleRect = visibleRect.applying(rectTransform);
        
        // 3
        let imageRef = imgCrop!.cgImage?.cropping(to: visibleRect)
        let result = UIImage(cgImage: imageRef!, scale: imgCrop!.scale,
                             orientation: imgCrop!.imageOrientation)
        
        return result
    }
    
    
    
    /*------------------------------------------- CALC VISIBLE RECT FOR RESIZABLE CROP AREA
     
     4) first of all, get the size scale by taking a look at the real image dimensions. Here it
     doesn't matter if you take the width or the hight of the image, because it will always
     be scaled in the exact same proportion of the real image
     
     5) get the postion of the cropping rect inside the image
     
     */
    
    fileprivate func calcVisibleRectForResizeableCropArea() -> CGRect {
        
        //4
        let resizableView = cropOverlayView as! SOResizableCropOverlayView
        var sizeScale = self.imageView.image!.size.width / self.imageView.frame.size.width
        sizeScale *= self.scrollView.zoomScale
        
        //5
        var visibleRect = resizableView.contentView.convert(resizableView.contentView.bounds, to: imageView)
        visibleRect = SOImageCropView.scaleRect(visibleRect, scale: sizeScale)
        return visibleRect
    }
    
    
    
    
    
    /*------------------------------------------- CALC VISIBLE RECT FOR CROP AREA
     6)  scaled width/height in regards of real width to crop width
     7)  extract visible rect from scrollview and scale it
     */
    
    fileprivate func calcVisibleRectForCropArea() -> CGRect {
        
        //6
        let scaleWidth = imgCrop!.size.width / cropSize.width
        let scaleHeight = imgCrop!.size.height / cropSize.height
        var scale: CGFloat = 0
        
        if cropSize.width == cropSize.height {
            scale = max(scaleWidth, scaleHeight)
        } else if cropSize.width > cropSize.height {
            scale = imgCrop!.size.width < imgCrop!.size.height ?
                max(scaleWidth, scaleHeight) :
                min(scaleWidth, scaleHeight)
        } else {
            scale = imgCrop!.size.width < imgCrop!.size.height ?
                min(scaleWidth, scaleHeight) :
                max(scaleWidth, scaleHeight)
        }
        
        // 7
        var visibleRect = scrollView.convert(scrollView.bounds, to:imageView)
        visibleRect = SOImageCropView.scaleRect(visibleRect, scale: scale)
        
        return visibleRect
    }
    
    
    
    /*------------------------------------------- ORIENTATION TRANSFORMED REDCT OF IMAGE
     transform the rectangle, when the orientation of the image changes
     */
    
    
    
    fileprivate func orientationTransformedRectOfImage(_ image: UIImage) -> CGAffineTransform {
        var rectTransform: CGAffineTransform!
        
        switch image.imageOrientation {
        case .left:
            rectTransform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2)).translatedBy(x: 0, y: -image.size.height)
        case .right:
            rectTransform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2)).translatedBy(x: -image.size.width, y: 0)
        case .down:
            rectTransform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi)).translatedBy(x: -image.size.width, y: -image.size.height)
        default:
            rectTransform = CGAffineTransform.identity
        }
        
        return rectTransform.scaledBy(x: image.scale, y: image.scale)
    }
}

```





## SOResizableCropOverlayView
```swift

internal class SOResizableCropOverlayView: SOCropOverlayView {
    fileprivate let kBorderWidth: CGFloat = 12
    
    var contentView: UIView!
    var cropBorderView: SOCropBorderView!
    
    fileprivate var initialContentSize = CGSize(width: 0, height: 0)
    fileprivate var resizingEnabled: Bool!
    fileprivate var anchor: CGPoint!
    fileprivate var startPoint: CGPoint!
    
    var widthValue: CGFloat!
    var heightValue: CGFloat!
    var xValue: CGFloat!
    var yValue: CGFloat!
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set {
            super.frame = newValue
            
            let toolbarSize = CGFloat(UIDevice.current.userInterfaceIdiom == .pad ? 0 : 54)
            let width = self.bounds.size.width
            let height = self.bounds.size.height
            
            contentView?.frame = CGRect(x: (
                width - initialContentSize.width) / 2,
                                        y: (height - toolbarSize - initialContentSize.height) / 2,
                                        width: initialContentSize.width,
                                        height: initialContentSize.height)
            
            cropBorderView?.frame = CGRect(
                x: (width - initialContentSize.width) / 2 - kBorderWidth,
                y: (height - toolbarSize - initialContentSize.height) / 2 - kBorderWidth,
                width: initialContentSize.width + kBorderWidth * 2,
                height: initialContentSize.height + kBorderWidth * 2)
        }
    }
    
    
    //------------------------------------------- INIT
    init(frame: CGRect, initialContentSize: CGSize) {
        super.init(frame: frame)
        
        self.initialContentSize = initialContentSize
        self.addContentViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    /*------------------------------------------- TOUCHES BEGAN
     Use "fillMultiplyer()"
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchPoint = touch.location(in: cropBorderView)
            
            anchor = self.calculateAnchorBorder(touchPoint)
            fillMultiplyer()
            resizingEnabled = true
            startPoint = touch.location(in: self.superview)
        }
    }
    
    //------------------------------------------- TOUCHES MOVED
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if resizingEnabled! {
                self.resizeWithTouchPoint(touch.location(in: self.superview))
            }
        }
    }
    
    
    //------------------------------------------- DRAW
    override func draw(_ rect: CGRect) {
        //fill outer rect
        UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).set()
        UIRectFill(self.bounds)
        
        //fill inner rect
        UIColor.clear.set()
        UIRectFill(self.contentView.frame)
    }
    
    
    
    //------------------------------------------- ADD CONTENT VIEW
    fileprivate func addContentViews() {
        let toolbarSize = CGFloat(UIDevice.current.userInterfaceIdiom == .pad ? 0 : 54)
        let width = self.bounds.size.width
        let height = self.bounds.size.height
        
        contentView = UIView(frame: CGRect(x: (
            width - initialContentSize.width) / 2,
                                           y: (height - toolbarSize - initialContentSize.height) / 2,
                                           width: initialContentSize.width,
                                           height: initialContentSize.height))
        contentView.backgroundColor = UIColor.clear
        self.cropSize = contentView.frame.size
        self.addSubview(contentView)
        
        cropBorderView = SOCropBorderView(frame: CGRect(
            x: (width - initialContentSize.width) / 2 - kBorderWidth,
            y: (height - toolbarSize - initialContentSize.height) / 2 - kBorderWidth,
            width: initialContentSize.width + kBorderWidth * 2,
            height: initialContentSize.height + kBorderWidth * 2))
        self.addSubview(cropBorderView)
    }
    
    
    
    /*------------------------------------------- CALCULATE ANCHOR BORDER
     1 - Pythagoras is watching you :)
     */
    fileprivate func calculateAnchorBorder(_ anchorPoint: CGPoint) -> CGPoint {
        let allHandles = getAllCurrentHandlePositions()
        var closest: CGFloat = 3000
        var anchor: CGPoint!
        
        for handlePoint in allHandles {
            
            // 1
            let xDist = handlePoint.x - anchorPoint.x
            let yDist = handlePoint.y - anchorPoint.y
            let dist = sqrt(xDist * xDist + yDist * yDist)
            
            closest = dist < closest ? dist : closest
            anchor = closest == dist ? handlePoint : anchor
        }
        
        return anchor
    }
    
    
    
    /*------------------------------------------- GET ALL CURRENT HANDLERS POSITION
     1 - starting with the upper left corner and then following the rect clockwise
     */
    fileprivate func getAllCurrentHandlePositions() -> [CGPoint] {
        let leftX: CGFloat = 0
        let rightX = cropBorderView.bounds.size.width
        let centerX = leftX + (rightX - leftX) / 2
        
        let topY: CGFloat = 0
        let bottomY = cropBorderView.bounds.size.height
        let middleY = topY + (bottomY - topY) / 2
        
        // 1
        let TL = CGPoint(x: leftX, y: topY)
        let TC = CGPoint(x: centerX, y: topY)
        let TR = CGPoint(x: rightX, y: topY)
        let MR = CGPoint(x: rightX, y: middleY)
        let BR = CGPoint(x: rightX, y: bottomY)
        let BC = CGPoint(x: centerX, y: bottomY)
        let BL = CGPoint(x: leftX, y: bottomY)
        let ML = CGPoint(x: leftX, y: middleY)
        
        return [TL, TC, TR, MR, BR, BC, BL, ML]
    }
    
    
    
    
    /*------------------------------------------- RESIZING WITH TOUCH POINT
     This is the place where all the magic happends
     prevent goint offscreen...
     */
    fileprivate func resizeWithTouchPoint(_ point: CGPoint) {
        
        let border = kBorderWidth * 2
        var pointX = point.x < border ? border : point.x
        var pointY = point.y < border ? border : point.y
        pointX = pointX > self.superview!.bounds.size.width - border ?
            self.superview!.bounds.size.width - border : pointX
        pointY = pointY > self.superview!.bounds.size.height - border ?
            self.superview!.bounds.size.height - border : pointY
        
        let heightNew = (pointY - startPoint.y) * heightValue
        let widthNew = (startPoint.x - pointX) * widthValue
        let xNew = -1 * widthNew * xValue
        let yNew = -1 * heightNew * yValue
        
        var newFrame =  CGRect(
            x: cropBorderView.frame.origin.x + xNew,
            y: cropBorderView.frame.origin.y + yNew,
            width: cropBorderView.frame.size.width + widthNew,
            height: cropBorderView.frame.size.height + heightNew);
        newFrame = self.preventBorderFrameFromGettingTooSmallOrTooBig(newFrame)
        self.resetFrame(to: newFrame)
        startPoint = CGPoint(x: pointX, y: pointY)
    }
    
    
    
    
    /*------------------------------------------- PREVENT BORDER FRAME FROM GETTING UP TOO SMALL OR TOO BIG
     1 - get toolbar size using "UserInterfaceIdiom"
     2 - set "newFrame" dimensions to "CropBorderView" if it exceeds certain width, height or changes its position
     */
    fileprivate func preventBorderFrameFromGettingTooSmallOrTooBig(_ frame: CGRect) -> CGRect {
        
        //  1
        let toolbarSize = CGFloat(UIDevice.current.userInterfaceIdiom == .pad ? 0 : 54)
        var newFrame = frame
        
        
        // 2
        if newFrame.size.width < 64 {
            newFrame.size.width = cropBorderView.frame.size.width
            newFrame.origin.x = cropBorderView.frame.origin.x
        }
        if newFrame.size.height < 64 {
            newFrame.size.height = cropBorderView.frame.size.height
            newFrame.origin.y = cropBorderView.frame.origin.y
        }
        
        if newFrame.origin.x < 0 {
            newFrame.size.width = cropBorderView.frame.size.width +
                (cropBorderView.frame.origin.x - self.superview!.bounds.origin.x)
            newFrame.origin.x = 0
        }
        
        if newFrame.origin.y < 0 {
            newFrame.size.height = cropBorderView.frame.size.height +
                (cropBorderView.frame.origin.y - self.superview!.bounds.origin.y)
            newFrame.origin.y = 0
        }
        
        if newFrame.size.width + newFrame.origin.x > self.frame.size.width {
            newFrame.size.width = self.frame.size.width - cropBorderView.frame.origin.x
        }
        
        if newFrame.size.height + newFrame.origin.y > self.frame.size.height - toolbarSize {
            newFrame.size.height = self.frame.size.height -
                cropBorderView.frame.origin.y - toolbarSize
        }
        
        return newFrame
    }
    
    
    //------------------------------------------- RESET FRAME
    fileprivate func resetFrame(to frame: CGRect) {
        cropBorderView.frame = frame
        contentView.frame = frame.insetBy(dx: kBorderWidth, dy: kBorderWidth)
        cropSize = contentView.frame.size
        self.setNeedsDisplay()
        cropBorderView.setNeedsDisplay()
    }
    
    
    //------------------------------------------- FILL MULTIPLYER
    fileprivate func fillMultiplyer() {
        heightValue = anchor.y == 0 ?
            -1 : anchor.y == cropBorderView.bounds.size.height ? 1 : 0
        widthValue = anchor.x == 0 ?
            1 : anchor.x == cropBorderView.bounds.size.width ? -1 : 0
        xValue = anchor.x == 0 ? 1 : 0
        yValue = anchor.y == 0 ? 1 : 0
    }
}



```





## SOCropOverlayView


```swift
internal class SOCropOverlayView: UIView {
    
    var cropSize: CGSize!
    var toolbar: UIToolbar!
    
    
    //------------------------------------------- INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundColor = UIColor.clear
        self.isUserInteractionEnabled = true
    }
    
    
    
    /*------------------------------------------- DRAW
     1 - fill outer rect
     2 - fill inner border
     3 - fill inner rect
     */
    override func draw(_ rect: CGRect) {
        
        let toolbarSize = CGFloat(UIDevice.current.userInterfaceIdiom == .pad ? 0 : 54)
        
        let width = self.frame.width
        let height = self.frame.height - toolbarSize
        
        let heightSpan = floor(height / 2 - self.cropSize.height / 2)
        let widthSpan = floor(width / 2 - self.cropSize.width / 2)
        
        // 1
        UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).set()
        UIRectFill(self.bounds)
        
        // 2
        UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).set()
        UIRectFrame(CGRect(x: widthSpan - 2, y: heightSpan - 2, width: self.cropSize.width + 4,
                           height: self.cropSize.height + 4))
        
        // 3
        UIColor.clear.set()
        UIRectFill(CGRect(x: widthSpan, y: heightSpan, width: self.cropSize.width, height: self.cropSize.height))
    }
}


```
