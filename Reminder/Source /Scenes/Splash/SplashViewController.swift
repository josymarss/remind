import UIKit

class SplashViewController: UIViewController {
    let contentView: SplashView
    public weak var flowDelegate: SplashFlowDelegate?
    
    public init(contentView: SplashView, flowDelegate: SplashFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scaleLogo()
        setGestureHandler()
        // Do any additional setup after loading the view.
        setUp()
    }
    
    private func decideFlowNavigation() {
        if let user = UserDefaultsManager.loadUser(), user.saved {
            flowDelegate?.navigateToHome()
        }else {
            showLoginSheet()
        }
    }
    
    private func setUp() {
        self.view.addSubview(contentView)
        self.view.backgroundColor = Colors.primaryRedBase
        addConstraints()
    }
    
    private func setGestureHandler(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginSheet))
        self.view.addGestureRecognizer(tapGesture)
    }
        
    @objc private func showLoginSheet() {
        logoUp()
        self.flowDelegate?.openBottomSheet()
    }
    
    private func addConstraints() {
        self.setUpConstraintsViewController(contentView: contentView)
    }

}

// MARK: Animations
extension SplashViewController {
    func scaleLogo() {
        UIView.animate(withDuration: 1.5, delay: 0.0, animations: {
            self.contentView.logoView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: {_ in
            self.decideFlowNavigation()
        })
    }
    
    func logoUp() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations:{
            self.contentView.logoView.transform = self.contentView.logoView.transform.translatedBy(x: 0, y: -150)
        })
    }
}
