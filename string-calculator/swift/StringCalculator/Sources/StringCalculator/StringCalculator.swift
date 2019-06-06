import Foundation

// MARK: - CalculatorInput

protocol CalculatorInput {

  var operands: [Int] { get }

  var negativeOperands: [Int] { get }

}

struct Input: CalculatorInput {

  var operands: [Int] {

    return delimitedNumbers

  }

  var negativeOperands: [Int] {

    return operands.filter { $0 < 0 }

  }

  private var delimitedNumbers: [Int] {

    return delimitedStrings.map { Int($0)! }

  }

  private var delimitedStrings: [String] {
    
    guard !rawInput.isEmpty else {

      return ["0"]

    }

    if rawInput.starts(with: "//") {

      if let newlineRange = rawInput.range(of: "\n") {

        let customDelimitedString = rawInput[newlineRange.upperBound...]

        return customDelimitedString.components(separatedBy: delimiters)

      }

      return ["0"]

    } else {

      return rawInput.components(separatedBy: delimiters)

    }

  }

  private var delimiters: CharacterSet  {

    var delimiters = ""

    if let commaIndex = rawInput.index(of: ",") {

      delimiters.append(rawInput[commaIndex])

    }

    if let newlineIndex = rawInput.index(of: "\n") {

      if rawInput.starts(with: "//") {

        if let slashRange = rawInput.range(of: "//") {

          let customDelimiter = String(rawInput[slashRange.upperBound..<newlineIndex])

          delimiters.append(customDelimiter)

        }

      } else {

        delimiters.append(rawInput[newlineIndex])

      }

    }

    return CharacterSet(charactersIn: delimiters)

  }

  private let rawInput: String

  init(_ rawInput: String) {

    self.rawInput = rawInput

  }

}

// MARK: - Calculator

public protocol Calculator {

  func add(_ input: String) throws -> Int

}

public struct StringCalculator: Calculator {
  
  public enum Exception: Error {

    case negativeOperands(message: String, operands: [Int])

  }

  public init() {}

  public func add(_ input: String) throws -> Int {

    let input = Input(input)

    guard input.negativeOperands.isEmpty else {

      throw Exception.negativeOperands(message: "negatives not allowed",
                                       operands: input.negativeOperands)

    }

    return input.operands.reduce(0, +)

  }

}
