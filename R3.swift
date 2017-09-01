    //  3
        let sec  = decodedRuns[i].duration
        
        let timeObj = Time(seconds: sec)
        let time = timeObj.createTime
        durationLabel.text = String(time)

        // 4
        let paceObj = Pace(seconds: sec, minutes: sec / 60, distance: Double(decodedRuns[i].distance)!)
        paceLabel.text = paceObj.createPace
        
        
        
        //
//  Run.swift
//  Runny
//
//  Created by Filip Vabroušek on 09.08.17.
//  Copyright © 2017 Filip Vabroušek. All rights reserved.
//

import Foundation

/*------------------------------------------------------RUN---------------------------------------------------------------*/
class Run: NSObject, NSCoding {
    
    
    // HAS TO BE A STRING !!
    struct Keys {
        
        static let date = "date"
        static let distance = "distance"
        static let lat = "lat"
        static let lon = "lon"
        static let duration = "duration" // in seconds
        
    }
    
    
    
    
    private var _date = ""
    private var _distance = ""
    private var _lat = 0.0
    private var _lon = 0.0
    private var _duration = 0 // in seconds
    
    
    
    override init() {}
    
    
    /*---------------------------------------------------------------------------------------------------------*/
    init(date: String, distance: String, lat:Double, lon:Double, duration: Int) {
        
        self._date = date
        self._distance = distance
        self._lat = lat
        self._lon = lon
        self._duration = duration
        
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
        
        if let durationObject = aDecoder.decodeInteger(forKey: Keys.duration) as? Int{
            _duration = durationObject
        }
    }
    
    
    
    
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(_date, forKey: Keys.date)
        aCoder.encode(_distance, forKey: Keys.distance)
        aCoder.encode(_lat, forKey: Keys.lat)
        aCoder.encode(_lon, forKey: Keys.lon)
        aCoder.encode(_duration, forKey: Keys.duration)
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
    
    var duration: Int {
        get {
            return _duration
        }
        
        set{
            _duration = newValue
        }
    }
    
    
}











/*------------------------------------------------------TIME---------------------------------------------------------------*/
class Time: NSObject, NSCoding {
    
    // HAS TO BE A STRING !!
    struct Keys {
        static let seconds = "seconds"
    }
    
    private var _seconds = 0
    override init() {}
    
    
    /*---------------------------------------------------------------------------------------------------------*/
    init(seconds: Int) {
        self._seconds = seconds
    }
    
    
    
    required init(coder aDecoder:NSCoder){
        
        
        if let secObject = aDecoder.decodeInteger(forKey: Keys.seconds) as? Int{
            _seconds = secObject
        }
    }
    
    
    
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(_seconds, forKey: Keys.seconds)
    }
    
    
    var seconds: Int {
        get {
            return _seconds
        }
        
        set{
            _seconds = newValue
        }
    }
    
    var createTime:String{
        let time =  (_seconds / 3600, (_seconds % 3600) / 60, _seconds % 60)
        let (h, m, s) = time
        
        
        var strHr = String(h)
        var strMin = String(m)
        var strSec = String(s)
        
        if h < 10 {
            strHr = "0\(h)"
        }
        
        if m < 10{
            strMin = "0\(m)"
        }
        
        if s < 10{
            strSec = "0\(s)"
        }
        
        
        
        
        return "\(strHr):\(strMin):\(strSec)"
    }
    
    
    
    
}









/*------------------------------------------------------PACE---------------------------------------------------------------*/
class Pace: NSObject, NSCoding {
    
    // HAS TO BE A STRING !!
    struct Keys {
        static let seconds = "seconds"
        static let minutes = "minutes"
        static let distance = "distance"
    }
    
    private var _seconds = 0
    private var _minutes = 0
    private var _distance = 0.0
    
    
    override init() {}
    
    
    /*---------------------------------------------------------------------------------------------------------*/
    init(seconds: Int, minutes: Int, distance: Double) {
        self._seconds = seconds
        self._minutes = minutes
        self._distance = distance
    }
    
    
    
    required init(coder aDecoder:NSCoder){
        
        
        if let secObject = aDecoder.decodeInteger(forKey: Keys.seconds) as? Int{
            _seconds = secObject
        }
        
        if let minObject = aDecoder.decodeInteger(forKey: Keys.minutes) as? Int{
            _minutes = minObject
        }
        
        if let distObject = aDecoder.decodeDouble(forKey: Keys.distance) as? Double{
            _distance = distObject
        }
    }
    
    
    
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(_seconds, forKey: Keys.seconds)
        aCoder.encode(_minutes, forKey: Keys.minutes)
        aCoder.encode(_distance, forKey: Keys.distance)
    }
    
    
    var seconds: Int {
        get {
            return _seconds
        }
        
        set{
            _seconds = newValue
        }
    }
    
    var minutes: Int {
        get {
            return _minutes
        }
        
        set{
            _minutes = newValue
        }
    }
    
    var distance: Double {
        get {
            return _distance
        }
        
        set{
            _distance = newValue
        }
    }
    
    
    var createPace:String{
        let pace = Double(_minutes * 60 + _seconds) / _distance
        let mins = pace / 60
        let roundedMins = Double(floor(mins))
        let decimalSec = mins - roundedMins
        let intPace = Int(floor(roundedMins))
        let seconds = Int(floor(decimalSec * 60))
        var strSec = String(seconds)
        
        
        
        if seconds < 10 {
            strSec = "0\(seconds)"
        }
        
        
        
        return "\(intPace):\(strSec)"
    }
    
    
    
    
}


