//
//  ViewControllersFactoryProtocol .swift
//  Reminder
//
//  Created by Josymarss on 19/12/24.
//

import Foundation


protocol ViewControllersFactoryProtocol: AnyObject {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController
    func makeloginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetController
    
    func makeHomeViewController(flowDelegate:HomeViewFlowDelegate) -> HomeViewController
}
