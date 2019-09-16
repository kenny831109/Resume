//
//  ExperienceCell.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/16.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

class ExperienceCell: UICollectionViewCell {
  
  lazy var shadowContainer: UIView = {
    let container = UIView()
    container.translatesAutoresizingMaskIntoConstraints = false
    container.backgroundColor = .white
    container.layer.shadowOffset = CGSize(width: 0, height: 0)
    container.layer.shadowRadius = 2
    container.layer.shadowOpacity = 0.2
    container.layer.cornerRadius = 5
    return container
  }()
  
  let dotIcon: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.image = #imageLiteral(resourceName: "dot")
    return view
  }()
  
  let workPeriod: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
    return label
  }()
  
  let companyName: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
    return label
  }()
  
  let jobTitle: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
    return label
  }()
  
  var experience: Experience! {
    didSet {
      workPeriod.text = "\(experience.from) ~ \(experience.to)"
      companyName.text = experience.companyName
      jobTitle.text = experience.title
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(shadowContainer)
    shadowContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    shadowContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    shadowContainer.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    shadowContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    shadowContainer.addSubview(dotIcon)
    dotIcon.leadingAnchor.constraint(equalTo: shadowContainer.leadingAnchor, constant: 20).isActive = true
    dotIcon.heightAnchor.constraint(equalToConstant: 6).isActive = true
    dotIcon.widthAnchor.constraint(equalToConstant: 6).isActive = true
    dotIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    shadowContainer.addSubview(companyName)
    companyName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    companyName.leadingAnchor.constraint(equalTo: dotIcon.trailingAnchor, constant: 15).isActive = true
    companyName.trailingAnchor.constraint(equalTo: shadowContainer.trailingAnchor, constant: -15).isActive = true
    companyName.heightAnchor.constraint(equalToConstant: 20).isActive = true
    shadowContainer.addSubview(workPeriod)
    workPeriod.bottomAnchor.constraint(equalTo: companyName.topAnchor, constant: -5).isActive = true
    workPeriod.leadingAnchor.constraint(equalTo: dotIcon.trailingAnchor, constant: 15).isActive = true
    workPeriod.trailingAnchor.constraint(equalTo: shadowContainer.trailingAnchor, constant: -15).isActive = true
    workPeriod.heightAnchor.constraint(equalToConstant: 20).isActive = true
    shadowContainer.addSubview(jobTitle)
    jobTitle.topAnchor.constraint(equalTo: companyName.bottomAnchor, constant: 5).isActive = true
    jobTitle.leadingAnchor.constraint(equalTo: dotIcon.trailingAnchor, constant: 15).isActive = true
    jobTitle.trailingAnchor.constraint(equalTo: shadowContainer.trailingAnchor, constant: -15).isActive = true
    jobTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
