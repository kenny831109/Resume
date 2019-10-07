//
//  WorksView.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/16.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit
import FSPagerView

class WorksView: UICollectionViewCell {
  
  lazy var pagerView: FSPagerView = {
    let view = FSPagerView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.transformer = FSPagerViewTransformer(type: .linear)
    view.isInfinite = true
    view.itemSize = CGSize(width: 280, height: 240)
    view.automaticSlidingInterval = 5
    view.delegate = self
    view.dataSource = self
    return view
  }()
  
  var works = [Work(image: "ccwork", name: "創創商城", url: ""),
               Work(image: "underwater", name: "水下三十米", url: ""),
               Work(image: "resume", name: "履歷快照", url: ""),
               Work(image: "brhr", name: "黑彩應徵", url: "")]
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(pagerView)
    pagerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    pagerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    pagerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    pagerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    pagerView.register(WorksCell.self, forCellWithReuseIdentifier: "works")
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension WorksView: FSPagerViewDelegate {
  //
}

extension WorksView: FSPagerViewDataSource {
  
  func numberOfItems(in pagerView: FSPagerView) -> Int {
    return works.count
  }
  
  func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
    let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "works", at: index) as! WorksCell
    cell.workImageView.image = UIImage(named: works[index].image)
    return cell
  }
  
}

class WorksCell: FSPagerViewCell {
  
  lazy var shadowContainer: UIView = {
    let container = UIView()
    container.translatesAutoresizingMaskIntoConstraints = false
    container.backgroundColor = .white
    container.layer.shadowOffset = CGSize(width: 0, height: 0)
    container.layer.shadowRadius = 2
    container.layer.shadowOpacity = 0.2
    container.layer.cornerRadius = 20
    return container
  }()
  
  let workImageView: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 20
    view.clipsToBounds = true
    return view
  }()
  
  let blurView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    addSubview(shadowContainer)
    shadowContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    shadowContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    shadowContainer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    shadowContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
    shadowContainer.addSubview(workImageView)
    workImageView.leadingAnchor.constraint(equalTo: shadowContainer.leadingAnchor).isActive = true
    workImageView.trailingAnchor.constraint(equalTo: shadowContainer.trailingAnchor).isActive = true
    workImageView.topAnchor.constraint(equalTo: shadowContainer.topAnchor).isActive = true
    workImageView.bottomAnchor.constraint(equalTo: shadowContainer.bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
