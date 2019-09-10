//
//  EducationCell.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/10.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

class EducationCell: UICollectionViewCell {
  
//  let 
  
  
  var education: Education! {
    didSet {
      
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
