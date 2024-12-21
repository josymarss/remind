//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by Josymarss on 19/12/24.
//

import Foundation
import UIKit


final class ViewControllersFactory: ViewControllersFactoryProtocol {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController {
        let contentView = SplashView()
        let splashView = SplashViewController(contentView: contentView, flowDelegate: flowDelegate)
        return splashView
    }
    
    func makeloginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetController {
        let loginBottomSheetView = LoginBottomSheetView()
        let splashView = LoginBottomSheetController(contentView: loginBottomSheetView, flowDelegate: flowDelegate)
        return splashView
    }
    
    func makeHomeViewController(flowDelegate: HomeViewFlowDelegate) -> HomeViewController {
        let homeView = HomeView()
        let homeViewController = HomeViewController(contentView:homeView ,flowDelegate: flowDelegate)
        return homeViewController
    }
    
    
}
