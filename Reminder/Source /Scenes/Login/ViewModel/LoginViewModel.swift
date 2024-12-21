import Foundation
import Firebase

class LoginViewModel {
    var result: ((String) -> Void)?
    var errorResult: ((String) -> Void)?
    
    func authUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                self.errorResult!("Erro ao fazer login!")
                return
            }else {
                self.result!(email)
            }
        }
    }
}
