//
//  MenuLogoCell.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/6.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

class MenuLogoCell: UITableViewCell {
  
  let logo: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = UIView.ContentMode.scaleAspectFit
    return view
  }()
  
  var menuItem: MenuCellModel! {
    didSet {
      logo.image = menuItem.image
    }
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    backgroundColor = .clear
    addSubview(logo)
    logo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    logo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    logo.topAnchor.constraint(equalTo: topAnchor).isActive = true
    logo.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
