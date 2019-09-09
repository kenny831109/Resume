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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    hero.isEnabled = true
    view.addSubview(backButton)
    backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
    backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    backButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    backButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
    view.addSubview(introContainer)
    introContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    introContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    introContainer.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 5).isActive = true
    introContainer.heightAnchor.constraint(equalToConstant: 150).isActive = true
    panGesture = UIPanGestureRecognizer(target: self, action: #selector(panRecongnizer(_:)))
    view.addGestureRecognizer(panGesture!)
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .default
  }
  
}

extension AboutMeController {
  
  @objc func backHandler() {
    dismiss(animated: true, completion: nil)
  }
  
  @objc func panRecongnizer(_ recognizer: UIPanGestureRecognizer) {
    let translation = recognizer.translation(in: nil)
    let progress = translation.y / view.bounds.height
    switch recognizer.state {
    case .began:
      Hero.shared.defaultAnimation = .fade
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
