//
//  MenuBottomCell.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/6.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

class MenuBottomCell: UITableViewCell {
  
  let logo: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = UIView.ContentMode.scaleAspectFit
    return view
  }()
  
  let copyright: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Copyright © 2019 Kenny Chen. All rights reserved."
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    label.textAlignment = .center
    label.numberOfLines = 0
    return label
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
    addSubview(copyright)
    copyright.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    copyright.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    copyright.topAnchor.constraint(equalTo: topAnchor).isActive = true
    copyright.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
