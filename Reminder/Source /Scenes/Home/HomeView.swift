//
//  HomeView.swift
//  Reminder
//
//  Created by Josymarss on 20/12/24.
//

import UIKit

class HomeView: UIView {
    weak public var delegate: HomeViewFlowDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
        setGestureRecognizer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let profileBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray600
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let contentBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Metrics.medium
        view.clipsToBounds = true
        view.backgroundColor = Colors.gray800
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "user")
        image.isUserInteractionEnabled = true
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = Metrics.huge
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Bem vindo"
        label.textColor = Colors.gray200
        label.font = Typography.input
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.gray100
        label.font = Typography.heading
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let feedBackButton: UIButton = {
        let button = UIButton()
        button.setTitle("Avaliar", for: .normal)
        button.backgroundColor = Colors.gray100
        button.layer.cornerRadius = Metrics.medium
        button.setTitleColor(Colors.gray800, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setUp(){
        self.backgroundColor = Colors.gray600
        self.addSubview(profileBackground)
        profileBackground.addSubview(imageView)
        profileBackground.addSubview(welcomeLabel)
        profileBackground.addSubview(nameLabel)
        
        self.addSubview(contentBackground)
        contentBackground.addSubview(feedBackButton)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            profileBackground.topAnchor.constraint(equalTo: self.topAnchor),
            profileBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileBackground.heightAnchor.constraint(equalToConstant: Metrics.backgroundImageSize),
            
            imageView.topAnchor.constraint(equalTo: profileBackground.topAnchor, constant: Metrics.huge),
            imageView.leadingAnchor.constraint(equalTo: profileBackground.leadingAnchor, constant: Metrics.medium),
            imageView.heightAnchor.constraint(equalToConstant: Metrics.profileImageSize),
            imageView.widthAnchor.constraint(equalToConstant: Metrics.profileImageSize),
            
            welcomeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Metrics.small),
            welcomeLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: Metrics.little),
            nameLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            
            
            contentBackground.topAnchor.constraint(equalTo: profileBackground.bottomAnchor, constant: Metrics.medium),
            contentBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            feedBackButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
            feedBackButton.bottomAnchor.constraint(equalTo: contentBackground.bottomAnchor, constant: -Metrics.medium),
            feedBackButton.leadingAnchor.constraint(equalTo: contentBackground.leadingAnchor, constant: Metrics.medium),
            feedBackButton.trailingAnchor.constraint(equalTo: contentBackground.trailingAnchor, constant: -Metrics.huge)
            
        ])
    }
    
    private func setGestureRecognizer(){
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImage))
        
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func didTapImage() {
        delegate?.didTapImage()
    }
}
