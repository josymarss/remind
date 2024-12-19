//
//  ReminderFlowCOntroller.swift
//  Reminder
//
//  Created by Josymarss on 18/12/24.
//

import Foundation
import UIKit


class ReminderFlowController {
    
    private var navigationController: UINavigationController?
    
    public init (){}
    
    func start() -> UINavigationController {
        
        let rootView = SplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: rootView)
        
        return self.navigationController!
    }
}

// MARK: Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateHome() {
        self.navigationController?.dismiss(animated: false)
        let homeViewController = UIViewController()
        homeViewController.view.backgroundColor = .red
        
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
}

// MARK: BottomSheet

extension ReminderFlowController: SplashFlowDelegate {
    func openBottomSheet() {
        let loginSheetView = LoginBottomSheetCongtroller(flowDelegate: self)
        loginSheetView.modalPresentationStyle = .overCurrentContext
        loginSheetView.modalTransitionStyle = .crossDissolve
        self.navigationController?.present(loginSheetView, animated: false){
            loginSheetView.animateShow()
        }
    }
    
    
}
