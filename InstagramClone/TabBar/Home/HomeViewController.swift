import UIKit
import SDWebImage
import FirebaseAuth

class HomeViewController: UIViewController {
    let instagram = UIImageView()
    let topHeart = UIImageView()
    let topMess = UIImageView()
    let scroll = UIScrollView()
    let stack = UIStackView()
    let arr = ["person1", "person2","person3","person1","person3","person1","person3"]
    let img = UIImageView()
    let saveImg = UIImageView()
    let tablView = UITableView()
    var model = [
        Instagram(locate: "Kobe, Japan", avatar: "person1", post: "https://a-static.besthdwallpaper.com/iphone-14-abstract-purple-wallpaper-3440x1440-104275_15.jpg",  likes: "Liked: 83567", comment: "Do you ever see your closest friend, or the love of your life, post a stunning, jaw-dropping photo that makes your heart skip a beat, but you’re stumped about what to comment on those pictures?", like: false, save: false),
        Instagram(locate: "Lagos, Nigeria", avatar: "person2", post: "https://c4.wallpaperflare.com/wallpaper/297/22/531/lake-blue-moonlight-moon-wallpaper-preview.jpg", likes: "Liked: 78986", comment: "Here are some good comments for Instagram pictures you can use the next time you see something nice on the platform.", like: true, save: false),
        Instagram(locate: "Sindhudurga", avatar: "person3", post: "https://cdn.wallpapersafari.com/79/73/TvuM20.jpg", likes: "Liked: 87879", comment: "You will find some of the best comments for Instagram posts in the below list.", like: false, save: false)]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(instagram)
        instagram.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(65)
            make.left.equalToSuperview().offset(21)
            make.height.equalTo(35)
            make.width.equalTo(123)
        }
        instagram.image = UIImage(named: "logoText")
        
        view.addSubview(topMess)
        topMess.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(65)
            make.right.equalToSuperview().offset(-20)
            make.height.width.equalTo(25)
        }
        topMess.image = UIImage(systemName: "ellipsis.message")
        topMess.tintColor = .black
        
        view.addSubview(topHeart)
        topHeart.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(65)
            make.right.equalTo(topMess.snp_leftMargin).offset(-20)
            make.height.width.equalTo(25)
        }
        topHeart.image = UIImage(systemName: "heart")
        topHeart.tintColor = .black
        
        view.addSubview(scroll)
        scroll.snp.makeConstraints { make in
            make.top.equalTo(instagram.snp_bottomMargin).offset(15)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(75)
        }
        
        scroll.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.equalTo(instagram.snp_bottomMargin).offset(15)
            make.right.equalToSuperview()
            make.left.equalToSuperview().offset(15)
        }
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        for i  in arr {
            let labelView = UIView()
            let img = UIImageView()
            let imgCircle = UIImageView()
            
            labelView.addSubview(imgCircle)
            imgCircle.snp.makeConstraints { make in
                make.left.right.top.bottom.equalToSuperview()
                make.height.width.equalTo(73)
            }
            imgCircle.image = UIImage(named: "cyrcle")
            
            imgCircle.addSubview(img)
            img.snp.makeConstraints { make in
                make.centerX.centerY.equalToSuperview()
                make.height.width.equalTo(63)
            }
            img.clipsToBounds = true
            img.layer.cornerRadius = 63/2
            img.image = UIImage(named: i)
            
            stack.addArrangedSubview(labelView)
            
        }
            
            tablView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(tablView)
            tablView.register(HomeTableViewCell.self, forCellReuseIdentifier: "cell")
            tablView.dataSource = self
            tablView.delegate = self
            tablView.topAnchor.constraint(equalTo: scroll.bottomAnchor, constant: 15).isActive = true
            tablView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
            tablView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            tablView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            
            img.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(img)
            img.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            img.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            img.heightAnchor.constraint(equalToConstant: 100).isActive = true
            img.widthAnchor.constraint(equalToConstant: 100).isActive = true
            img.image = UIImage(systemName: "heart.fill")
            img.isHidden = true
            
            saveImg.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(saveImg)
            saveImg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            saveImg.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            saveImg.heightAnchor.constraint(equalToConstant: 100).isActive = true
            saveImg.widthAnchor.constraint(equalToConstant: 100).isActive = true
            saveImg.image = UIImage(systemName: "bookmark.fill")
            saveImg.isHidden = true


            // Do any additional setup after loading the view.
        }
        
        @objc func likeButton(_ button:UIButton){
            img.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                self.img.isHidden = true
            }
            model[button.tag].like.toggle()
            let cell = tablView.cellForRow(at: IndexPath(row: button.tag, section: 0)) as! HomeTableViewCell
            
            cell.like.setImage(UIImage(systemName: model[button.tag].like ? "heart.fill" : "heart"), for: .normal)
        }
        
        @objc func saveButton(_ button: UIButton){
            saveImg.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                self.saveImg.isHidden = true
            }
            model[button.tag].save.toggle()
            let cell = tablView.cellForRow(at: IndexPath(row: button.tag, section: 0)) as! HomeTableViewCell
            cell.save.setImage(UIImage(systemName: model[button.tag].save ? "bookmark.fill" : "bookmark"), for: .normal)

        }
        
        @objc func messageButton(){
            let vc = MessageViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
        
        @objc func sendButton(){
            let vc = SendViewController()
            present(vc, animated: true)    }
    }


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        cell.selectionStyle = .none
        cell.like.tag = indexPath.row
        cell.save.tag = indexPath.row
        cell.like.addTarget(self, action: #selector(likeButton(_:)), for: .touchUpInside)
        cell.save.addTarget(self, action: #selector(saveButton(_:)), for: .touchUpInside)
        cell.write.addTarget(self, action: #selector(messageButton), for: .touchUpInside)
        cell.send.addTarget(self, action: #selector(sendButton), for: .touchUpInside)
        
        cell.locate.text = model[indexPath.row].locate
        cell.post.sd_setImage(with: URL(string:model[indexPath.row].post ))
        cell.avatar.image = UIImage(named: model[indexPath.row].avatar)
        cell.likes.text = model[indexPath.row].likes
        cell.comment.text = model[indexPath.row].comment
        cell.like.setImage(UIImage(systemName: model[indexPath.row].like ? "heart.fill" : "heart"), for: .normal)
        cell.save.setImage(UIImage(systemName: model[indexPath.row].save ? "bookmark.fill" : "bookmark"), for: .normal)
        
        
        return cell
    }
}
    
