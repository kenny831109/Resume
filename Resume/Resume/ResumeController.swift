//
//  ViewController.swift
//  Resume
//
//  Created by 逸唐陳 on 2019/9/6.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit
import Hero
import SwipeCellKit
import MessageUI

class ResumeController: UIViewController {
  
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
  
  lazy private var resumeList: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1)
    view.delegate = self
    view.dataSource = self
    return view
  }()

  let resumeCell = "resume"
  var resumes = [Resume(position: .top, avatar: "", image: #imageLiteral(resourceName: "user"), name: "Kenny", email: "baby831109@yahoo.com.tw", intro: "iOS 工程師・開發經驗 3 年・擅長畫面佈局及App優化 \n\n#GitHub   #CakeResume 😀"),
                 Resume(position: .top, avatar: "", image: #imageLiteral(resourceName: "Einstein"), name: "Albert Einstein", email: "albert@gmail.com", intro: "Life is like riding a bicycle. To keep your balance you must keep moving."),
                 Resume(position: .top, avatar: "", image: #imageLiteral(resourceName: "Bill"),name: "Bill Gates", email: "bill@gmail.com", intro: "Success is a lousy teacher. It seduces smart people into thinking they can't lose."),
                 Resume(position: .top, avatar: "", image: #imageLiteral(resourceName: "man3"),name: "Mark Elliot Zuckerberg", email: "zuckerberg@gmail.com", intro: "Purpose is that sense that we are part of something bigger than ourselves, that we are needed, that we have something better ahead to work for. Purpose is what creates true happiness."),
                 Resume(position: .top, avatar: "", image: #imageLiteral(resourceName: "Musk"),name: "Elon Musk", email: "musk@gmail.com", intro: "My biggest mistake is probably weighing too much on someone's talent and not someone's personality. I think it matters whether someone has a good heart."),
                 Resume(position: .top, avatar: "", image: #imageLiteral(resourceName: "Jobs"),name: "Steve Jobs", email: "jobs@gmail.com", intro: "We don’t get a chance to do that many things, and every one should be really excellent")]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    setupView()
    setup3Dtouch()
  }
  
  func setupView() {
    view.backgroundColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1)
    navigationItem.title = "Resume"
    navigationController?.navigationBar.barStyle = .black
    userImageButton.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
    userImageButton.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
//    menuButton.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
//    menuButton.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
////    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: userImageButton)
//    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
    view.addSubview(resumeList)
    resumeList.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    resumeList.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    resumeList.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    resumeList.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    resumeList.register(IntrodutionCell.self, forCellWithReuseIdentifier: resumeCell)
  }
  
  func setup3Dtouch() {
    guard traitCollection.forceTouchCapability == .available else { return }
    registerForPreviewing(with: self, sourceView: view)
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
  
  private func sendEmail(_ email: String) {
    if MFMailComposeViewController.canSendMail() {
      let mail = MFMailComposeViewController()
      mail.mailComposeDelegate = self
      mail.setToRecipients([email])
      mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
      present(mail, animated: true)
    } else {
      let alert = CustomAlertController(message: "沒有可用的信箱帳號", title: nil, type: .Warning)
      alert.modalPresentationStyle = .overCurrentContext
      present(alert, animated: false, completion: nil)
      // show failure alert
    }
  }

}

// action
extension ResumeController {
  
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

extension ResumeController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
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

extension ResumeController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
    UIView.animate(withDuration: 0.5) {
      if let cell = collectionView.cellForItem(at: indexPath) as? IntrodutionCell {
        cell.introContainer.transform = .init(scaleX: 0.95, y: 0.95)
//        cell.contentView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
      }
    }
  }

  func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
    UIView.animate(withDuration: 0.5) {
      if let cell = collectionView.cellForItem(at: indexPath) as? IntrodutionCell {
        cell.introContainer.transform = .identity
        cell.contentView.backgroundColor = .clear
      }
    }
  }
  
}

extension ResumeController: SwipeCollectionViewCellDelegate {
  
  func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? { 
    guard orientation == .right else { return nil }
    
    let mail = SwipeAction(style: .destructive, title: nil) { action, indexPath in
      // handle action by updating model with deletion
      self.sendEmail("baby831109@yahoo.com.tw")
    }
    let phone = SwipeAction(style: .destructive, title: nil) { action, indexPath in
      // handle action by updating model with deletion
      if let url = URL(string: "tel://0978115372") {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
      }
    }
    // customize the action appearance
    mail.image = #imageLiteral(resourceName: "gmail")
    mail.backgroundColor = .white
    mail.highlightedBackgroundColor = .clear
    mail.hidesWhenSelected = true
    phone.backgroundColor = .white
    phone.highlightedBackgroundColor = .clear
    phone.image = #imageLiteral(resourceName: "telephone")
    return [phone, mail]
  }
  
  func collectionView(_ collectionView: UICollectionView, editActionsOptionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
    var options = SwipeOptions()
    options.backgroundColor = .clear
    options.expansionStyle = .selection
    options.transitionStyle = .reveal
    return options
  }
}

extension ResumeController: UICollectionViewDataSource{
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return resumes.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = resumeList.dequeueReusableCell(withReuseIdentifier: resumeCell, for: indexPath) as! IntrodutionCell
    cell.resume = resumes[indexPath.item]
    cell.introContainer.hero.id = "container\(indexPath.item)"
    cell.delegate = self
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let vc = AboutMeController()
    vc.modalPresentationStyle = .fullScreen
//    vc.introContainer.hero.id = "container\(indexPath.item)"
    let eduTitle = Title(title: "學歷", color: UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1), position: .left)
    let education = Education(from: "2010.9.1", to: "2012.7.31", isGraduation: true, name: "中山工商", department: "電子資訊")
    let education2 = Education(from: "2012.9.1", to: "2016.7.31", isGraduation: true, name: "正修科技大學", department: "資訊工程系")
    let expTitle = Title(title: "經歷", color: UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1), position: .left)
    let experience = Experience(from: "2018.5.21", to: "Now", unemployed: false, companyName: "創創數位科技股份有限公司", title: "iOS 工程師")
    let worksTitle = Title(title: "作品", color: UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1), position: .center)
    let screenshots = [ScreenShot(detail: "紀錄潛水及潛水用品商城", image: "Test")]
    let myApp = Works(name: "水下三十米", screenshots: screenshots, link: "link", views: 0)
    let screenshots2 = [ScreenShot(detail: "客製化商城", image: "Test")]
    let myApp2 = Works(name: "創創商城", screenshots: screenshots2, link: "link", views: 0)
    let screenshots3 = [ScreenShot(detail: "求職應徵Ａpp", image: "Test")]
    let myApp3 = Works(name: "黑彩", screenshots: screenshots3, link: "link", views: 0)
    let works = [myApp, myApp2, myApp3]
    var temp = [Resume(position: .title, title: eduTitle), Resume(position: .education, education: education), Resume(position: .education, education: education2), Resume(position: .title, title: expTitle), Resume(position: .experience, experience: experience), Resume(position: .title, title: worksTitle), Resume(position: .works, works: works)]
    temp.insert(resumes[indexPath.item], at: 0)
//    vc.resume = [resumes[indexPath.item]]
    vc.resume = temp
    vc.heroID = "container\(indexPath.item)"
    present(vc, animated: true, completion: nil)
  }
  
}

extension ResumeController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 150)
  }
  
}

extension ResumeController: MenuControllerDelegate {
  
  func seleted(_ type: TypeModel) {
    switch type {
    case .AboutMe:
      print("0")
//      let vc = AboutMeController()
//      navigationController?.pushViewController(vc, animated: false)
    case .Resume:
      //
      print("1")
    case .Works:
      //
      print("2")
    }
  }

}

extension ResumeController: MFMailComposeViewControllerDelegate {
  
  func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    controller.dismiss(animated: true)
  }
  
}

extension ResumeController: UIViewControllerPreviewingDelegate {
  
  func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
    guard let indexPath = resumeList.indexPathForItem(at: location) else { return nil }
    guard let cell = resumeList.cellForItem(at: indexPath) else { return nil }

    previewingContext.sourceRect = cell.frame
    
    let vc = AboutMeController()
    let eduTitle = Title(title: "學歷", color: UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1), position: .left)
    let education = Education(from: "2010.9.1", to: "2012.7.31", isGraduation: true, name: "中山工商", department: "電子資訊")
    let education2 = Education(from: "2012.9.1", to: "2016.7.31", isGraduation: true, name: "正修科技大學", department: "資訊工程系")
    let expTitle = Title(title: "經歷", color: UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1), position: .left)
    let experience = Experience(from: "2018.5.21", to: "Now", unemployed: false, companyName: "創創數位科技股份有限公司", title: "iOS 工程師")
    let worksTitle = Title(title: "作品", color: UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1), position: .center)
    let screenshots = [ScreenShot(detail: "紀錄潛水及潛水用品商城", image: "Test")]
    let myApp = Works(name: "水下三十米", screenshots: screenshots, link: "link", views: 0)
    let screenshots2 = [ScreenShot(detail: "客製化商城", image: "Test")]
    let myApp2 = Works(name: "創創商城", screenshots: screenshots2, link: "link", views: 0)
    let screenshots3 = [ScreenShot(detail: "求職應徵Ａpp", image: "Test")]
    let myApp3 = Works(name: "黑彩", screenshots: screenshots3, link: "link", views: 0)
    let works = [myApp, myApp2, myApp3]
    var temp = [Resume(position: .title, title: eduTitle), Resume(position: .education, education: education), Resume(position: .education, education: education2), Resume(position: .title, title: expTitle), Resume(position: .experience, experience: experience), Resume(position: .title, title: worksTitle), Resume(position: .works, works: works)]
    temp.insert(resumes[indexPath.item], at: 0)
    vc.resume = temp
    vc.preferredContentSize = CGSize(width: 0, height: 500)
    return vc
  }
  
  func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
    show(viewControllerToCommit, sender: nil)
  }
  
}

