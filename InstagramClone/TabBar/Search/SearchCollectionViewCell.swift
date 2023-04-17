//
//  SearchCollectionViewCell.swift
//  InstagramClone
//
//  Created by mac on 17/04/23.
//

import UIKit
import SnapKit

class SearchCollectionViewCell: UICollectionViewCell {
    let img = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(img)
        img.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(1)
            make.right.bottom.equalToSuperview().offset(-1)
            make.height.equalTo(124)
            make.width.equalTo(121)
        }
        img.image = UIImage(named: "person1")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
