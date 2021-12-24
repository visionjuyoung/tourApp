//
//  thirdViewController.swift
//  tourApp
//
//  Created by 김주영 on 2021/12/22.
//

import UIKit

class thirdViewController: UIViewController {
    
    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var key: String = ""
    
    var locationParam: String = ""
    
    var spotCount: Int = 0
    
    var spots: [detail] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        naviBar.topItem?.title = "숙소"
    
        let county = CountyInfo.shared
        
        guard let name = county.county as? String else { return }
        
        switch name {
        case "청주" :
            key = "%EC%B2%AD%EC%A3%BC"
        case "충주" :
            key = "%EC%B6%A9%EC%A3%BC"
        case "단양" :
            key = "%EB%8B%A8%EC%96%91"
        case "제천" :
            key = "%EC%A0%9C%EC%B2%9C"
        case "음성" :
            key = "%EC%9D%8C%EC%84%B1"
        case "괴산" :
            key = "%EA%B4%B4%EC%82%B0"
        case "진천" :
            key = "%EC%A7%84%EC%B2%9C"
        case "증평" :
            key = "%EC%A6%9D%ED%8F%89"
        case "보은" :
            key = "%EB%B3%B4%EC%9D%80"
        case "옥천" :
            key = "%EC%98%A5%EC%B2%9C"
        case "영동" :
            key = "%EC%98%81%EB%8F%99"
        default:
            return
        }
        TourInfoRequest().getCountyHotelSpot(self, data: key)
        setTable()
    }
    
    func setTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "spotTableViewCell", bundle: nil), forCellReuseIdentifier: "spotTableViewCell")
    }
    
    func didSuccess(_ response: TourInfoResponse) {
        spots = response.result
        self.tableView.reloadData()
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

extension thirdViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return spots.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "spotTableViewCell") as? spotTableViewCell else { return UITableViewCell() }
        cell.setData(data: spots[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
