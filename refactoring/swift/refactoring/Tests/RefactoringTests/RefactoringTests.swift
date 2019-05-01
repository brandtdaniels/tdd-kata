import Nimble
import Quick
@testable import Refactoring

class PasswordVerifierSpec: QuickSpec {
    
    override func spec() {
        
        describe("A password verifier") {
            
            context("when verifying a password") {
                
                it("should throw an exception when password is less than 9 characters") {
                    
                    let password = MockPassword(tooShort: true)
                    
                    let error = Verifier.Exception.minimumLength(message: "Password should be at least 9 characters")
                    
                    expect { try Verifier().verify(password) }.to(throwError(error))
                    
                }
                
                it("should throw an exception when a password is empty") {
                    
                    let password = MockPassword(empty: true)
                    
                    let error = Verifier.Exception.empty(message: "Password should not be empty")
                    
                    expect { try Verifier().verify(password) }.to(throwError(error))
                    
                }
                
                it("should throw an exception when a password does not contain at least one uppercase letter") {
                    
                    let password = MockPassword(missingUpper: true)
                    
                    let error = Verifier.Exception.missingUpper(message: "Password should contain at least one uppercase letter")
                    
                    expect { try Verifier().verify(password) }.to(throwError(error))
                    
                }
                
                it("should throw an exception when a password does not contain at least one lowercase letter") {
                    
                    let password = MockPassword(missingLower: true)
                    
                    let error = Verifier.Exception.missingLower(message: "Password should contain at least one lowercase letter")
                    
                    expect { try Verifier().verify(password) }.to(throwError(error))
                    
                }
                
                it("should throw an exception when a password does not contain at least one number") {
                    
                    let password = MockPassword(missingNumber: true)
                    
                    let error = Verifier.Exception.missingNumber(message: "Password should contain at least one number")

                    expect { try Verifier().verify(password) }.to(throwError(error))
                    
                }
                
                it("should not throw an exception when three previous conditions pass") {
                    
                    let password = MockPassword(tooShort: false, empty: false, missingUpper: false, missingNumber: true, minPassingCount: 3)
                    
                    expect { try Verifier().verify(password) }.toNot(throwError())
                    
                }
                
                it("should always throw an exception when password does not contain a lowercase letter") {
                    
                    let password = MockPassword(tooShort: false, empty: false, missingUpper: false, missingLower: true, minPassingCount: 3)
                    
                    let error = Verifier.Exception.missingLower(message: "Password should contain at least one lowercase letter")
                    
                    expect { try Verifier().verify(password) }.to(throwError(error))
                    
                }
                
            }
            
        }
        
    }
    
}

// MARK: - Mocks

class MockPassword: Password {

    var isPassing: Bool {
        
        return passingCount >= minPassingCount && !isMissingLower
        
    }
    
    var isTooShort: Bool {
        
        if !tooShort { passingCount += 1 }
        
        return tooShort
        
    }
    
    var isEmpty: Bool {
        
        if !empty { passingCount += 1 }
        
        return empty
        
    }
    
    var isMissingUpper: Bool {
        
        if !missingUpper { passingCount += 1 }
        
        return missingUpper
        
    }
    
    var isMissingLower: Bool {
        
        if !missingLower { passingCount += 1 }
        
        return missingLower
        
    }
    
    var isMissingNumber: Bool {
        
        if !missingNumber { passingCount += 1 }
        
        return missingNumber
        
    }
    
    private let tooShort: Bool
    
    private let empty: Bool
    
    private let missingUpper: Bool
    
    private let missingLower: Bool
    
    private let missingNumber: Bool
    
    private let minPassingCount: Int
    
    private var passingCount = 0

    init(tooShort: Bool = false,
         empty: Bool = false,
         missingUpper: Bool = false,
         missingLower: Bool = false,
         missingNumber: Bool = false,
         minPassingCount: Int = 5) {
        
        self.minPassingCount = minPassingCount
        
        self.tooShort = tooShort
        
        self.empty = empty
        
        self.missingUpper = missingUpper
        
        self.missingLower = missingLower
        
        self.missingNumber = missingNumber
        
    }
    
    required init(_ password: String, _ minPassingCount: Int?) {
        
        self.minPassingCount = 5

        self.tooShort = false
        
        self.empty = false
        
        self.missingUpper = false
        
        self.missingLower = false
        
        self.missingNumber = false
        
    }
    
}
