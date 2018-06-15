## Preetline


```swift
class PreetyLine: MKPolylineRenderer {
    
    var poly: MKPolyline
    var color: UIColor
    
    init(poly:MKPolyline, color: UIColor){
      self.poly = poly
      self.color = color
      super.init(overlay: poly)
    }
    
    
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        
        context.saveGState()
        context.setBlendMode(CGBlendMode.exclusion)
        
        let clear = UIColor.clear
        
        context.setFillColor(clear.cgColor)
        context.setStrokeColor(self.color.cgColor)
        context.setLineWidth(500.0)
        
        if self.polyline.pointCount > 1 {
            
            context.beginPath()
            
            let point_ = self.point(for: self.polyline.points()[0])
            
            context.move(to: CGPoint(x: point_.x, y: point_.y))
            
            for element in 1 ..< self.polyline.pointCount {
                
                let point_ = self.point(for: polyline.points()[element])
                context.addLine(to: CGPoint(x: point_.x, y: point_.y))
            }
            
            context.closePath()
            context.drawPath(using: .fillStroke)
            
        }
        
        context.restoreGState()
        
    }
    
    
}
```

## Gradient line
```swift
class PreetyLine: MKPolylineRenderer {
    
    var poly: MKPolyline
    var color: UIColor
    
    init(poly:MKPolyline, color: UIColor){
      self.poly = poly
      self.color = color
      super.init(overlay: poly)
    }
    
    
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        
        context.saveGState()
        context.setBlendMode(CGBlendMode.exclusion)
        
        let clear = UIColor.clear
        
        context.setFillColor(clear.cgColor)
        context.setStrokeColor(self.color.cgColor)
        context.setLineWidth(500.0)
        
        if self.polyline.pointCount > 1 {
            
            context.beginPath()
            
            let point_ = self.point(for: self.polyline.points()[0])
            
            context.move(to: CGPoint(x: point_.x, y: point_.y))
            
            for element in 1 ..< self.polyline.pointCount {
                
                let point_ = self.point(for: polyline.points()[element])
                context.addLine(to: CGPoint(x: point_.x, y: point_.y))
            }
            
            context.closePath()
            context.drawPath(using: .fillStroke)
            
        }
        
        context.restoreGState()
        
    }
    
    
}
*/



/*
class PrettyLine: MKOverlayPathRenderer{
    var polyline: MKPolyline
    var color: UIColor
    
    
    init(polyline: MKPolyline, color: UIColor){
        self.polyline = polyline
        self.color = color
        super.init(overlay: polyline)
    }
    
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(7)
        
        
        
        
        
        
      // Not my
            let path: CGMutablePath  = CGMutablePath()
            var pathIsEmpty: Bool = true
            
            for i in 0...self.polyline.pointCount-1 {
                
                let point: CGPoint = self.point(for: self.polyline.points()[i])
                if pathIsEmpty {
                    path.move(to: point)
                    pathIsEmpty = false
                } else {
                    path.addLine(to: point)
                }
            }
        
        
        
        
        
        // Mine
        /*
         context.setLineWidth(baseWidth * 2)
         context.setLineJoin(CGLineJoin.round)
         context.setLineCap(CGLineCap.round)
         context.addPath(self.path)
         context.setStrokeColor(self.borderColor?.cgColor ?? UIColor.white.cgColor)
         context.strokePath()
         }*/
        
        context.addPath(path)
        context.setStrokeColor(UIColor.white.cgColor)
     
        
     //   context.drawPath(using: .fillStroke)
        context.replacePathWithStrokedPath()
        context.clip()
        super.draw(mapRect, zoomScale: zoomScale, in: context)
    }
   
}
*/


/*
class CSCLine: MKOverlayPathRenderer {
    
    var polyline : MKPolyline
    var colors:[UIColor]
    
    var border: Bool = false
    var borderColor: UIColor?
    
    fileprivate var cgColors:[CGColor] {
        return colors.map({ (color) -> CGColor in
            return color.cgColor
        })
    }
    
    //MARK: Initializers
    init(polyline: MKPolyline, colors: [UIColor]) {
        self.polyline = polyline
        self.colors = colors
        
        super.init(overlay: polyline)
    }
    
    //MARK: Override methods
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        
        /*
         Set path width relative to map zoom scale
         */
        let baseWidth: CGFloat = self.lineWidth / zoomScale
        
        if self.border {
            context.setLineWidth(baseWidth * 2)
            context.setLineJoin(CGLineJoin.round)
            context.setLineCap(CGLineCap.round)
            context.addPath(self.path)
            context.setStrokeColor(self.borderColor?.cgColor ?? UIColor.white.cgColor)
            context.strokePath()
        }
        
        /*
         Create a gradient from the colors provided with evenly spaced stops
         */
        let colorspace = CGColorSpaceCreateDeviceRGB()
        let stopValues = calculateNumberOfStops()
        let locations: [CGFloat] = stopValues
        let gradient = CGGradient(colorsSpace: colorspace, colors: cgColors as CFArray, locations: locations)
        
        /*
         Define path properties and add it to context
         */
        context.setLineWidth(baseWidth)
        context.setLineJoin(CGLineJoin.round)
        context.setLineCap(CGLineCap.round)
        
        context.addPath(self.path)
        
        /*
         Replace path with stroked version so we can clip
         */
        context.saveGState();
        
        context.replacePathWithStrokedPath()
        context.clip();
        
        /*
         Create bounding box around path and get top and bottom points
         */
        let boundingBox = self.path.boundingBoxOfPath
        let gradientStart = boundingBox.origin
        let gradientEnd   = CGPoint(x:boundingBox.maxX, y:boundingBox.maxY)
        
        /*
         Draw the gradient in the clipped context of the path
         */
        if let gradient = gradient {
            context.drawLinearGradient(gradient, start: gradientStart, end: gradientEnd, options: CGGradientDrawingOptions.drawsBeforeStartLocation);
        }
        
        
        context.restoreGState()
        
        
        super.draw(mapRect, zoomScale: zoomScale, in: context)
    }
    
    /*
     Create path from polyline
     Thanks to Adrian Schoenig
     (http://adrian.schoenig.me/blog/2013/02/21/drawing-multi-coloured-lines-on-an-mkmapview/ )
     */
    override func createPath() {
        let path: CGMutablePath  = CGMutablePath()
        var pathIsEmpty: Bool = true
        
        for i in 0...self.polyline.pointCount-1 {
            
            let point: CGPoint = self.point(for: self.polyline.points()[i])
            if pathIsEmpty {
                path.move(to: point)
                pathIsEmpty = false
            } else {
                path.addLine(to: point)
            }
        }
        self.path = path
    }
    
    //MARK: Helper Methods
    fileprivate func calculateNumberOfStops() -> [CGFloat] {
        
        let stopDifference = (1 / Double(cgColors.count))
        
        return Array(stride(from: 0, to: 1+stopDifference, by: stopDifference))
            .map { (value) -> CGFloat in
                return CGFloat(value)
        }
    }
 
}
```
