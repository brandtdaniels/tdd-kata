import Foundation
import Nimble
import Quick
@testable import StringCalculator

class StringCalculatorSpec: QuickSpec {

  override func spec() {

    describe("A string calculator") {

      var stringCalculator: StringCalculator!

      beforeEach {

        stringCalculator = StringCalculator()

      }

      context("when adding") {

        context("with an empty string") {

          it("should return 0 from \"\"") {

            expect { try stringCalculator.add("") }.to(equal(0))

          }

        }

        context("with a single number string") {

          it("should return 1 from \"1\"") {

            expect {try stringCalculator.add("1")}.to(equal(1))

          }

        }

        context("with a comma separated two number string") {

          it("should return 3 from \"1,2\"") {

            expect { try stringCalculator.add("1,2") }.to(equal(3))

          }

        }

        context("with an unknown amount of numbers") {

          it("should return 45 from \"1,2,3,4,5,6,7,8,9\"") {

            expect {try stringCalculator.add("1,2,3,4,5,6,7,8,9") }.to(equal(45))

          }

        }

        context("with new lines instead of commas") {

          it("should return 3 from \"1\n3\"") {

            expect { try stringCalculator.add("1\n2") }.to(equal(3))

          }

        }

        context("with new lines and commas") {

          it("should return 6 from \"1\n2,3\"") {

            expect { try stringCalculator.add("1\n2,3") }.to(equal(6))

          }

        }

        context("with a custom delimiter") {

          it("should return 3 from \"//;\\n1;2\"") {

            expect { try stringCalculator.add("//;\n1;2") }.to(equal(3))

          }

        }

        context("with a negative number") {

          it("should return an error message \"negatives not allowed\" with a list of negative numbers") {

            expect { try stringCalculator.add("-1,1") }.to(throwError(StringCalculator.Exception.negativeOperands(message: "negatives not allowed", operands: [-1])))

          }

        }

      }

    }

  }

}
