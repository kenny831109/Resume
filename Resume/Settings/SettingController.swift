//
//  SettingController.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/10/17.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

class SettingController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  func setupView() {
    view.backgroundColor = .white
    navigationItem.title = "Setting"
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
}
