//
//  HomeViewController.swift
//  Reminder
//
//  Created by Josymarss on 20/12/24.
//

import UIKit

class HomeViewController: UIViewController {
    var flowDelegate: HomeViewFlowDelegate
    var contentView: HomeView
    var viewModel: HomeViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        setUpNavigationBar()
        checkForExistentUser()
    }
    
    init(contentView:HomeView, flowDelegate: HomeViewFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        self.viewModel = HomeViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    private func setUp() {
        contentView.delegate = self
        self.view.addSubview(contentView)
        setHeirarchy()
    }
    
    private func setUpNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        
        let logOutButton = UIBarButtonItem(image: UIImage(named: "log-out"), style: .plain, target: self, action: #selector(logOut))
        
        logOutButton.tintColor = Colors.primaryRedBase
        self.navigationItem.rightBarButtonItem = logOutButton
    }
    
    private func setHeirarchy() {
        self.setUpConstraintsViewController(contentView: contentView)
    }
    
    private func checkForExistentUser(){
        if let _ = UserDefaultsManager.loadUser(),UserDefaultsManager.loadProfileImage() != nil {
            contentView.nameTextField.text = UserDefaultsManager.loadUserName()
            
            let imageData = UserDefaultsManager.loadProfileImage()
            contentView.imageView.image = imageData
        }
    }
    @objc
    private func logOut(){
        UserDefaultsManager.removeUser()
        flowDelegate.logout()
    }
    

}

extension HomeViewController: HomeViewFlowDelegate {
    func logout() {
        // Save imagePicker
    }
    
    func didTapImage() {
        selectprofileImage()
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private func selectprofileImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage{
            contentView.imageView.image = editedImage
            UserDefaultsManager.saveProfileImage(from: editedImage)
        } else if let originalImage = info[.originalImage] {
            contentView.imageView.image = originalImage as? UIImage
            UserDefaultsManager.saveProfileImage(from: originalImage as! UIImage)
        }
        dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
