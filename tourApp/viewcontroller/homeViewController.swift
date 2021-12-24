//
//  homeViewController.swift
//  tourApp
//
//  Created by 김주영 on 2021/12/22.
//

import UIKit
import Tabman
import Pageboy

class homeViewController: TabmanViewController {

    private var viewControllers: Array<UIViewController> = []
    
    var selectedCounty: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(selectedCounty)
        
        let county = CountyInfo.shared
        county.county = selectedCounty
        
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "firstViewController") as! firstViewController
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! secondViewController
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "thirdViewController") as! thirdViewController
        
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        viewControllers.append(vc3)
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.backgroundView.style = .blur(style: .regular)
        bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        bar.buttons.customize { (button) in
            button.tintColor = .white
            button.selectedTintColor = .black
        }
        bar.indicator.tintColor = .black
        bar.backgroundView.style = .blur(style: .regular)
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .fit
        
        addBar(bar, dataSource: self, at: .bottom)
    }
}

extension homeViewController: PageboyViewControllerDataSource, TMBarDataSource{
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        //print(viewControllers[index])
        //return viewControllers[index]
        switch index {
        case 0:
            let vc1 = storyboard?.instantiateViewController(withIdentifier: "firstViewController") as! firstViewController
            vc1.locationParam = selectedCounty
            return viewControllers[0]
        case 1:
            let vc2 = storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! secondViewController
            vc2.locationParam = selectedCounty
            return viewControllers[1]
        case 2:
            let vc3 = storyboard?.instantiateViewController(withIdentifier: "thirdViewController") as! thirdViewController
            vc3.locationParam = selectedCounty
            return viewControllers[2]
        default:
            return UIViewController()
        }
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title: "")
        switch index {
        case 0:
            item.title = "관광지"
        case 1:
            item.title = "식당"
        case 2:
            item.title = "숙소"
        default:
            print("")
        }
                
        return item
    }
}
