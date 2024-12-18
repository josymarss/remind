//
//  ReminderFlowCOntroller.swift
//  Reminder
//
//  Created by Josymarss on 18/12/24.
//

import Foundation
import UIKit


class ReminderFlowController {
    
    private var navigation: UINavigationController?
    
    public init (){}
    
    func start() -> UINavigationController {
        
        let rootView = SplashViewController()
        self.navigation = UINavigationController(rootViewController: rootView)
        
        return self.navigation!
    }
}
