//
//  SplashViewController.swift
//  Remnder
//
//  Created by Josymarss on 14/12/24.
//

import UIKit

class SplashViewController: UIViewController {
    let contentView = SplashView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setGestureHandler()
        // Do any additional setup after loading the view.
        setUp()
    }
    
    private func setUp() {
        self.view.addSubview(contentView)
        self.view.backgroundColor = Colors.primaryRedBase
        addConstraints()
    }
    
    private func setGestureHandler(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginSheet))
        self.view.addGestureRecognizer(tapGesture)
    }
        
    @objc private func showLoginSheet() {
        let loginSheetView = LoginBottomSheetCongtroller()
        loginSheetView.modalPresentationStyle = .overCurrentContext
        loginSheetView.modalTransitionStyle = .crossDissolve
        self.present(loginSheetView, animated: false){
            loginSheetView.animateShow()
        }
    }
    
    private func addConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),

        ])
    }

}
