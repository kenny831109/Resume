//
//  CustomAlertView.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/9.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

class CustomAlertView: UIView {
  
  let title: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "測試"
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    label.textColor = UIColor(red: 255/255, green: 55/255, blue: 95/255, alpha: 1)
    return label
  }()
  
  let message: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "測試"
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
    return label
  }()
  
  let confirm: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = UIColor(red: 48/255, green: 209/255, blue: 88/255, alpha: 1)
    button.layer.cornerRadius = 20
    button.setTitle("確認", for: .normal)
    button.setTitleColor(.white, for: .normal)
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    layer.cornerRadius = 20
    layer.shadowOffset = CGSize(width: 0, height: 0)
    layer.shadowRadius = 2
    layer.shadowOpacity = 0.2
    addSubview(title)
    title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    title.heightAnchor.constraint(equalToConstant: 20).isActive = true
    title.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
    addSubview(message)
    message.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    message.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    message.heightAnchor.constraint(equalToConstant: 18).isActive = true
    message.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20).isActive = true
    addSubview(confirm)
    confirm.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    confirm.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    confirm.heightAnchor.constraint(equalToConstant: 40).isActive = true
    confirm.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
