//
//  MenuView.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/6.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

protocol MenuControllerDelegate: class {
  func seleted(_ type: TypeModel)
}

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
    recognizer.delegate = self
    return recognizer
  }()
  
  weak var delegate: MenuControllerDelegate?

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  private var menuLeadingConstraint: NSLayoutConstraint?
  private var menuWidthConstraint: NSLayoutConstraint?
  private var menuWidth: CGFloat = 250
  private var animatDuration = 0.3
  private var closeAnimator: UIViewPropertyAnimator!
  private var maskGesture: UITapGestureRecognizer!
  private var logoCell = "logo"
  private var buttonCell = "button"
  private var bottomCell = "bottom"
  private var menuItems = [MenuCellModel(cellType: .Logo, image: #imageLiteral(resourceName: "curriculum"), title: "Logo", type: nil),
                           MenuCellModel(cellType: .Button, image: nil, title: "關於我", type: .AboutMe),
                           MenuCellModel(cellType: .Button, image: nil, title: "履歷", type: .Resume),
                           MenuCellModel(cellType: .Button, image: nil, title: "作品集", type: .Works),
                           MenuCellModel(cellType: .Bottom, image: #imageLiteral(resourceName: "copyright"), title: "CopyRight", type: nil)]
  
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
    menuWidthConstraint = menuView.widthAnchor.constraint(equalToConstant: menuWidth)
    menuWidthConstraint?.isActive = true
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
    if translation.x > 0 {
      return
    }
    menuLeadingConstraint?.constant = translation.x
    switch recognizer.state {
    case .changed:
      maskView.alpha = 1 - fraction
    case .ended:
      if fraction > 0.5 || velocity.x < -100 {
        menuClose()
      }else {
        UIView.animate(withDuration: 0.3) {
          self.maskView.alpha = 1
          self.menuLeadingConstraint?.constant = 0
          self.view.layoutIfNeeded()
        }
      }
    default:
      break
    }
  }
  
}

extension MenuViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    menuView.deselectRow(at: indexPath, animated: true)
    guard let type = menuItems[indexPath.row].type else {return}
    delegate?.seleted(type)
    menuClose()
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch menuItems[indexPath.row].cellType {
    case .Logo:
      return 150
    case .Button:
      return 60
    case .Bottom:
      return 100
    }
  }
  
}

extension MenuViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuItems.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch menuItems[indexPath.row].cellType {
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
  
}

extension MenuViewController: UIGestureRecognizerDelegate {
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
  }
}
