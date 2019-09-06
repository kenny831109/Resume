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
  
  lazy private var magicView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    view.delegate = self
    view.dataSource = self
    return view
  }()
  
  private var seletedType: TypeModel = .Resume {
    didSet {
      switch seletedType {
      case .AboutMe:
        items = aboutMeItems
      case .Resume:
        items = resumeItems
      case .Works:
        items = worksItems
      }
      magicView.reloadData()
    }
  }
  
  let lightCell = "light"
  let boldCell = "bold"
  let mediumCell = "medium"
  let imageCell = "image"
  let worksCell = "works"
  
  let resumeItems = [MagicModel(type: .Image, title: nil, text: nil, image: #imageLiteral(resourceName: "user"), link: nil),
                     MagicModel(type: .Image, title: nil, text: nil, image: #imageLiteral(resourceName: "user"), link: nil),
                     MagicModel(type: .Image, title: nil, text: nil, image: #imageLiteral(resourceName: "user"), link: nil),
                     MagicModel(type: .Image, title: nil, text: nil, image: #imageLiteral(resourceName: "user"), link: nil)]
  
  let aboutMeItems = [MagicModel(type: .Image, title: nil, text: nil, image: #imageLiteral(resourceName: "user"), link: nil),
                      MagicModel(type: .Image, title: nil, text: nil, image: #imageLiteral(resourceName: "user"), link: nil),
                      MagicModel(type: .Image, title: nil, text: nil, image: #imageLiteral(resourceName: "user"), link: nil),
                      MagicModel(type: .Image, title: nil, text: nil, image: #imageLiteral(resourceName: "user"), link: nil)]
  
  let worksItems = [MagicModel(type: .Image, title: nil, text: nil, image: #imageLiteral(resourceName: "user"), link: nil),
                   MagicModel(type: .Image, title: nil, text: nil, image: #imageLiteral(resourceName: "user"), link: nil),
                   MagicModel(type: .Image, title: nil, text: nil, image: #imageLiteral(resourceName: "user"), link: nil),
                   MagicModel(type: .Image, title: nil, text: nil, image: #imageLiteral(resourceName: "user"), link: nil)]
  
  var items = [MagicModel(type: .LightText, title: "名稱", text: "Kenny", image: nil, link: nil),
               MagicModel(type: .LightText, title: "電話", text: "07-783-1787", image: nil, link: nil),
               MagicModel(type: .LightText, title: "Email", text: "baby831109@yahoo.com.tw", image: nil, link: nil),
               MagicModel(type: .LightText, title: "地址", text: "高雄市大寮區山頂里景秀街六號", image: nil, link: nil)]

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
    view.addSubview(magicView)
    magicView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    magicView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    magicView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    magicView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    magicView.register(LightTextCell.self, forCellWithReuseIdentifier: lightCell)
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
    vc.delegate = self
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

extension MainController: UICollectionViewDelegate {
  
}

extension MainController: UICollectionViewDataSource{
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch items[indexPath.item].type {
    case .Image:
      let cell = magicView.dequeueReusableCell(withReuseIdentifier: lightCell, for: indexPath) as! LightTextCell
      cell.item = items[indexPath.item]
      return cell
    case .BoldText:
      let cell = magicView.dequeueReusableCell(withReuseIdentifier: lightCell, for: indexPath) as! LightTextCell
      cell.item = items[indexPath.item]
      return cell
    case .LightText:
      let cell = magicView.dequeueReusableCell(withReuseIdentifier: lightCell, for: indexPath) as! LightTextCell
      cell.item = items[indexPath.item]
      return cell
    case .MediumText:
      let cell = magicView.dequeueReusableCell(withReuseIdentifier: lightCell, for: indexPath) as! LightTextCell
      cell.item = items[indexPath.item]
      return cell
    case .Works:
      let cell = magicView.dequeueReusableCell(withReuseIdentifier: lightCell, for: indexPath) as! LightTextCell
      cell.item = items[indexPath.item]
      return cell
    }
  }
  
}

extension MainController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    switch items[indexPath.item].type {
    case .Image:
      return CGSize(width: view.frame.width, height: 100)
    case .BoldText:
      return CGSize(width: view.frame.width, height: 44)
    case .LightText:
      return CGSize(width: view.frame.width, height: 34)
    case .MediumText:
      return CGSize(width: view.frame.width, height: 44)
    case .Works:
      return CGSize(width: view.frame.width, height: 100)
    }
  }
  
}

extension MainController: MenuControllerDelegate {
  
  func seleted(_ type: TypeModel) {
    seletedType = type
  }

}

