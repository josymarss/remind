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
        setGestureHandler()
        // Do any additional setup after loading the view.
        setUp()
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
        self.flowDelegate?.openBottomSheet()
    }
    
    private func addConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),

        ])
    }

}
