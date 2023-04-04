//
//  TabBarViewController.swift
//  InstagramClone
//
//  Created by mac on 02/04/23.
//

import UIKit


class TabBarViewController: UITabBarController {
    
    let tabHome = HomeViewController()
    let tabSearch = SearchViewController()
    let tabAdd = AddViewController()
    let tabReels = ReelsViewController()
    let tabProfil = ProfilViewController()
    let imgHome1 = UIImage(systemName: "house")
    let imgHome2 = UIImage(systemName: "house.fill")
    let imgCat1 = UIImage(systemName: "magnifyingglass")
    let imgCat2 = UIImage(systemName: "text.magnifyingglass")
    let imgMess1 = UIImage(systemName: "plus.app")
    let imgMess2 = UIImage(systemName: "plus.app.fill")
    let imgShop1 = UIImage(systemName: "video")
    let imgShop2 = UIImage(systemName: "video.fill")
    let imgAcc1 = UIImage(systemName: "person.circle")
    let imgAcc2 = UIImage(systemName: "person.circle.fill")
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "tabbar"


        
        UITabBar.appearance().tintColor = UIColor.black
                
        tabHome.tabBarItem = UITabBarItem(title: "", image: imgHome1, selectedImage: imgHome2)
        tabSearch.tabBarItem = UITabBarItem(title: "", image: imgCat1, selectedImage: imgCat2)
        tabAdd.tabBarItem = UITabBarItem(title: "", image: imgMess1, selectedImage: imgMess2)
        tabReels.tabBarItem = UITabBarItem(title: "", image: imgShop1, selectedImage: imgShop2)
        tabProfil.tabBarItem = UITabBarItem(title: "", image: imgAcc1, selectedImage: imgAcc2)
        
        let viewControllerList = [tabHome, tabSearch,tabReels,tabAdd,tabProfil]
        viewControllers = viewControllerList.map {
            UINavigationController(rootViewController: $0)
        }
        tabBarController?.tabBar.delegate = self

    }


}
