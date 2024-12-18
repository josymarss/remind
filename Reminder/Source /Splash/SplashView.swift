//
//  SplasView.swift
//  Reminder
//
//  Created by Josymarss on 18/12/24.
//

import UIKit

class SplashView: UIView {
    private let titleLabelView: UILabel = {
        let title = UILabel()
        title.text = "Reminder"
        title.textColor = .white
        title.font = UIFont.boldSystemFont(ofSize: 32)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let logoView: UIImageView = {
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
        self.addSubview(titleLabelView)
        self.addSubview(logoView)
        setConstraints()
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabelView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 24),
            titleLabelView.centerYAnchor.constraint(equalTo: self.centerYAnchor,constant: -24),
            
            logoView.trailingAnchor.constraint(equalTo: titleLabelView.leadingAnchor, constant: -8),
            logoView.bottomAnchor.constraint(equalTo: titleLabelView.bottomAnchor)
        ])
    }
}
