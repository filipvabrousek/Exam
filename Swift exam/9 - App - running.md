# Runny - v3

# View controller
```swift

import UIKit
import CoreLocation
import MapKit


// variable initializations
var LM = CLLocationManager()
var travelled:Double = 0
var AL = CLLocation(latitude: 0, longitude: 0)
var AL2  = CLLocationCoordinate2D(latitude: 0, longitude: 0)
let date = Date()
let formatter = DateFormatter()


// needed arrays
var activities: [Any] = []
var decodedRuns: [Run] = []




class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    //outlets
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var map: MKMapView!
    @IBOutlet var startBtn: UIButton!
    @IBOutlet var finishBtn: UIButton!
    
    //variables
    var timer = Timer()
    var sec = 0
    var minutes = 0
    var startLocation:CLLocation!
    var lastLocation: CLLocation!
    var distanceString = ""
    
    // arrays
    lazy var locations = [CLLocation]()
    var myLocations: [CLLocation] = []
   
    
    
   
  
    /*-----------------------------------------------------------VIEW DID LOAD---------------------------------------------------------*/
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
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.increaseTimer), userInfo: nil, repeats: true)
        LM.startUpdatingLocation()
        
        travelled = 0
    }
    
    
    /*-----------------------------------------------------------FINISH---------------------------------------------------------*/
    
    @IBAction func finishRun(_ sender: Any) {
        LM.stopUpdatingLocation()
        timer.invalidate()
        
        let dividedDistance = travelled / 1000
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        let distS = String(dividedDistance)
        
        
        
        let llat = AL.coordinate.latitude
        let llon = AL.coordinate.longitude
        
        
        let run = Run(date: result, distance: distS, lat: llat, lon: llon)
        activities.append(run)
        
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: activities)
        UserDefaults.standard.set(encodedData, forKey: "ACTIVITIES")
        UserDefaults.standard.synchronize() 
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
    
    
 
## VC - UPDATE LOCATION
```swift
 /*-----------------------------------------------------------UPDATE LOCATION---------------------------------------------------------
     1 - Show location on the map
     2 - add polyline
     3 - update distance and save location to "locations" array
     */
    
    
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
        
        
        //3
        for location in locations {
            
            if location.horizontalAccuracy < 20 {
                //update distance
                if self.locations.count > 0 {
                    travelled += round(location.distance(from: AL))
                }
                
                distanceString = String(round(travelled) / 1000)
                self.distanceLabel.text = distanceString
                self.locations.append(location)
            }
        }
        
        AL = CLLocation(latitude: lat, longitude: lon)
        
    }
    

```
    
  ## VC - RENDERER 
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
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var goalLabel: UILabel!
    
    
    var total:Double = 0.0
    var progressVal = 0
      

    /*-----------------------------------------------------------TABLE VIEW---------------------------------------------------------*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return decodedRuns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = String(describing: decodedRuns[indexPath.row].date)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            decodedRuns.remove(at: indexPath.row)
            tableView.reloadData()
            
             let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: decodedRuns)
            UserDefaults.standard.set(encodedData, forKey: "ACTIVITIES")
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        i = indexPath.row
        performSegue(withIdentifier: "toActivityDetail", sender: nil)
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        goalLabel.alpha = 0
    }
    
    
    /*-----------------------------------------------------------VIEW DID APPEAR---------------------------------------------------------
     */
    override func viewDidAppear(_ animated: Bool) {
      
      
        
        
        let progress = UserDefaults.standard.value(forKey: "PROGRESS")
        progressBar.setProgress(progress as! Float, animated: false) //between 0.0 (0) and 0.1 (100)
        
        if let tempProgress = UserDefaults.standard.value(forKey: "PROGRESS"){
        progressVal = tempProgress as! Int
        }
        
       
        if (progressVal * 100) > 100{
        progressBar.progressTintColor = UIColor.green
      
        UIView.animate(withDuration: 1, animations: {
            self.goalLabel.alpha = 1
            self.goalLabel.isHighlighted = true
        })
        }
        
        
        let decoded = UserDefaults.standard.object(forKey: "ACTIVITIES") as! Data
        if let dec =  NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [Run] {
        decodedRuns = dec
        }
               
        tableView.reloadData()

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
    @IBOutlet var map: MKMapView!
    
    var total = 0.0
    
     
    /*-----------------------------------------------------------VIEW DID LOAD---------------------------------------------------------*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let decoded = UserDefaults.standard.object(forKey: "ACTIVITIES") as! Data
        if let dec =  NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [Run] {
            decodedRuns = dec
        }
        
        
        dateLabel.text = String(decodedRuns[i].date)
        distanceLabel.text = decodedRuns[i].distance
        
        let deg1 = CLLocationDegrees(decodedRuns[i].lat)
        let deg2 = CLLocationDegrees(decodedRuns[i].lon)
        let loc = CLLocationCoordinate2D(latitude: deg1, longitude: deg2)
        
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: loc, span: span)
        self.map.setRegion(region, animated: true)
        
        print(loc)
        
        
        
        //--------------------------------------------------
        
        let geoLoc = CLLocation(latitude: deg1, longitude: deg2)
        
        var title = ""
        
        CLGeocoder().reverseGeocodeLocation(geoLoc , completionHandler: { (placemarks, error) in
            
            if error != nil {
                print(error ?? "Something went wrong")
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
            
            
            if title == "" {
                title = "Added \(NSDate())"
            }
            
            
            self.locationLabel.text = title
        });
        
        
        
        //--------------------------------------------------
        total = total + Double(decodedRuns[i].distance)!
        
        let progressTotal = Float(total / 100) //1 km will be 0.01 :  10 will be 0.1
        var deserveReward = false
        
        
        if progressTotal == 1{
            deserveReward = true
        }
        
        UserDefaults.standard.set(progressTotal, forKey: "PROGRESS")
        UserDefaults.standard.set(deserveReward, forKey: "REWARD")
        
    }   
}

```

# Run.swift

```swift
import Foundation
import CoreLocation

class Run: NSObject, NSCoding {
    
    struct Keys {
      
        static let date = "date"
        static let distance = "distance"
        static let lat = "lat"
        static let lon = "lon"
        
    }
    
    
    private var _date = ""
    private var _distance = ""
    private var _lat = 0.0
    private var _lon = 0.0
 
    
    override init() {}
    
    
    init(date: String, distance: String, lat:Double, lon:Double) {
        
        self._date = date
        self._distance = distance
        self._lat = lat
        self._lon = lon
       
    }
    

    
    required init(coder aDecoder:NSCoder){
        
        if let dataObject = aDecoder.decodeObject(forKey: Keys.date) as? String{
            _date = dataObject
        }
        
        if let dataObject2 = aDecoder.decodeObject(forKey: Keys.distance) as? String {
            _distance = dataObject2
        }
        
        if let latObject = aDecoder.decodeDouble(forKey: Keys.lat) as? Double {
            _lat = latObject
        }
        
        if let lonObject = aDecoder.decodeDouble(forKey: Keys.lon) as? Double{
            _lon = lonObject
        }
    }
    
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(_date, forKey: Keys.date)
        aCoder.encode(_distance, forKey: Keys.distance)
        aCoder.encode(_lat, forKey: Keys.lat)
        aCoder.encode(_lon, forKey: Keys.lon)
    }
    
    
    var date: String {
        get {
        return _date
        }
        
        set{
        _date = newValue
        }
    }
    
    var distance: String {
        get {
            return _distance
        }
        
        set {
            _distance = newValue
        }
    }

   
    var lat: Double{
        get{
        return _lat
        }
        
        set{
        _lat = newValue
        }
    }
    
    
    var lon: Double{
        get{
            return _lon
        }
        
        set{
            _lon = newValue
        }
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
    
    
    
    init(polyline:MKPolyline, colors: [UIColor]){
        self.polyline = polyline
        self.colors = colors
        super.init(overlay:polyline)
    }
    
    
    
    
    /*---------------------------------------------------------DRAW--------------------------------------------------------------
     
     1 - create a gradient
     2 - define path properties
     3 - replace path with stroked version, so we can clip
     4 - create bounding box
     5 - draw gradient in the clipped context of the path
     
     */
    
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        
        
        //  variables 
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
    
    
    
    
    
    /*-------------------------------------------------------CREATE PATH FROM POLYLINE------------------------------------------------------*/
    
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
    
    
    
    /*-------------------------------------------------------CALCULATE NUMBER OF STOPS------------------------------------------------------*/
    fileprivate func calculateNumberOfStops() -> [CGFloat]{
        let stopDifference = (1 / Double(cgColors.count))
        
        return Array(stride(from: 0, to: 1+stopDifference, by: stopDifference))
            .map { (value) -> CGFloat in
                return CGFloat(value)
        }
        
    }
    
 }
 

```
