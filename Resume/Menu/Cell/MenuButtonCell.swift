//
//  MenuButtonCell.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/6.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

class MenuButtonCell: UITableViewCell {
  
  let title: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    return label
  }()
  
  var menuItem: MenuCellModel! {
    didSet {
      title.text = menuItem.title
    }
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .clear
    addSubview(title)
    title.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    title.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    title.topAnchor.constraint(equalTo: topAnchor).isActive = true
    title.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
