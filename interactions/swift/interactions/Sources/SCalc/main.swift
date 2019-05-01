import StringCalculator

let arguments = CommandLine.arguments

if arguments.count != 2 {
    
    print("\nUSAGE: scalc \"[operands]\"")
    print("\nOperands:")
    print("- An empty string will return 0")
    print("- A single number string will return it's number representation")
    print("- A negative number will return an error")
    print("\nDelimiters:")
    print("- A comma `,` can be used to separate multiple operands")
    print("- A newline `\n` can be used to separate multiple operands")
    print("- A newline `\n` and a comma `,` can be used to separate multiple operands")
    print("- A custom delimiter can be specified using the following format `//`[delimiter]`\n`[operand][delimiter][operand]")
    
} else {
    
    let input = arguments[1]
    
    do {
    
        let result = try StringCalculator().add(input)
    
        print("The result is \(result)")
        
    } catch {
        
        let calculatorError = error as! StringCalculator.Exception
        
        switch calculatorError {
            
        case .negativeOperands(let message, let operands):
            
            let list = operands.flatMap { String($0) }.joined(separator: ", ")
            
            print("\(message): \(list)")
            
        }
        
    }
    
}
