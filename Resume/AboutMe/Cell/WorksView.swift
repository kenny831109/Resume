//
//  WorksView.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/16.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit
import AnimatedCollectionViewLayout

class WorksView: UICollectionViewCell {
  
  lazy var collectionView: UICollectionView = {
    let layout = AnimatedCollectionViewLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.animator = LinearCardAttributesAnimator(minAlpha: 0.7, itemSpacing: 0.5, scaleRate: 0.7)
    let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    view.delegate = self
    view.dataSource = self
    view.isPagingEnabled = true
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(collectionView)
    collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    collectionView.register(WorksCell.self, forCellWithReuseIdentifier: "works")
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension WorksView: UICollectionViewDelegate {
  //
}

extension WorksView: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "works", for: indexPath) as! WorksCell
    return cell
  }
  
}

extension WorksView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: frame.width, height: frame.height * 1.35)
  }
}

class WorksCell: UICollectionViewCell {
  
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
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
