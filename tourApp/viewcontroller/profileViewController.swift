//
//  profileViewController.swift
//  tourApp
//
//  Created by 김주영 on 2021/12/22.
//

import UIKit
import KakaoSDKUser

class profileViewController: UIViewController {

    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var backImageView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nicknameLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                
                self.setView(user: user!)
            }
        }
    }
    
    func setView(user: User) {
        self.naviBar.topItem?.title = "관광정보"
        self.backImageView.layer.cornerRadius = 50
        
        guard let name = user.kakaoAccount?.profile?.nickname as? String else { return }
        nicknameLabel.text = "\(name) 님"
        
        let url = user.kakaoAccount?.profile?.profileImageUrl
        let data = try? Data(contentsOf: url!)
        
        profileImageView.image = UIImage(data: data!)
        profileImageView.layer.cornerRadius = 45
        

    }

    @IBAction func logOut(_ sender: Any) {
        UserApi.shared.unlink {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("unlink() success.")
            }
        }
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        present(vc, animated: false, completion: nil)
    }
    

}
