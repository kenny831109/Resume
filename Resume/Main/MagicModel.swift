//
//  MagicModel.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/6.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

enum TypeModel {
  case AboutMe
  case Resume
  case Works
}

enum MagicType {
  case Image
  case LightText
  case BoldText
  case MediumText
  case Works
}

struct MagicModel {
  let type: MagicType
  let title: String?
  let text: String?
  let image: UIImage?
  let link: String?
}
