//
//  countyListViewController.swift
//  tourApp
//
//  Created by 김주영 on 2021/12/23.
//

import UIKit

class countyListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    let countys: [String] = ["단양", "제천", "충주", "음성", "괴산", "진천", "증평", "청주", "옥천", "보은", "영동"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.naviBar.topItem?.title = "지역"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "countyTableViewCell", bundle: nil), forCellReuseIdentifier: "countyTableViewCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "countyTableViewCell") as? countyTableViewCell else { return UITableViewCell() }
        cell.setData(data: countys[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "homeViewController") as? homeViewController else { return }
        vc.selectedCounty = countys[indexPath.row]
        present(vc, animated: true, completion: nil)
    }
    
}
