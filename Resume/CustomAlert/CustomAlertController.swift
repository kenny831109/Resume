//
//  CustomAlertController.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/9.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

class CustomAlertController: UIViewController {
  
  lazy var customAlertView: CustomAlertView = {
    let alert = CustomAlertView()
    alert.translatesAutoresizingMaskIntoConstraints = false
    alert.message.text = alertMessage
    alert.title.text = alertTitle
    alert.confirm.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
    return alert
  }()
  
  lazy var typeIcon: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = UIView.ContentMode.scaleAspectFill
    view.clipsToBounds = true
    switch alertType {
    case .Warning:
      view.image = #imageLiteral(resourceName: "triangle")
    case .Success:
      view.image = #imageLiteral(resourceName: "checked")
    case .Notification:
      view.image = #imageLiteral(resourceName: "alarm")
    }
    return view
  }()
  
  var alertType: CustomAlertType = .Warning
  var alertMessage: String?
  var alertTitle: String?
  
  init(message: String?, title: String?, type: CustomAlertType) {
    self.alertMessage = message
    self.alertTitle = title
    self.alertType = type
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .clear
    view.addSubview(customAlertView)
    customAlertView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
    customAlertView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
    customAlertView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    customAlertView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    view.addSubview(typeIcon)
    typeIcon.centerYAnchor.constraint(equalTo: customAlertView.topAnchor).isActive = true
    typeIcon.heightAnchor.constraint(equalToConstant: 35).isActive = true
    typeIcon.widthAnchor.constraint(equalToConstant: 35).isActive = true
    typeIcon.centerXAnchor.constraint(equalTo: customAlertView.centerXAnchor).isActive = true
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    customAlertView.transform = CGAffineTransform(scaleX: 0.8, y: 1.2)
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [],  animations: {
      self.customAlertView.transform = .identity
    })
  }
  
}

extension CustomAlertController {
  @objc func dismissAlert() {
    dismiss(animated: false, completion: nil)
  }
}
