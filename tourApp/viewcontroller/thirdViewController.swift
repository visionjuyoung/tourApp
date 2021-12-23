//
//  thirdViewController.swift
//  tourApp
//
//  Created by 김주영 on 2021/12/22.
//

import UIKit

class thirdViewController: UIViewController {
    
    enum County: String {
        case 청주 = "%EC%B2%AD%EC%A3%BC"
        case 충주 = "%EC%B6%A9%EC%A3%BC"
        case 단양 = "%EB%8B%A8%EC%96%91"
        case 제천 = "%EC%A0%9C%EC%B2%9C"
        case 음성 = "%EC%9D%8C%EC%84%B1"
        case 괴산 = "%EA%B4%B4%EC%82%B0"
        case 진천 = "%EC%A7%84%EC%B2%9C"
        case 증평 = "%EC%A6%9D%ED%8F%89"
        case 보은 = "%EB%B3%B4%EC%9D%80"
        case 옥천 = "%EC%98%A5%EC%B2%9C"
        case 영동 = "%EC%98%81%EB%8F%99"
    }
    
    var locationParam: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let county = CountyInfo.shared
        guard let name = county.county as? String else { return }
        //print(name)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
