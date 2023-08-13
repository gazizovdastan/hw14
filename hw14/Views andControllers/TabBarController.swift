//
//  TabBarController.swift
//  hw14
//
//  Created by Dastan on 13.08.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .systemBlue
        tabBar.backgroundColor = .systemBackground

        setupTabBarViewControllers()
    }
    
    func setupTabBarViewControllers() {
        let mediaLibrary = UIViewController()
        mediaLibrary.tabBarItem = UITabBarItem(title: "Медиатека",
                                               image: UIImage(systemName: "photo.fill.on.rectangle.fill"),
                                               tag: 0)
        mediaLibrary.view.backgroundColor = .systemBackground
        let mediaLibraryNavigationController = UINavigationController(rootViewController: mediaLibrary)
        
        let forYou = UIViewController()
        forYou.tabBarItem = UITabBarItem(title: "Для Вас",
                                         image: UIImage(systemName: "heart.text.square.fill"),
                                         tag: 1)
        forYou.view.backgroundColor = .systemBackground
        let forYouNavigationController = UINavigationController(rootViewController: forYou)
        
        let albums = MyAlbumsViewController()
        albums.tabBarItem = UITabBarItem(title: "Альбомы",
                                         image: UIImage(systemName: "square.stack.fill"),
                                         tag: 2)
        albums.view.backgroundColor = .systemBackground
        let albumsNavigationController = UINavigationController(rootViewController: albums)
        albumsNavigationController.navigationBar.prefersLargeTitles = true
        
        let search = UIViewController()
        search.tabBarItem = UITabBarItem(title: "Поиск",
                                         image: UIImage(systemName: "magnifyingglass"),
                                         tag: 3)
        search.view.backgroundColor = .systemBackground
        let searchNavigationController = UINavigationController(rootViewController: search)
        
        let controllers = [mediaLibraryNavigationController,
                           forYouNavigationController,
                           albumsNavigationController,
                           searchNavigationController]
        
        self.setViewControllers(controllers, animated: true)
    }
}

