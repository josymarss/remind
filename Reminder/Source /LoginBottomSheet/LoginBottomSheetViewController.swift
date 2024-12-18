//
//  LoginBottomSheetController.swift
//  Remnder
//
//  Created by Josymarss on 14/12/24.
//

import Foundation
import UIKit

class LoginBottomSheetController: UIViewController{
    var viewModel = LoginViewModel()
    var contentView: LoginBottomSheetView
    var hanldeAreaHeight: CGFloat = 50.0
    
    var flowDelegate: LoginBottomSheetFlowDelegate
    
    public init(contentView: LoginBottomSheetView, flowDelegate: LoginBottomSheetFlowDelegate){
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUp()
        setUpGestureHandler()
        panGestureHandler()
        bindView()
        // Delegate
        self.contentView.delegate = self
    }
    
    private func setUp() {
        self.view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
    }
    
    
    private func bindView() {
        viewModel.result = { [weak self] username in
            // Go to home page
//            self?.flowDelegate.navigateHome()
            self?.presentLoginAlertSave(email: username)
        }
        
        viewModel.errorResult = { [weak self] errorMessage in
            self?.presentAlertError(message: errorMessage)
        }
    }
    
    private func presentAlertError(message: String) {
        let alertController = UIAlertController(title: "Erro!", message: message, preferredStyle: .alert)
        
        let actionAlert = UIAlertAction(title: "alguma coisa foi mal, verifique internet e tente novamente", style: .default)
        
        alertController.addAction(actionAlert)
        self.present(alertController, animated: true)
    }
    
    private func presentLoginAlertSave(email: String){
        let alertController = UIAlertController(title: "Salvar acesso", message: "Deseja manter-se conectado no aplicativo?", preferredStyle: .alert)
        
        let actionAlert = UIAlertAction(title: "Salvar", style: .default) { action in
            let user = User(email: email, saved: true)
            UserDefaultsManager.saveUser(user: user)
            self.flowDelegate.navigateHome()
        }
        
        let cancelAlert = UIAlertAction(title: "Nao", style: .cancel) { _ in
            self.flowDelegate.navigateHome()
        }
        
        alertController.addAction(actionAlert)
        alertController.addAction(cancelAlert)
        self.present(alertController, animated: true)
    }
    private func setUpGestureHandler() {
        
    }
    
    private func panGestureHandler() {
        
    }
    
    func animateShow(completion: (() -> Void)? = nil) {
        
        self.view.layoutIfNeeded()
        contentView.transform = CGAffineTransform(translationX: 0, y:contentView.frame.height)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        let heightConstraint: () = contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
}



extension LoginBottomSheetController: LoginBottomSheetProtocol {
    func authUser(email: String, password: String) {
        viewModel.authUser(email: email, password: password)
    }
}
