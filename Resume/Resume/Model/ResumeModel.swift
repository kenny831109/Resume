//
//  ResumeModel.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/9.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

enum CellPosition {
  case top
  case bottom
  case works
  case education
  case experience
  case title
  case separator
}

struct Resume: Codable {
  var position: CellPosition = .top
  var avatar: String?
  var image: UIImage?
  var name: String?
  var email: String?
  var intro: String?
  var detail: [Resume]?
  var education: Education?
  var experience: Experience?
  var works: [Works]?
  var title: Title?
  
  init(position: CellPosition, avatar: String? = nil, image: UIImage? = nil, name: String? = nil, email: String? = nil, intro: String? = nil, detail: [Resume]? = [Resume](), education: Education? = nil, experience: Experience? = nil, works: [Works]? = [Works](), title: Title? = nil) {
    self.position = position
    self.avatar = avatar
    self.image = image
    self.name = name
    self.email = email
    self.intro = intro
    self.detail = detail
    self.education = education
    self.experience = experience
    self.works = works
    self.title = title
  }
  
  enum CodingKeys: String, CodingKey {
    case avatar
    case name
    case email
    case intro
  }
  
}

struct Education {
  let from: String
  let to: String
  let isGraduation: Bool
  let name: String
  let department: String
}

struct Experience {
  let from: String
  let to: String
  let unemployed: Bool
  let companyName: String
  let title: String
}

struct Works {
  let name: String
  let screenshots: [ScreenShot]?
  let link: String
  let views: Int
}

struct ScreenShot {
  let detail: String
  let image: String
}

struct Title {
  let title: String
  let color: UIColor
  let position: NSTextAlignment
}

