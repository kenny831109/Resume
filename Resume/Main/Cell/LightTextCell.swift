//
//  LightTextCell.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/6.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

class LightTextCell: UICollectionViewCell {
  
  let title: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    label.textColor = .black
    return label
  }()
  
  let content: UITextView = {
    let view = UITextView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.font = UIFont.systemFont(ofSize: 14, weight: .light)
    view.textColor = .black
    view.isEditable = false
    view.dataDetectorTypes = .all
    return view
  }()
  
  var item: MagicModel! {
    didSet {
      title.text = item.title
      content.text = item.text
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(title)
    title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    title.widthAnchor.constraint(lessThanOrEqualToConstant: 150).isActive = true
    title.topAnchor.constraint(equalTo: topAnchor).isActive = true
    title.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    addSubview(content)
    content.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: 15).isActive = true
    content.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
    content.topAnchor.constraint(equalTo: topAnchor).isActive = true
    content.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
