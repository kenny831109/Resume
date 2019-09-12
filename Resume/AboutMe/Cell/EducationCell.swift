//
//  EducationCell.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/10.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

class EducationCell: UICollectionViewCell {
  
  let dotIcon: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.image = #imageLiteral(resourceName: "dot")
    return view
  }()
  
  let studyPeriod: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
    return label
  }()
  
  let schoolName: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
    return label
  }()
  
  let department: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
    return label
  }()
  
  var education: Education! {
    didSet {
      studyPeriod.text = "\(education.from) ~ \(education.to)"
      schoolName.text = education.name
      department.text = education.department
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(dotIcon)
    dotIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    dotIcon.heightAnchor.constraint(equalToConstant: 6).isActive = true
    dotIcon.widthAnchor.constraint(equalToConstant: 6).isActive = true
    dotIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    addSubview(schoolName)
    schoolName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    schoolName.leadingAnchor.constraint(equalTo: dotIcon.trailingAnchor, constant: 15).isActive = true
    schoolName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    schoolName.heightAnchor.constraint(equalToConstant: 20).isActive = true
    addSubview(studyPeriod)
    studyPeriod.bottomAnchor.constraint(equalTo: schoolName.topAnchor, constant: -5).isActive = true
    studyPeriod.leadingAnchor.constraint(equalTo: dotIcon.trailingAnchor, constant: 15).isActive = true
    studyPeriod.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    studyPeriod.heightAnchor.constraint(equalToConstant: 20).isActive = true
    addSubview(department)
    department.topAnchor.constraint(equalTo: schoolName.bottomAnchor, constant: 5).isActive = true
    department.leadingAnchor.constraint(equalTo: dotIcon.trailingAnchor, constant: 15).isActive = true
    department.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    department.heightAnchor.constraint(equalToConstant: 20).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
