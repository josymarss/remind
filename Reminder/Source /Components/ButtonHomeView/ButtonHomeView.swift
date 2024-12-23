//
//  ButtonHomeView.swift
//  Reminder
//
//  Created by Josymarss on 22/12/24.
//

import Foundation
import UIKit

class ButtonHomeView: UIView {
    
    private let iconView: UIView = {
        let iconView = UIView()
        iconView.backgroundColor = Colors.gray500
        iconView.layer.cornerRadius = 10
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()
    
    private let iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        return iconImageView
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        
        title.textColor = Colors.gray300
        title.font = Typography.subHeading
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let descriptionLabel: UILabel = {
        let description = UILabel()
        description.textColor = Colors.gray300
        description.font = Typography.body
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private let arrowImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "chevron.right"))
        image.tintColor = Colors.gray300
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    init(icon: UIImage?, title:String, description:String) {
        super.init(frame: .zero)
        self.layer.cornerRadius = 10
        self.backgroundColor = Colors.gray600
        self.translatesAutoresizingMaskIntoConstraints = false
        
        iconImageView.image = icon
        titleLabel.text = title
        descriptionLabel.text = description
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        self.addSubview(iconView)
        iconView.addSubview(iconImageView)
        
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(arrowImage)
        
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 80),
            iconView.widthAnchor.constraint(equalToConstant: 80),
            
            iconImageView.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 48),
            iconImageView.widthAnchor.constraint(equalToConstant: 48),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.medier),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: Metrics.medier),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.medier),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.medium),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: Metrics.medier),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: Metrics.medier),
            
            arrowImage.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            arrowImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medier),
            arrowImage.widthAnchor.constraint(equalToConstant: 16),
            arrowImage.heightAnchor.constraint(equalToConstant: 16)
            
            
            
            
            
            
            
            
            
            
            
            
            
        ])
    }
}
