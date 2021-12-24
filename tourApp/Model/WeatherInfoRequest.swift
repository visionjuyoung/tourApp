//
//  WeatherInfoRequest.swift
//  tourApp
//
//  Created by 김주영 on 2021/12/24.
//

import Foundation
import Alamofire

class WeatherInfoRequest {
    func getCountyTourSpot(_ viewController: firstViewController, lat: Float, lng: Float) {
        let url = "api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lng)&appid=b2a0593d3842d44a46e390dc0d320cac"
        
        AF.request(url, method: .get, parameters: nil, headers: nil).responseDecodable(of: TourInfoResponse.self) { response in
            
            switch response.result{
            case .success(let response):
                print("weather success")
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
