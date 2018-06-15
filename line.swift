
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
