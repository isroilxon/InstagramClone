//
//  SearchViewController.swift
//  InstagramClone
//
//  Created by mac on 02/04/23.
//

import UIKit
import SDWebImage

class SearchViewController: UIViewController {
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.navigationBar.isHidden = true
//    }
    var collectionView: UICollectionView?
    
    let search = UISearchController()
    let arr = ["https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg","https://img.freepik.com/premium-photo/image-colorful-galaxy-sky-generative-ai_791316-9864.jpg?w=2000","https://images.pexels.com/photos/39866/entrepreneur-startup-start-up-man-39866.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500","https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg","https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/NGC_4414_%28NASA-med%29.jpg/1200px-NGC_4414_%28NASA-med%29.jpg","https://www.samsung.com/global/galaxy/main/images/kv-galaxy-s23_s.jpg","https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200","https://hips.hearstapps.com/hmg-prod/images/2023-mclaren-artura-101-1655218102.jpg?crop=1.00xw:0.847xh;0,0.153xh&resize=1200:*","https://images.unsplash.com/photo-1596073419667-9d77d59f033f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cm9zZSUyMGZsb3dlcnxlbnwwfHwwfHw%3D&w=1000&q=80","https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819__340.jpg","https://c4.wallpaperflare.com/wallpaper/974/565/254/windows-11-windows-10-minimalism-hd-wallpaper-thumb.jpg","https://img.freepik.com/free-photo/blossom-floral-bouquet-decoration-colorful-beautiful-flowers-background-garden-flowers-plant-pattern-wallpapers-greeting-cards-postcards-design-wedding-invites_90220-1103.jpg?w=2000","https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg","https://img.freepik.com/premium-photo/image-colorful-galaxy-sky-generative-ai_791316-9864.jpg?w=2000","https://images.pexels.com/photos/39866/entrepreneur-startup-start-up-man-39866.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500","https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg","https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/NGC_4414_%28NASA-med%29.jpg/1200px-NGC_4414_%28NASA-med%29.jpg","https://www.samsung.com/global/galaxy/main/images/kv-galaxy-s23_s.jpg","https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200","https://hips.hearstapps.com/hmg-prod/images/2023-mclaren-artura-101-1655218102.jpg?crop=1.00xw:0.847xh;0,0.153xh&resize=1200:*","https://images.unsplash.com/photo-1596073419667-9d77d59f033f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cm9zZSUyMGZsb3dlcnxlbnwwfHwwfHw%3D&w=1000&q=80","https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819__340.jpg","https://c4.wallpaperflare.com/wallpaper/974/565/254/windows-11-windows-10-minimalism-hd-wallpaper-thumb.jpg","https://img.freepik.com/free-photo/blossom-floral-bouquet-decoration-colorful-beautiful-flowers-background-garden-flowers-plant-pattern-wallpapers-greeting-cards-postcards-design-wedding-invites_90220-1103.jpg?w=2000","https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg","https://img.freepik.com/premium-photo/image-colorful-galaxy-sky-generative-ai_791316-9864.jpg?w=2000","https://images.pexels.com/photos/39866/entrepreneur-startup-start-up-man-39866.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500","https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg","https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/NGC_4414_%28NASA-med%29.jpg/1200px-NGC_4414_%28NASA-med%29.jpg","https://www.samsung.com/global/galaxy/main/images/kv-galaxy-s23_s.jpg","https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200","https://hips.hearstapps.com/hmg-prod/images/2023-mclaren-artura-101-1655218102.jpg?crop=1.00xw:0.847xh;0,0.153xh&resize=1200:*","https://images.unsplash.com/photo-1596073419667-9d77d59f033f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cm9zZSUyMGZsb3dlcnxlbnwwfHwwfHw%3D&w=1000&q=80","https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819__340.jpg","https://c4.wallpaperflare.com/wallpaper/974/565/254/windows-11-windows-10-minimalism-hd-wallpaper-thumb.jpg","https://img.freepik.com/free-photo/blossom-floral-bouquet-decoration-colorful-beautiful-flowers-background-garden-flowers-plant-pattern-wallpapers-greeting-cards-postcards-design-wedding-invites_90220-1103.jpg?w=2000"]


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.searchController = search
        collection()


    }
    
    func collection(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = .init(width: 50, height: 100)
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        collectionView.translatesAutoresizingMaskIntoConstraints =  false
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor,constant: 10).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        collectionView.backgroundColor = .white
    }

}
extension SearchViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                arr.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SearchCollectionViewCell
        cell.img.sd_setImage(with: URL(string:arr[indexPath.row]))
        return cell
    }
    

    
    
}
