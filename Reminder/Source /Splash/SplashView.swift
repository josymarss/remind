//
//  SplasView.swift
//  Reminder
//
//  Created by Josymarss on 18/12/24.
//

import UIKit

class SplashView: UIView {
    
    let logoView: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "Logo")
        logo.contentMode = .scaleAspectFit
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    init() {
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUp() {
        self.addSubview(logoView)
        setConstraints()
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            logoView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            logoView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            logoView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
//            logoView.bottomAnchor.constraint(equalTo: titleLabelView.bottomAnchor)
        ])
    }
}
