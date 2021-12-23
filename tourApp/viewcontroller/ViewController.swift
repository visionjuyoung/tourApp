//
//  ViewController.swift
//  tourApp
//
//  Created by 김주영 on 2021/12/22.
//

import UIKit
import KakaoSDKUser

class ViewController: UIViewController {

    @IBOutlet weak var kakaoLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setView() {
        kakaoLoginButton.layer.cornerRadius = 10
    }

    @IBAction func kakaoLogin(_ sender: Any) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabMenu") as? UITabBarController else { return }
                                       self.present(vc, animated: true, completion: nil)
                    _ = oauthToken
                }
            }
    }
    
}

