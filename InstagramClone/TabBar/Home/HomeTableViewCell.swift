//
//  HomeTableViewCell.swift
//  InstagramClone
//
//  Created by mac on 02/04/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    let avatar = UIImageView()
    let nick = UILabel()
    let locate = UILabel()
    let post = UIImageView()
    let spots = UIButton()
    let like = UIButton()
    let write = UIButton()
    let send = UIButton()
    let save = UIButton()
    let likes = UILabel()
    let comment = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        avatar.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(avatar)
        avatar.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20 ).isActive = true
        avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: 50).isActive = true
        avatar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        avatar.clipsToBounds = true
        avatar.layer.cornerRadius = 25
        
        contentView.addSubview(spots)
        spots.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-15)
            make.centerY.equalTo(avatar.snp_centerYWithinMargins)
            make.height.equalTo(5)
            make.width.equalTo(15)
        }
        spots.setImage(UIImage(systemName: "circle.grid.2x1.fill"), for: .normal)
        spots.setTitleColor(.black, for: .normal)
        
        nick.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nick)
        nick.text = "Apple"
        nick.font = .systemFont(ofSize: 15)
        nick.centerYAnchor.constraint(equalTo: avatar.centerYAnchor).isActive = true
        nick.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 10).isActive = true
        
        locate.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(locate)
        locate.font = .systemFont(ofSize: 13)
        locate.bottomAnchor.constraint(equalTo: avatar.bottomAnchor).isActive = true
        locate.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 10).isActive = true
        locate.textColor = .gray
        

        
        post.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(post)
        post.heightAnchor.constraint(equalToConstant: 375).isActive = true
        post.topAnchor.constraint(equalTo: locate.bottomAnchor, constant: 20).isActive = true
        post.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        post.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true

        contentView.addSubview(like)
        like.snp.makeConstraints { make in
            make.top.equalTo(post.snp_bottomMargin).offset(30)
            make.left.equalToSuperview().offset(15)
            make.height.width.equalTo(22)
        }
        like.setImage(UIImage(systemName: "heart"), for: .normal)
        like.tintColor = .black
        
        contentView.addSubview(write)
        write.snp.makeConstraints { make in
            make.top.equalTo(post.snp_bottomMargin).offset(30)
            make.left.equalTo(like.snp_rightMargin).offset(15)
            make.height.width.equalTo(25)        }
        write.setImage(UIImage(systemName: "message"), for: .normal)
        write.tintColor = .black
        
        contentView.addSubview(send)
        send.snp.makeConstraints { make in
            make.top.equalTo(post.snp_bottomMargin).offset(30)
            make.left.equalTo(write.snp_rightMargin).offset(15)
            make.height.width.equalTo(25)
        }
        send.setImage(UIImage(systemName: "location"), for: .normal)
        send.tintColor = .black
        
        contentView.addSubview(save)
        save.snp.makeConstraints { make in
            make.top.equalTo(post.snp_bottomMargin).offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.width.equalTo(25)
        }
        save.setImage(UIImage(systemName: "bookmark"), for: .normal)
        save.tintColor = .black
        
        likes.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(likes)
        likes.topAnchor.constraint(equalTo: save.bottomAnchor, constant: 10).isActive = true
        likes.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        likes.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        likes.numberOfLines = 0
        likes.font = .systemFont(ofSize: 14)
        
        comment.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(comment)
        comment.topAnchor.constraint(equalTo: likes.bottomAnchor, constant: 10).isActive = true
        comment.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        comment.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        comment.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        comment.numberOfLines = 0
        comment.font = .systemFont(ofSize: 14)
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
