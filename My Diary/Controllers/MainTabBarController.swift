//
//  ViewController.swift
//  My Diary
//
//  Created by Victor Kimpel on 29.07.22.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTapBar()
    }
    
    func setupTapBar() {
        
        let diaryViewController = createNavController(vc: DiaryViewController(), itemName: "Diary", ItemImage: "book")
        let tasksViewController = createNavController(vc: TasksViewController(), itemName: "Tasks", ItemImage: "text.badge.checkmark")
        let contactsViewController = createNavController(vc: ContactsTableViewController(), itemName: "Contacts", ItemImage: "person.crop.circle")
        let mapViewController = createNavController(vc: MapViewController(), itemName: "Map", ItemImage: "map")
        
        viewControllers = [diaryViewController, tasksViewController, contactsViewController, mapViewController]
    }
    
    func createNavController(vc: UIViewController, itemName: String, ItemImage: String) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: ItemImage), tag: 0)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        
        // стандартный вид navigationBar контроллера
        navController.navigationBar.scrollEdgeAppearance = navController.navigationBar.standardAppearance
        
        return navController
    }
}

