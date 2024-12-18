//
//  LoginBottomSheetView.swift
//  Remnder
//
//  Created by Josymarss on 14/12/24.
//

import Foundation
import UIKit

class LoginBottomSheetView: UIView {
    var delegate: LoginBottomSheetProtocol?
    
    private let titleLabel: UILabel = {
        let text = UILabel()
        text.text = "Entre para começar"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let handleArea: UIView = {
        let handleView = UIView()
        handleView.backgroundColor = .lightGray
        handleView.layer.cornerRadius = Metrics.tiny
        handleView.translatesAutoresizingMaskIntoConstraints = false
        return handleView
    }()
    
    private let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "youremail@email.com"
        emailTextField.borderStyle = .roundedRect
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        return emailTextField
    }()
    
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Entrar", for: .normal)
        button.backgroundColor = Colors.primaryBlueBase
        button.layer.cornerRadius = Metrics.tiny
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return button
    }()
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp () {
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.small
        
        self.addSubview(handleArea)
        self.addSubview(titleLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(button)
        
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            handleArea.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.small),
            handleArea.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            handleArea.widthAnchor.constraint(equalToConstant: 40),
            handleArea.heightAnchor.constraint(equalToConstant: 6),
            
            titleLabel.topAnchor.constraint(equalTo: handleArea.bottomAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.medium),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            button.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Metrics.medium),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            button.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    
    @objc func didTapLogin() {
        guard let _ = self.emailTextField.text else {
            return
        }
        
        guard let _ =  self.passwordTextField.text else {
            return
        }
        delegate?.authUser(email: self.emailTextField.text ?? "", password: self.passwordTextField.text ?? "")
    }
    
}
