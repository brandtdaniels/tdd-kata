// MARK: - PasswordVerifier

protocol PasswordVerifier {
    
    func verify(_ password: Password) throws
    
}

class Verifier: PasswordVerifier {
    
    enum Exception: Error {
        
        case minimumLength(message: String)
        
        case empty(message: String)
        
        case missingUpper(message: String)
        
        case missingLower(message: String)
        
        case missingNumber(message: String)
        
    }

    func verify(_ password: Password) throws {
        
        if password.isTooShort && !password.isPassing {
            
            throw Exception.minimumLength(message: "Password should be at least 9 characters")
            
        }
        
        if password.isEmpty && !password.isPassing {
            
            throw Exception.empty(message: "Password should not be empty")
            
        }
        
        if password.isMissingUpper && !password.isPassing {
            
            throw Exception.missingUpper(message: "Password should contain at least one uppercase letter")
            
        }
        
        if password.isMissingLower && !password.isPassing {
            
            throw Exception.missingLower(message: "Password should contain at least one lowercase letter")
            
        }
        
        if password.isMissingNumber && !password.isPassing {
            
            throw Exception.missingNumber(message: "Password should contain at least one number")
            
        }
        
    }
    
}

// MARK: - Password

protocol Password {
    
    var isPassing: Bool { get }
    
    var isTooShort: Bool { get }
    
    var isEmpty: Bool { get }
    
    var isMissingUpper: Bool { get }
    
    var isMissingLower: Bool { get }
    
    var isMissingNumber: Bool { get }
    
    init(_ password: String, _ minPassingCount: Int?)
    
}
