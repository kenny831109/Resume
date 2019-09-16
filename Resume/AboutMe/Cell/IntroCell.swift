//
//  IntroCell.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/10.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit
import ActiveLabel

class IntroCell: UICollectionViewCell {
  
  lazy var introContainer: ShadowContainer = {
    let container = ShadowContainer()
    container.translatesAutoresizingMaskIntoConstraints = false
    container.layer.shadowOpacity = 0
    container.intro.delegate = self
    container.email.addTarget(self, action: #selector(emailDidTap), for: .touchUpInside)
    return container
  }()
  
  var resume: Resume! {
    didSet {
      introContainer.email.setTitle(resume.email, for: .normal)
      introContainer.intro.text = resume.intro
      introContainer.name.text = resume.name
      introContainer.avatar.image = resume.image
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    contentView.addSubview(introContainer)
    introContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    introContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    introContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    introContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension IntroCell {
  
  @objc func emailDidTap() {
    //
  }
  
}

extension IntroCell: ActiveLabelDelegate {
  
  func didSelect(_ text: String, type: ActiveType) {
    var link = ""
    if text == "GitHub" {
      link = "https://github.com/kenny831109"
    }else if text == "CakeResume"{
      link = "https://www.cakeresume.com/baby831109"
    }
    guard let url = URL(string: link) else { return }
    UIApplication.shared.open(url)
  }
  
}
