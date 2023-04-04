//
//  RegsterViewController.swift
//  InstagramClone
//
//  Created by mac on 01/04/23.
//

import UIKit
import SnapKit
import FirebaseAuth

class RegsterViewController: UIViewController, UITextFieldDelegate {
    let logo = UIImageView()
    let logoName = UIImageView()
    let facebookbut = UIButton()
    let or = UILabel()
    let faceImg = UIImageView()
    let email = UITextField()
    let paswordView = UIView()
    let password = UITextField()
    let eyeTap = UIButton()
    let forgetBut = UILabel()
    let logIn = UIButton()
    let dontHave = UILabel()
    let sinUpLabel = UILabel()
    let sinUpBut = UIButton()
    let byFace = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        sinUpBut.addTarget(self, action: #selector(signTap), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(signTap))
        sinUpLabel.addGestureRecognizer(tap)
        view.addSubview(logo)
        logo.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(65)
            make.height.width.equalTo(92)
            make.centerX.equalToSuperview()
        }
        logo.image = UIImage(named: "logo")
        
        view.addSubview(logoName)
        logoName.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(177)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(194)
        }
        logoName.image = UIImage(named: "logoText")
        
        view.addSubview(facebookbut)
        facebookbut.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(237)
            make.left.equalToSuperview().offset(42)
            make.right.equalToSuperview().offset(-42)
            make.height.equalTo(36)
        }
        facebookbut.clipsToBounds = true
        facebookbut.layer.cornerRadius = 10
        facebookbut.backgroundColor = UIColor(red: 24/255, green: 119/255, blue: 242/255, alpha: 1)
        facebookbut.setTitle("Continue with Facebook", for: .normal)
        
        view.addSubview(or)
        or.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(308)
            make.centerX.equalToSuperview()
        }
        or.text = "or"
        or.textColor = .gray
        or.font = .systemFont(ofSize: 15)
        
        facebookbut.addSubview(faceImg)
        faceImg.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(view).offset(67)
            make.width.height.equalTo(32)
        }
        faceImg.image = UIImage(named: "facebook")
        
        view.addSubview(email)
        email.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(366)
            make.left.equalToSuperview().offset(42)
            make.right.equalToSuperview().offset(-42)
            make.height.equalTo(42)
        }
        email.clipsToBounds = true
        email.layer.cornerRadius = 10
        email.backgroundColor = UIColor(red: 224/255, green: 221/255, blue: 221/255, alpha: 0.5)
        email.placeholder = " phone number,username, or email"
        email.layer.borderColor = UIColor.systemGray3.cgColor
        email.layer.borderWidth = 1.0
        email.delegate = self
        
        
        view.addSubview(paswordView)
        paswordView.snp.makeConstraints { make in
            make.top.equalTo(email.snp_bottomMargin).offset(20)
            make.left.equalToSuperview().offset(42)
            make.right.equalToSuperview().offset(-42)
            make.height.equalTo(42)
        }
        paswordView.clipsToBounds = true
        paswordView.layer.cornerRadius = 10
        paswordView.backgroundColor = UIColor(red: 224/255, green: 221/255, blue: 221/255, alpha: 0.5)
        paswordView.layer.borderColor = UIColor.systemGray3.cgColor
        paswordView.layer.borderWidth = 1.0
        
        paswordView.addSubview(password)
        password.snp.makeConstraints { make in
            make.top.bottom.left.equalToSuperview()
            make.right.equalToSuperview().offset(-50)
        }
        password.placeholder = " password"
        password.isSecureTextEntry = true
        password.delegate = self
        
        paswordView.addSubview(eyeTap)
        eyeTap.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-5)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(40)
        }
        
        eyeTap.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeTap.addTarget(self, action: #selector(eyeButton), for: .touchUpInside)
        
        
        view.addSubview(forgetBut)
        forgetBut.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(468)
            make.right.equalToSuperview().offset(-42)
        }
        forgetBut.text = "Forgot password?"
        forgetBut.textColor = UIColor(red: 24/255, green: 119/255, blue: 242/255, alpha: 1)
        forgetBut.font = .systemFont(ofSize: 13)
        
        view.addSubview(logIn)
        logIn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(516)
            make.left.equalToSuperview().offset(42)
            make.right.equalToSuperview().offset(-42)
            make.height.equalTo(36)
        }
        logIn.clipsToBounds = true
        logIn.layer.cornerRadius = 10
        logIn.backgroundColor = UIColor(red: 24/255, green: 119/255, blue: 242/255, alpha: 0.36)
        logIn.setTitle("Log In", for: .normal)
        logIn.isEnabled = false
        logIn.addTarget(self, action: #selector(checkPass), for: .touchUpInside)
        
        view.addSubview(dontHave)
        dontHave.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(581)
            make.left.equalToSuperview().offset(98)
        }
        dontHave.text = "Don't have an account?"
        dontHave.font = .systemFont(ofSize: 15)
        dontHave.textColor = UIColor(red: 174/255, green: 169/255, blue: 169/255, alpha: 1)
        
        view.addSubview(sinUpBut)
        sinUpBut.snp.makeConstraints { make in
            make.left.equalTo(dontHave.snp_rightMargin).offset(10)
            make.centerY.equalTo(dontHave.snp_centerYWithinMargins)
        }
        
        sinUpBut.addSubview(sinUpLabel)
        sinUpLabel.snp.makeConstraints { make in
            make.top.right.left.bottom.equalToSuperview()
        }
        sinUpLabel.text = "sign up"
        sinUpLabel.textColor = UIColor(red: 38/255, green: 127/255, blue: 243/255, alpha: 1)
        sinUpLabel.font = .systemFont(ofSize: 15)
        
        
        view.addSubview(byFace)
        byFace.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-30)
            make.height.equalTo(32)
            make.width.equalTo(107)
        }
        byFace.image = UIImage(named: "byFacebook")
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("a")
        if email.text?.count ?? 0 >= 1 , password.text?.count ?? 0 >= 1{
            logIn.backgroundColor = UIColor(red: 24/255, green: 119/255, blue: 242/255, alpha: 1)
            logIn.isEnabled = true
            
        }
        else{
            logIn.backgroundColor = UIColor(red: 24/255, green: 119/255, blue: 242/255, alpha: 0.36)
            logIn.isEnabled = false
        }
        return true
    }
    
    @objc func eyeButton(){
        password.isSecureTextEntry = false
        eyeTap.setImage(UIImage(systemName: "eye"), for: .normal)
    }
    
    @objc func signTap(){
        print("SignUp")
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func checkPass(){
        print("login")
        if let emailText = email.text,
           let parolText = password.text,
           !emailText.isEmpty,
           !parolText.isEmpty {
            Auth.auth().signIn(withEmail: emailText, password: parolText) { [self] result, error in
                if let error = error{
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "ok", style: .default))
                    self.present(alert, animated: true)
                    print("failed")
                    print(error.localizedDescription)
                    self.paswordView.layer.borderColor = UIColor.red.cgColor
                    email.layer.borderColor = UIColor.red.cgColor
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                        self.paswordView.layer.borderColor = UIColor.systemGray3.cgColor
                        self.email.layer.borderColor = UIColor.systemGray3.cgColor
                    }
                }
                else{
                    print("succes")
                    UserDefaults.standard.set(true, forKey: "register")
                    (UIApplication.shared.delegate as? AppDelegate)?.main()
                }
            }
        }
        else{
            print("Fieldlar bo'sh")
        }
    }
    
    
}
