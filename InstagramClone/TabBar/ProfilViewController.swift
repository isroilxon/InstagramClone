//
//  ProfilViewController.swift
//  InstagramClone
//
//  Created by mac on 02/04/23.
//

import UIKit
import FirebaseAuth

class ProfilViewController: UIViewController {
    let logIn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(logIn)
        logIn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(516)
            make.left.equalToSuperview().offset(42)
            make.right.equalToSuperview().offset(-42)
            make.height.equalTo(36)
        }
        logIn.clipsToBounds = true
        logIn.layer.cornerRadius = 10
        logIn.setTitle("Log In", for: .normal)
        logIn.setTitleColor(.red, for: .normal)
        logIn.addTarget(self, action: #selector(checkPass), for: .touchUpInside)
        
    }
    
    @objc func checkPass(){
        print("sdv")
        //        Storage.storage().reference(forURL: "gs://myapp.appspot.com").child("avatar").child(userId).delete()
        //            }
        
        
    }
    
}
