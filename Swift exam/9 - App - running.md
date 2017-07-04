# Runny

# View controller
```swift
import UIKit
import CoreLocation
import MapKit


// variables - 7
var LM = CLLocationManager()
var traveledDistance:Double = 0
var distancesArray: [String] = []
var AL = CLLocation(latitude: 0, longitude: 0)
let date = Date()
let formatter = DateFormatter()
var dateArray:[String] = []

//locationArrays
var locationArray:[String] = []
var locationArray2:[Double] = [] //lat
var locationArray3:[Double] = [] //lon




class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    //outlets - 4
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var map: MKMapView!
    @IBOutlet var startBtn: UIButton!
    @IBOutlet var finishBtn: UIButton!
    
    //variables - 8
    var timer = Timer()
    var sec = 0
    var minutes = 0
    lazy var locations = [CLLocation]()
    var startLocation:CLLocation!
    var lastLocation: CLLocation!
    var distanceString = ""
    var myLocations: [CLLocation] = []
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LM.delegate = self
        LM.desiredAccuracy = kCLLocationAccuracyBest
        LM.requestWhenInUseAuthorization()
        map.showsUserLocation = true
        map.mapType = MKMapType.standard
        map.delegate = self
    }
    
    
    
    
    /*-----------------------------------------------------------START---------------------------------------------------------*/
    
    @IBAction func startRun(_ sender: Any) {
        startBtn.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.increaseTimer), userInfo: nil, repeats: true)
        LM.startUpdatingLocation()
        traveledDistance = 0
    }
    
    
    /*-----------------------------------------------------------FINISH---------------------------------------------------------*/
    
    @IBAction func finishRun(_ sender: Any) {
        LM.stopUpdatingLocation()
        timer.invalidate()
        
        let dividedDistance = traveledDistance / 1000
        
        if dividedDistance > 0 {
            distancesArray.append(String(dividedDistance))
        }
        
       
        UserDefaults.standard.set(distancesArray, forKey: "DISTANCE")
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        dateArray.append(result)
        UserDefaults.standard.set(dateArray, forKey: "DATE")
        
    }
    
    
    /*-----------------------------------------------------------TIMER---------------------------------------------------------*/
    func increaseTimer(){
        
        if sec < 60{
            sec += 1
            timerLabel.text = String(minutes) + ":" + String(sec)
            
        } else {
            sec = 0
            minutes += 1
            timerLabel.text = String(minutes) + ":" + String(sec)
            
        }
    }
    
}




```
    
    
 
## Update location
* 1 - Show location on the map
* 2 - add polyline
* 3 - update distance and save location to "locations" array



```swift
 func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //  1
        myLocations.append(locations[0])
        
        let location:CLLocation = locations[0]
        let lat = location.coordinate.latitude
        let lon = location.coordinate.longitude
        let latDelta:CLLocationDegrees = 0.05
        let lonDelta:CLLocationDegrees = 0.05
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        
        let region = MKCoordinateRegion(center: map.userLocation.coordinate, span: span)
        self.map.setRegion(region, animated: true)
        
        
        //  2
        if (myLocations.count > 1){
            let sourceIndex = myLocations.count - 1
            let destinationIndex = myLocations.count - 2
            
            let c1 = myLocations[sourceIndex].coordinate
            let c2 = myLocations[destinationIndex].coordinate
            var a = [c1, c2]
            let polyline = MKPolyline(coordinates: &a, count: a.count)
            self.map.add(polyline)
        }
        
        // 3
        for location in locations {
           
            if location.horizontalAccuracy < 20 {
                //update distance
                if self.locations.count > 0 {
                    traveledDistance += round(location.distance(from: AL))
                }
                
                distanceString = String(round(traveledDistance) / 1000)
                self.distanceLabel.text = distanceString
                //save location
                self.locations.append(location)
            }
        }
        
        AL = CLLocation(latitude: lat, longitude: lon)
    }
    
    

    
    
```
    
    
    
    
    
    
## Renderer
```swift
   
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline{
            let gradientColors = [UIColor.green, UIColor.blue, UIColor.yellow, UIColor.red]
            let polylineRenderer = ColorLine(polyline: overlay as! MKPolyline, colors: gradientColors)
            polylineRenderer.strokeColor = UIColor.blue
            polylineRenderer.lineWidth = 4
            return polylineRenderer
        }
        return MKPolylineRenderer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



```



# History View Controller
* 1 - Fetch data
* 2 - count total
* 3 - display progress
```swift

import UIKit
import CoreData


var i = 0


class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    var total:Double = 0.0
    
    
    
    
    /*-----------------------------------------------------------TABLE VIEW---------------------------------------------------------*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return distancesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = String(describing: distancesArray[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            distancesArray.remove(at: indexPath.row)
            tableView.reloadData()
            UserDefaults.standard.set(distancesArray, forKey: "DISTANCE")
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        i = indexPath.row
        performSegue(withIdentifier: "toActivityDetail", sender: nil)
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
 
    /*----------------------------------------------VIEW DID APPEAR----------------------------------------------*/
    override func viewDidAppear(_ animated: Bool) {
      
        // 1
        let itemsObject = UserDefaults.standard.object(forKey: "DISTANCE")
        
        if let tempItems = itemsObject as? [String] {
            distancesArray = tempItems
        }
        
        tableView.reloadData()
        
        
        // 2
        for dist in distancesArray{
            total += Double(dist)!
        }
        
        totalLabel.text = String(total)
        
        
        //  3
        var progressTotal = Float(total / 100) //1 km will be 0.01 :  10 will be 0.1
        UserDefaults.standard.set(progressTotal, forKey: "PROGRESS")
        
        let progress = UserDefaults.standard.value(forKey: "PROGRESS")
        progressBar.setProgress(progress as! Float, animated: true) //between 0.0 (0) and 0.1 (100)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


```




# Activity View Controller
* 1 - Fetch data
* 2 - display data from specific index

```swift
import UIKit
import MapKit
import CoreLocation

class ActivityViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    // variables - 3
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    
    
    /*----------------------------------------------VIEW DID LOAD----------------------------------------------*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  1
        let itemsObject = UserDefaults.standard.object(forKey: "DISTANCE")
        
        if let tempItems = itemsObject as? [String] {
            distancesArray = tempItems
        }
        
        let itemsObject1 = UserDefaults.standard.object(forKey: "DATE")
        
        if let tempItems = itemsObject1 as? [String] {
            dateArray = tempItems
        }
        
        
        //  2
        distanceLabel.text = distancesArray[i]
        getAdress()
        dateLabel.text = dateArray[i]
        
    }
    
    
    
    /*-----------------------------------------------------------GET ADRESS---------------------------------------------------------*/
    
    func getAdress(){
        CLGeocoder().reverseGeocodeLocation(AL, completionHandler: { (placemarks, error) in
            
            var title = ""
            if error != nil {
                print(error)
            } else {
                
                if let placemark = placemarks?[0]{
                    if placemark.subThoroughfare != nil{
                        title += placemark.subThoroughfare! + " "
                        
                    }
                    
                    if placemark.thoroughfare != nil {
                        title += placemark.thoroughfare!
                    }
                }
            }
            
            if title == ""{
                title = "Added \(NSDate())"
            }
            
            locationArray.append(title)
            self.locationLabel.text = locationArray[i]
        });
        
    }
    
}








```





# colorline.swift
* 1 - create a gradient
* 2 - define path properties
* 3 - replace path with stroked version, so we can clip
* 4 - create bounding box
* 5 - draw gradient in the clipped context of the path
```swift
 
 import MapKit
 
 class ColorLine: MKOverlayPathRenderer {
    
    // variables - 5
    var polyline : MKPolyline
    var colors:[UIColor]
    var border: Bool = false
    var borderColor: UIColor?
    
    
    fileprivate var cgColors:[CGColor]{
        return colors.map({(color) -> CGColor in
            return color.cgColor
        })
    }
    
    
    
    /*--------------------------------------------------------------------------------*/
    init(polyline:MKPolyline, colors: [UIColor]){
        self.polyline = polyline
        self.colors = colors
        super.init(overlay:polyline)
    }
    
    
    
    
  /*------------------------------------DRAW------------------------------------------*/
 
    
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        
        
        //  variables - 5
        let baseWidth: CGFloat = self.lineWidth / zoomScale
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let stopValues = calculateNumberOfStops()
        let locations:[CGFloat] = stopValues
        let gradient = CGGradient(colorsSpace: colorSpace, colors: cgColors as CFArray, locations: locations)
        
        
        if self.border{
            context.setLineWidth(baseWidth * 2)
            context.setLineJoin(CGLineJoin.round)
            context.setLineCap(CGLineCap.round)
            context.addPath(self.path)
            context.setStrokeColor(self.borderColor?.cgColor ?? UIColor.white.cgColor)
            context.strokePath()
        }

        
        //  2
        context.setLineWidth(baseWidth)
        context.setLineJoin(CGLineJoin.round)
        context.setLineCap(CGLineCap.round)
        context.addPath(self.path)
        
        
        //  3
        context.saveGState()
        context.replacePathWithStrokedPath()
        context.clip()
        
        //  4
        let boundingBox = self.path.boundingBoxOfPath
        let gradientStart = boundingBox.origin
        let gradientEnd = CGPoint(x: boundingBox.maxX, y: boundingBox.maxY)
        
        // 5
        if let gradient = gradient {
            context.drawLinearGradient(gradient, start: gradientStart, end: gradientEnd, options: CGGradientDrawingOptions.drawsBeforeStartLocation)
        }
        
        context.restoreGState()
        super.draw(mapRect, zoomScale: zoomScale, in: context)
    }
    
   
    
    
    
    /*------------------------------------------CREATE PATH FROM POLYLINE-------------------------------------*/

    override func createPath() {
        let path: CGMutablePath = CGMutablePath()
        var pathIsEmpty:Bool = true
        
        
        for i in 0...self.polyline.pointCount - 1{
            
            let point:CGPoint = self.point(for: self.polyline.points()[i])
            if pathIsEmpty{
                path.move(to: point)
                pathIsEmpty = false
            } else {
                path.addLine(to: point)
            }
        }
        self.path = path
    }
    
    
    
    /*-------------------------------------------CALCULATE NUMBER OF STOPS----------------------------------------------*/
    fileprivate func calculateNumberOfStops() -> [CGFloat]{
        let stopDifference = (1 / Double(cgColors.count))
        
        return Array(stride(from: 0, to: 1+stopDifference, by: stopDifference))
            .map { (value) -> CGFloat in
                return CGFloat(value)
        }   
    }
    
 }
 
 

```
