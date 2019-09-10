//
//  AboutMeController.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/9.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit
import Hero

class AboutMeController: UIViewController {
  
  lazy var backButton: UIButton = {
    let button = UIButton(type: .custom)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(#imageLiteral(resourceName: "left-arrow"), for: .normal)
    button.addTarget(self, action: #selector(backHandler), for: .touchUpInside)
    return button
  }()
  
  lazy var resumeList: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    view.delegate = self
    view.dataSource = self
    return view
  }()
  
  lazy var introContainer: IntroContainer = {
    let container = IntroContainer()
    container.translatesAutoresizingMaskIntoConstraints = false
    container.layer.shadowOpacity = 0
//    container.intro.delegate = self
//    container.email.addTarget(self, action: #selector(emailDidTap), for: .touchUpInside)
    return container
  }()
  
  var panGesture: UIPanGestureRecognizer?
  var originalPosition: CGPoint?
  var currentPositionTouched: CGPoint?
  var heroID = ""
  var resume = [Resume]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    hero.isEnabled = true
    view.addSubview(backButton)
    backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
    backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    backButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    backButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
    panGesture = UIPanGestureRecognizer(target: self, action: #selector(panRecongnizer(_:)))
    panGesture?.delegate = self
    view.addSubview(resumeList)
    resumeList.addGestureRecognizer(panGesture!)
    resumeList.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    resumeList.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    resumeList.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 5).isActive = true
    resumeList.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    resumeList.register(IntroCell.self, forCellWithReuseIdentifier: "intro")
    resumeList.register(EducationCell.self, forCellWithReuseIdentifier: "education")
    load()
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .default
  }
  
  func load() {
  }
  
}

extension AboutMeController {
  
  @objc func backHandler() {
    dismiss(animated: true, completion: nil)
  }
  
  @objc func panRecongnizer(_ recognizer: UIPanGestureRecognizer) {
    if resumeList.contentOffset.y < 0 {
      let translation = recognizer.translation(in: nil)
      let progress = translation.y / view.bounds.height
      switch recognizer.state {
      case .began:
        Hero.shared.defaultAnimation = .auto
        hero.dismissViewController()
      case .changed:
        Hero.shared.update(progress)
        let currentPos = CGPoint(x: translation.x + view.center.x, y: translation.y + view.center.y)
        Hero.shared.apply(modifiers: [.position(currentPos)], to: view)
      default:
        if progress + recognizer.velocity(in: nil).y / view.bounds.height > 0.3 {
          Hero.shared.finish()
        } else {
          Hero.shared.cancel()
        }
      }
    }
  }
  
}

extension AboutMeController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    switch resume[indexPath.item].position {
    case .top:
       return CGSize(width: view.frame.width, height: 150)
    case .bottom:
       return CGSize(width: view.frame.width, height: 150)
    case .education:
       return CGSize(width: view.frame.width, height: 150)
    case .experience:
       return CGSize(width: view.frame.width, height: 150)
    case .works:
       return CGSize(width: view.frame.width, height: 150)
    }
  }
  
}

extension AboutMeController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return resume.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch resume[indexPath.item].position {
    case .top:
      let cell = resumeList.dequeueReusableCell(withReuseIdentifier: "intro", for: indexPath) as! IntroCell
      cell.introContainer.hero.id = heroID
      cell.resume = resume[indexPath.item]
      return cell
    case .education:
      let cell = resumeList.dequeueReusableCell(withReuseIdentifier: "education", for: indexPath) as! EducationCell
      cell.education = resume[indexPath.item].education!
      return cell
    case .experience:
      let cell = resumeList.dequeueReusableCell(withReuseIdentifier: "intro", for: indexPath) as! IntroCell
      return cell
    case .works:
      let cell = resumeList.dequeueReusableCell(withReuseIdentifier: "intro", for: indexPath) as! IntroCell
      return cell
    case .bottom:
      let cell = resumeList.dequeueReusableCell(withReuseIdentifier: "intro", for: indexPath) as! IntroCell
      return cell
    }
  }
  
}

extension AboutMeController: UIGestureRecognizerDelegate {
  
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
  }
  
}
