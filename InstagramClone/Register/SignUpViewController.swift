import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    let email = UITextField()
    let paswordView = UIView()
    let password = UITextField()
    let eyeTap = UIButton()
    let logIn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
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
//        email.delegate = self
        
        
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
//        password.delegate = self
        
        paswordView.addSubview(eyeTap)
        eyeTap.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-5)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(40)
        }
        
        view.addSubview(logIn)
        logIn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(516)
            make.left.equalToSuperview().offset(42)
            make.right.equalToSuperview().offset(-42)
            make.height.equalTo(36)
        }
        logIn.clipsToBounds = true
        logIn.layer.cornerRadius = 10
        logIn.backgroundColor = UIColor(red: 24/255, green: 119/255, blue: 242/255, alpha: 1)
        logIn.setTitle("Sign Up", for: .normal)
        logIn.addTarget(self, action: #selector(signUp), for: .touchUpInside)

    }
    
    @objc func signUp(){
        print("SingUp")
        guard let emailText = email.text, !emailText.isEmpty,
         let passwordText = password.text, !passwordText.isEmpty
        else{
            print("textlar bo'sh")
            return
        }
        Auth.auth().createUser(withEmail: emailText, password:passwordText) { result, error in
            if let error = error{
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default))
                self.present(alert, animated: true)
                
            }
        }
                
        
    }


}
