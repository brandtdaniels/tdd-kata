import Nimble
import Quick
import StringCalculator
@testable import LoggingCalculator

class LoggingCalculatorSpec: QuickSpec {
    
    override func spec() {
        
        describe("A logging calculator") {

            var stringCalculator: StringCalculator!
            
            beforeEach {
                
                stringCalculator = StringCalculator()
                
            }
            
            context("when adding") {
                
                it("should log the sum to a logger when adding") {
                    
                    let stringLogger = MockStringLogger()
                    
                    let loggingCalculator = LoggingCalculator(stringCalculator, stringLogger)
  
                    _ = try! loggingCalculator.add("1")
                    
                    expect(stringLogger.writeCallCount).to(equal(1))
                    
                }
                
                it("should notify a web service that logging has failed with the message from the logger's exception") {
                    
                    let logger = MockExceptionLogger(.loggingFailed(message: "logging failed"))
                    
                    let webService = MockWebService()
                    
                    let webServiceCalculator = MockWebServiceLoggingCalculator(stringCalculator, logger, webService)
                    
                    _ = try! webServiceCalculator.add("1")
                    
                    expect(webService.notifyCallCount).to(equal(1))
                    
                    expect(webService.notifyMessage).to(equal("logging failed"))
                    
                }
                
            }
            
        }
        
    }
    
}

// MARK: - Roles

protocol WebService {
    
    func notify(_ message: String)
    
}

protocol ExceptionLogger {
    
    func write(_ result: String) throws
    
}

// MARK: - Mocks

class MockStringLogger: Logger {
    
    var writeCallCount = 0
    
    func write(_ result: String) {
        
        writeCallCount += 1
        
    }
    
}

class MockWebService: WebService {
    
    var notifyCallCount = 0
    
    var notifyMessage = ""
    
    func notify(_ message: String) {
        
        notifyCallCount += 1
        
        notifyMessage = message
        
    }
    
}

struct MockWebServiceLoggingCalculator: Calculator {
    
    private let calculator: Calculator
    
    private let logger: ExceptionLogger
    
    private let webService: WebService
    
    init(_ calculator: Calculator, _ logger: ExceptionLogger, _ webService: WebService) {
        
        self.calculator = calculator
        
        self.logger = logger
        
        self.webService = webService
        
    }
    
    func add(_ input: String) throws -> Int {
        
        do {
            
            let result = try calculator.add(input)

            do {
                
                try logger.write("\(result)")
                
                
            } catch {
                
                let loggerException = error as! MockExceptionLogger.Exception
                
                switch loggerException {
                    
                case .loggingFailed(message: let message):
                    
                    webService.notify(message)
                    
                }
                
            }
            
            return result
            
        } catch {
            
            throw error
            
        }
    }
    
}

// MARK: - Stubbed Mocks

struct MockExceptionLogger: ExceptionLogger {
    
    enum Exception: Error {
        
        case loggingFailed(message: String)
        
    }
    
    private let exception: Exception
    
    init(_ exceptionToThrow: Exception) {
        
        self.exception = exceptionToThrow
        
    }
    
    func write(_ result: String) throws {
        
        throw exception
        
    }

}


