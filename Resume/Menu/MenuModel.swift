//
//  MenuModel.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/6.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

enum MenuCellType {
  case Logo
  case Button
  case Bottom
}

struct MenuCellModel {
  let type: MenuCellType
  let image: UIImage?
  let title: String
}
