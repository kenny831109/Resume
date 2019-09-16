//
//  TitleCell.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/16.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

class TitleCell: UICollectionViewCell {
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    return label
  }()
  
  var titleSetting: Title! {
    didSet {
      titleLabel.textAlignment = titleSetting.position
      titleLabel.textColor = titleSetting.color
      titleLabel.text = titleSetting.title
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(titleLabel)
    titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
