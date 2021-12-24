//
//  TourInfoRequest.swift
//  tourApp
//
//  Created by 김주영 on 2021/12/23.
//

import Foundation
import Alamofire

class TourInfoRequest {
    func getCountyTourSpot(_ viewController: firstViewController, data: String) {
        let url = "https://tour.chungbuk.go.kr/openapi/tourInfo/attr.do?pageUnit=100&searchCnd=tourNm&searchKrwd=\(data)"
        
        AF.request(url, method: .get, parameters: nil, headers: nil).responseDecodable(of: TourInfoResponse.self) { (response) in
            
            
            switch response.result{
            case .success(let response):
                viewController.didSuccess(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getCountyRestaurantSpot(_ viewController: secondViewController, data: String) {
        let url = "https://tour.chungbuk.go.kr/openapi/tourInfo/food.do?searchCnd=tourNm&searchKrwd=\(data)"
        
        AF.request(url, method: .get, parameters: nil, headers: nil).responseDecodable(of: TourInfoResponse.self) { (response) in
            
            
            switch response.result{
            case .success(let response):
                viewController.didSuccess(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getCountyHotelSpot(_ viewController: thirdViewController, data: String) {
        let url = "https://tour.chungbuk.go.kr/openapi/tourInfo/stay.do?searchCnd=tourNm&searchKrwd=\(data)"
        
        AF.request(url, method: .get, parameters: nil, headers: nil).responseDecodable(of: TourInfoResponse.self) { (response) in
            
            
            switch response.result{
            case .success(let response):
                viewController.didSuccess(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
