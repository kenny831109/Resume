//
//  MenuView.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/6.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

class MenuViewController: MainController {
  
  lazy private var maskView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.isUserInteractionEnabled = true
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    return view
  }()
  
  lazy private var menuView: UITableView = {
    let view = UITableView(frame: .zero, style: .plain)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.tableFooterView = UIView()
    view.backgroundColor = UIColor(red:0.97, green:0.88, blue:0.88, alpha:1.0)
    view.separatorStyle = .none
    view.delegate = self
    view.dataSource = self
    view.addGestureRecognizer(panRecognizer)
    return view
  }()
  
  private lazy var panRecognizer: UIPanGestureRecognizer = {
    let recognizer = UIPanGestureRecognizer()
    recognizer.addTarget(self, action: #selector(menuPanGesture(_:)))
    return recognizer
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  private var menuLeadingConstraint: NSLayoutConstraint?
  private var menuWidth: CGFloat = 250
  private var animatDuration = 0.3
  private var closeAnimator: UIViewPropertyAnimator!
  private var maskGesture: UITapGestureRecognizer!
  private var logoCell = "logo"
  private var buttonCell = "button"
  private var bottomCell = "bottom"
  private var menuItems = [MenuCellModel(type: .Logo, image: #imageLiteral(resourceName: "heart"), title: "Logo"),
                           MenuCellModel(type: .Button, image: nil, title: "About Me"),
                           MenuCellModel(type: .Bottom, image: #imageLiteral(resourceName: "heart"), title: "Logo")]
  
  override func setupView() {
    view.backgroundColor = .clear
    view.addSubview(maskView)
    maskView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    maskView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    maskView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    maskView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    maskGesture = UITapGestureRecognizer(target: self, action: #selector(menuClose))
    maskView.addGestureRecognizer(maskGesture)
    view.addSubview(menuView)
    menuLeadingConstraint = menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -menuWidth)
    menuLeadingConstraint?.isActive = true
    menuView.widthAnchor.constraint(equalToConstant: menuWidth).isActive = true
    menuView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    menuView.register(MenuLogoCell.self, forCellReuseIdentifier: logoCell)
    menuView.register(MenuButtonCell.self, forCellReuseIdentifier: buttonCell)
    menuView.register(MenuBottomCell.self, forCellReuseIdentifier: bottomCell)

  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    menuOpen()
  }
  
  private func menuOpen() {
    let animator = UIViewPropertyAnimator(duration: animatDuration, curve: .easeInOut) {
      self.menuLeadingConstraint?.constant = 0
      self.view.layoutIfNeeded()
    }
    animator.startAnimation()
    closeAnimator = UIViewPropertyAnimator(duration: animatDuration, curve: .easeInOut) {
      self.menuLeadingConstraint?.constant = -self.menuWidth
      self.maskView.alpha = 0
      self.view.layoutIfNeeded()
    }
  }
  
}

extension MenuViewController {
  
  @objc private func menuClose() {
    closeAnimator.startAnimation()
    closeAnimator.addCompletion { (state) in
      self.dismiss(animated: false, completion: nil)
    }
  }
  
  @objc private func menuPanGesture(_ recognizer: UIPanGestureRecognizer) {
    let translation = recognizer.translation(in: menuView)
    let fraction = -translation.x / menuWidth
    let velocity = recognizer.velocity(in: menuView)
    switch recognizer.state {
    case .began:
      closeAnimator.pauseAnimation()
    case .changed:
      closeAnimator.fractionComplete = fraction
    case .ended:
      if fraction > 0.5 || velocity.x < -100 {
        closeAnimator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        closeAnimator.addCompletion { (state) in
          self.dismiss(animated: false, completion: nil)
        }
      }else {
        maskView.alpha = 1
        closeAnimator.fractionComplete = 0
      }
    default:
      break
    }
  }
  
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuItems.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch menuItems[indexPath.row].type {
    case .Logo:
      let cell = menuView.dequeueReusableCell(withIdentifier: logoCell, for: indexPath) as! MenuLogoCell
      cell.menuItem = menuItems[indexPath.row]
      return cell
    case .Button:
      let cell = menuView.dequeueReusableCell(withIdentifier: buttonCell, for: indexPath) as! MenuButtonCell
      cell.menuItem = menuItems[indexPath.row]
      return cell
    case .Bottom:
      let cell = menuView.dequeueReusableCell(withIdentifier: bottomCell, for: indexPath) as! MenuBottomCell
      cell.menuItem = menuItems[indexPath.row]
      return cell
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch menuItems[indexPath.row].type {
    case .Logo:
      return 150
    case .Button:
      return 22
    case .Bottom:
      return 100
    }
  }
  
}
