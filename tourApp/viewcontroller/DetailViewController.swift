//
//  DetailViewController.swift
//  tourApp
//
//  Created by 김주영 on 2021/12/24.
//

import UIKit
import CoreLocation
import MapKit

class DetailViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var areaSe: String = ""
    var lng: String = ""
    var tourImg: String = ""
    var telno: String = ""
    var tourSe: String = ""
    var tourNm: String = ""
    var adres: String = ""
    var lat: String = ""
    var intrcn: String = ""
    var operTime: String = ""
    
    var currentWeather: [Weather] = []
    var weather: String = ""
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var spotImage: UIImageView!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var telNumLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var explainTextView: UITextView!
    @IBOutlet weak var weatherLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        myMap.showsUserLocation = true
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            myMap.isZoomEnabled = true
            myMap.isScrollEnabled = true
        }
        WeatherInfoRequest().getCountyTourSpot(self, lat: Float(lat)!, lng: Float(lng)!)
        setView()
        let latitude = Double(lat)
        let longtitude = Double(lng)
        myMap.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude!, longitude: longtitude!), latitudinalMeters: 200, longitudinalMeters: 200)
        
        let loca = MKPointAnnotation()
        loca.title = tourNm
        loca.coordinate = CLLocationCoordinate2D(latitude: latitude!, longitude: longtitude!)
        myMap.addAnnotation(loca)
    }
    
    func didSuccess(_ response: WetherInfoResponse) {
        currentWeather = response.weather
        weather = currentWeather[0].description
    }
    
    func setView() {
        titleLabel.text = tourNm
        let url = URL(string: tourImg)
        let xurl = URL(string: "https://tour.chungbuk.go.kr/site/www/images/common/no_img.jpg")
        spotImage.load(url: url ?? xurl!)
        sectionLabel.text = "분류 : \(tourSe)"
        areaLabel.text = "지역 : \(areaSe)"
        addressLabel.text = "주소 : \(adres)"
        telNumLabel.text = "전화번호 : \(telno)"
        timeLabel.text = "운영시간 : \(operTime)"
        explainTextView.text = intrcn
        weatherLabel.text = "날씨 : \(weather)"
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }
}

