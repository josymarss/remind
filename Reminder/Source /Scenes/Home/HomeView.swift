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
        setUpTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let contentBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Metrics.medium
        view.clipsToBounds = true
        view.backgroundColor = Colors.gray800
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let prescriptionButtomView: ButtonHomeView = {
        let button = ButtonHomeView(icon: UIImage(named: "paper"), title: "Minhas receitas", description: "Acompanhe os medicamentos e gerencie lembretes")
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let newPrescriptionButtomView: ButtonHomeView = {
        let button = ButtonHomeView(icon: UIImage(named: "pills"), title: "Nova receita", description: "Cadastre novos lembretes e receitas")
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let profileBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray600
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
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
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.text = "Test"
        textField.returnKeyType = .done
        textField.placeholder = "Insira seu nome"
        textField.textColor = Colors.gray100
        textField.font = Typography.heading
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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
        self.addSubview(profileBackground)
        profileBackground.addSubview(imageView)
        profileBackground.addSubview(welcomeLabel)
        profileBackground.addSubview(nameTextField)
        
        self.addSubview(contentBackground)
        contentBackground.addSubview(feedBackButton)
        contentBackground.addSubview(prescriptionButtomView)
        contentBackground.addSubview(newPrescriptionButtomView)
        
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
            
            nameTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: Metrics.little),
            nameTextField.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            
            
            contentBackground.topAnchor.constraint(equalTo: profileBackground.bottomAnchor, constant: Metrics.medium),
            contentBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            feedBackButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
            feedBackButton.bottomAnchor.constraint(equalTo: contentBackground.bottomAnchor, constant: -Metrics.medium),
            feedBackButton.leadingAnchor.constraint(equalTo: contentBackground.leadingAnchor, constant: Metrics.medium),
            feedBackButton.trailingAnchor.constraint(equalTo: contentBackground.trailingAnchor, constant: -Metrics.huge),
            
            prescriptionButtomView.topAnchor.constraint(equalTo: contentBackground.topAnchor, constant: Metrics.huge),
            prescriptionButtomView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            prescriptionButtomView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            prescriptionButtomView.heightAnchor.constraint(equalToConstant: 112),
            
            newPrescriptionButtomView.topAnchor.constraint(equalTo: prescriptionButtomView.bottomAnchor, constant: Metrics.medium),
            newPrescriptionButtomView.leadingAnchor.constraint(equalTo: prescriptionButtomView.leadingAnchor),
            newPrescriptionButtomView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            newPrescriptionButtomView.heightAnchor.constraint(equalTo: prescriptionButtomView.heightAnchor)
            
            
            
            
            
            
            
            
            
            
        ])
    }
    
    private func setGestureRecognizer(){
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImage))
        
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    private func setUpTextField() {
        nameTextField.addTarget(self, action: #selector(nameTextFIledDidEndEditing), for: .editingDidEnd)
        nameTextField.delegate = self
    }
    
    @objc func didTapImage() {
        delegate?.didTapImage()
    }
    
    @objc
    func nameTextFIledDidEndEditing() {
        
    }
}

extension HomeView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let userName = nameTextField.text ?? ""
        UserDefaultsManager.saveUserName(name: userName)
        return true
    }
}
