//
//  LaunchScreenController.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/9.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

class LaunchScreenController: UIViewController {
  
  let R_label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "R"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
    label.textAlignment = .center
    label.alpha = 0
    return label
  }()
  
  let e_label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "e"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
    label.textAlignment = .center
    label.alpha = 0
    return label
  }()
  
  let s_label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "s"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
    label.textAlignment = .center
    label.alpha = 0
    return label
  }()
  
  let u_label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "u"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
    label.textAlignment = .center
    label.alpha = 0
    return label
  }()
  
  let m_label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "m"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
    label.textAlignment = .center
    label.alpha = 0
    return label
  }()
  
  let ee_label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "e"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
    label.textAlignment = .center
    label.alpha = 0
    return label
  }()
  
  let copyright: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Copyright © 2019 Kenny Chen. All rights reserved."
    label.textColor = .white
    label.textAlignment = .center
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .lightGray
    //resume
    view.addSubview(s_label)
    s_label.trailingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    s_label.widthAnchor.constraint(equalToConstant: 25).isActive = true
    s_label.heightAnchor.constraint(equalToConstant: 44).isActive = true
    s_label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
    view.addSubview(u_label)
    u_label.leadingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    u_label.widthAnchor.constraint(equalToConstant: 25).isActive = true
    u_label.heightAnchor.constraint(equalToConstant: 44).isActive = true
    u_label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
    view.addSubview(m_label)
    m_label.leadingAnchor.constraint(equalTo: u_label.trailingAnchor).isActive = true
    m_label.widthAnchor.constraint(equalToConstant: 38).isActive = true
    m_label.heightAnchor.constraint(equalToConstant: 44).isActive = true
    m_label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
    view.addSubview(ee_label)
    ee_label.leadingAnchor.constraint(equalTo: m_label.trailingAnchor).isActive = true
    ee_label.widthAnchor.constraint(equalToConstant: 25).isActive = true
    ee_label.heightAnchor.constraint(equalToConstant: 44).isActive = true
    ee_label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
    view.addSubview(e_label)
    e_label.trailingAnchor.constraint(equalTo: s_label.leadingAnchor).isActive = true
    e_label.widthAnchor.constraint(equalToConstant: 25).isActive = true
    e_label.heightAnchor.constraint(equalToConstant: 44).isActive = true
    e_label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
    view.addSubview(R_label)
    R_label.trailingAnchor.constraint(equalTo: e_label.leadingAnchor).isActive = true
    R_label.widthAnchor.constraint(equalToConstant: 28).isActive = true
    R_label.heightAnchor.constraint(equalToConstant: 44).isActive = true
    R_label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
    view.addSubview(copyright)
    copyright.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    copyright.heightAnchor.constraint(lessThanOrEqualToConstant: 150).isActive = true
    copyright.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    copyright.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let animator = UIViewPropertyAnimator(duration:1.5, curve: .easeInOut) {
      self.R_label.alpha = 1
      self.e_label.alpha = 1
      self.s_label.alpha = 1
      self.u_label.alpha = 1
      self.m_label.alpha = 1
      self.ee_label.alpha = 1
    }
    animator.startAnimation()
    animator.addCompletion { (position) in
      UIView.animate(withDuration: 0.6, delay: 0, options: UIView.AnimationOptions(), animations: {
        self.copyright.alpha = 0
        self.R_label.alpha = 0
        self.R_label.center.y -= 10
      })
      UIView.animate(withDuration: 0.6, delay: 0.2, options: UIView.AnimationOptions(), animations: {
        self.e_label.alpha = 0
        self.e_label.center.y -= 10
      })
      UIView.animate(withDuration: 0.6, delay: 0.4, options: UIView.AnimationOptions(), animations: {
        self.s_label.alpha = 0
        self.s_label.center.y -= 10
      })
      UIView.animate(withDuration: 0.6, delay: 0.6, options: UIView.AnimationOptions(), animations: {
        self.u_label.alpha = 0
        self.u_label.center.y -= 10
      })
      UIView.animate(withDuration: 0.6, delay: 0.8, options: UIView.AnimationOptions(), animations: {
        self.m_label.alpha = 0
        self.m_label.center.y -= 10
      })
      UIView.animate(withDuration: 0.6, delay: 1, options: UIView.AnimationOptions(), animations: {
        self.ee_label.alpha = 0
        self.ee_label.center.y -= 10
      })
    }

  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
}
