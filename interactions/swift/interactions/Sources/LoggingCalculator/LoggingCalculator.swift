import Foundation
import StringCalculator

// MARK: - Logger

protocol Logger {
    
    func write(_ result: String)
    
}

// MARK: - Calculator

struct LoggingCalculator: Calculator {
    
    private let calculator: Calculator
    
    private let logger: Logger
    
    init(_ calculator: Calculator, _ logger: Logger) {
        
        self.calculator = calculator
        
        self.logger = logger
        
    }
    
    func add(_ input: String) throws -> Int {

        do {
            
            let result = try calculator.add(input)
            
            logger.write("\(result)")
            
            return result
            
        } catch {
            
            throw error
            
        }
        
    }
    
}
