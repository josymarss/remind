//
//  ViewController+Ext.swift
//  Reminder
//
//  Created by Josymarss on 20/12/24.
//

import Foundation
import UIKit

extension UIViewController {
    func setUpConstraintsViewController(contentView: UIView) {
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
    }
}