//
//  ViewController.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/6.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

class MainController: UIViewController {
  
  lazy private var userImageButton: UIButton = {
    let button = UIButton(type: .custom)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 16
    button.clipsToBounds = true
    button.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
    button.imageView?.clipsToBounds = true
    button.setImage(#imageLiteral(resourceName: "user"), for: .normal)
    button.addTarget(self, action: #selector(userButtonDidTap), for: .touchUpInside)
    return button
  }()
  
  lazy private var menuButton: UIButton = {
    let button = UIButton(type: .custom)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
    button.imageView?.clipsToBounds = true
    button.setImage(#imageLiteral(resourceName: "menu"), for: .normal)
    button.addTarget(self, action: #selector(menuHandler), for: .touchUpInside)
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    setupView()
  }
  
  func setupView() {
    view.backgroundColor = .white
    navigationItem.title = "Resume"
    userImageButton.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
    userImageButton.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
    menuButton.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
    menuButton.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: userImageButton)
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
  }
  
  private func changeAvatarHandler() {
    let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    let camera = UIAlertAction(title: "相機", style: .default) { (action) in
      if UIImagePickerController.isSourceTypeAvailable(.camera){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .camera
        self.present(imagePicker,animated:  true)
      }
    }
    let album = UIAlertAction(title: "相簿", style: .default) { (action) in
      if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker,animated:  true)
      }
    }
    let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
    alert.addAction(camera)
    alert.addAction(album)
    alert.addAction(cancel)
    present(alert, animated: true, completion: nil)
  }

}

// action
extension MainController {
  
  @objc private func userButtonDidTap() {
    let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    let logout = UIAlertAction(title: "登出", style: .destructive) { (action) in
      print("Logout")
    }
    let change = UIAlertAction(title: "更換圖片", style: .default) { (action) in
      self.changeAvatarHandler()
    }
    let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
    alert.addAction(change)
    alert.addAction(logout)
    alert.addAction(cancel)
    present(alert, animated: true, completion: nil)
  }
  
  @objc private func menuHandler() {
    let vc = MenuViewController()
    vc.modalPresentationStyle = .overCurrentContext
    present(vc, animated: false, completion: nil)
  }
  
}

extension MainController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    var selectedImage = UIImage()
    if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
      selectedImage = editedImage
    }else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      selectedImage = originalImage
    }
    picker.dismiss(animated: true) {
      self.userImageButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
    }
  }
  
}

