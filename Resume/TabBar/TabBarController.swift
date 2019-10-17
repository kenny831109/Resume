//
//  TabBarController.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/10/9.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let normalColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1)
    UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: normalColor], for: .normal)
    UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    UITabBar.appearance().barTintColor = UIColor(red: 5/255, green: 5/255, blue: 5/255, alpha: 1)
    
    let resumeVC = ResumeController()
    resumeVC.tabBarItem.title = "Resume"
    resumeVC.tabBarItem.image = #imageLiteral(resourceName: "tabBar_resume_n").withRenderingMode(.alwaysOriginal)
    resumeVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "tabBar_resume_h").withRenderingMode(.alwaysOriginal)
    
    let settingVC = SettingController()
    settingVC.tabBarItem.title = "Setting"
    settingVC.tabBarItem.image = #imageLiteral(resourceName: "tabBar_settings_n").withRenderingMode(.alwaysOriginal)
    settingVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "tabBar_settings_h").withRenderingMode(.alwaysOriginal)
    
    let navigationControllers = [resumeVC, settingVC].map({ CustomNavigationController(rootViewController: $0) })
    viewControllers = navigationControllers
  }
  
}
