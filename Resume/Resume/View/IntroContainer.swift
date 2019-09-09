//
//  IntroContainer.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/9.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit
import ActiveLabel

class IntroContainer: UIView {
  
  let avatar: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = #imageLiteral(resourceName: "user")
    imageView.layer.cornerRadius = 30
    imageView.clipsToBounds = true
    imageView.contentMode = UIView.ContentMode.scaleAspectFill
    return imageView
  }()
  
  let name: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    label.text = "Name"
    label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
    return label
  }()
  
  lazy var email: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.contentHorizontalAlignment = .left
    button.setTitle("baby831109@yahoo.com.tw", for: .normal)
    return button
  }()
  
  lazy var intro: ActiveLabel = {
    let label = ActiveLabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.enabledTypes = [.mention, .hashtag, .url]
    label.textColor = .gray
    label.numberOfLines = 4
    label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    label.hashtagColor = .orange
    label.text = "iOS 工程師・開發經驗 3 年・擅長畫面佈局及App優化 \n\n#GitHub   #CakeResume"
    return label
  }()
  
  var shadowEnable = true
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    addSubview(avatar)
    avatar.heightAnchor.constraint(equalToConstant: 60).isActive = true
    avatar.widthAnchor.constraint(equalToConstant: 60).isActive = true
    avatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    avatar.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    addSubview(name)
    name.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 15).isActive = true
    name.topAnchor.constraint(equalTo: avatar.topAnchor, constant: 10).isActive = true
    name.heightAnchor.constraint(equalToConstant: 20).isActive = true
    name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
    addSubview(email)
    email.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 15).isActive = true
    email.topAnchor.constraint(equalTo: name.bottomAnchor).isActive = true
    email.heightAnchor.constraint(equalToConstant: 20).isActive = true
    email.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    addSubview(intro)
    intro.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    intro.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
    intro.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 5).isActive = true
    intro.heightAnchor.constraint(lessThanOrEqualToConstant: 150).isActive = true
    layer.shadowOffset = CGSize(width: 0, height: 0)
    layer.shadowRadius = 2
    layer.shadowOpacity = 0.2
    layer.cornerRadius = 5
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
