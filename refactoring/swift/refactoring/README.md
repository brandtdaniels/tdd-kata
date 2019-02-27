# Refactoring

The following is a TDD Kata - an exercise in coding, refactoring and test-first, that you should apply daily for at least 15 minutes.

## Setup

Clone the repository and create a unique branch.

This is a Swift package.

To run tests: `swift test`

Optionally generate an Xcode project: `swift package generate-xcodeproj`

## Password Verifier

Create a password verifications class called “PasswordVerifier”.

1. Add the following verifications to a master function called “Verify()”

    1. password should be larger than 8 chars

    2. password should not be null

    3. password should have one uppercase letter at least

    4. password should have one lowercase letter at least

    5. password should have one number at least

Each one of these should throw an exception with a different message of your choosing.

2. Add feature: Password is OK if at least three of the previous conditions is true

3. Add feature: password is never OK if item 1.4 is not true.

Assume each verification takes 1 second to complete. How would you solve items 2 and 3 so tests can run faster?

## Source

TDD Kata 3 [http://osherove.com/tdd-kata-3-refactoring/](http://osherove.com/tdd-kata-3-refactoring/)
