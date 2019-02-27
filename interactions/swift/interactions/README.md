# Interactions

The following is a TDD Kata - an exercise in coding, refactoring and test-first, that you should apply daily for at least 15 minutes.

## Setup

Clone the repository and create a unique branch.

This is a Swift package.

To run tests: `swift test`

Optionally generate an Xcode project: `swift package generate-xcodeproj`

## Before you start

This kata is based on the previous String Calculator Kata. It is meant to be a continuation of the teaching process about unit testing and TDD. In this part of the teaching process, the kata forces you to think about interacting with the user, and subsequently to perform interation testing using mocks, and possible some stubs (what’s the difference?)

### It’s not going to be a piece of cake

Because this kata requires interaction testing, many students find this kata much harder to accomplish than the first string calculator kata. That’s ok. Getting interaction testing takes longer. Don’t worry if you find yourself struggling with this for a day or even two or three. even in class, with me there, students can take a couple of hours and sometimes up to five hours to accomplish the steps in the kata in this page, with me coaching them.

The biggest problem that people face is that they get so mired in the details of how to fake this and that, they end up faking too much, and not really testing anything. Sometimes students will lose track of what it is they are trying to test in the first place. Now, more than ever, good test names can save you. By writing down in the test name the three main parts of the test (what’s being tested, under what conditions, and what should the expected behavior be under those conditions).

When you are lost, the test name becomes your map and guide, to make sure your test follows what you wrote down in the test name, in each of its parts. The end behavior is what the mock should be asserting. The conditions are the setup code. The “what” is the “act” part of the test. that’s the thing you invoke. people get those mixed up a lot when getting through this, be careful!

I would recommend NOT to write any code in the test method body until you get the name good enough to explain as an english sentence. This can even take 30 minutes at first, and that’s perfectly OK. it’s part of you getting to grips with the actual problem and how to solve it.

### How to work with this Kata

Add the following features to String Calculator (either in the same class, or using any other structure or design you’d like). Make sure to go through them one at a time and try not to look ahead. Imagine this is a real project where each feature is requested the day after you’ve finished implementing the feature before it.

**The Kata**

1. Add Logging Abilities to your new String Calculator (to an ILogger.Write()) interface (you will need a mock). Every time you call Add(), the sum result will be logged to the logger.

2. When calling Add() and the logger throws an exception, the string calculator should notify an IWebservice of some kind that logging has failed with the message from the logger’s exception (you will need a mock and a stub).


*A More Difficult Variation of the Kata*

1. Everytime you call Add(string) it also outputs the number result of the calculation in a new line to the terminal or console. Remember to try and do this test first!


1. Create a program (test first) that uses string calculator, which the user can invoke through the terminal/console by calling “scalc ‘1,2,3’” and will output the following line before exiting: “The result is 6”

2. Instead of exiting after the first result, the program will ask the user for “another input please” and print the result of the new user input out as well, until the user gives no input and just preses enter. In that case it will exit.

**Hints**

- How can you check if something was output to the console? In ruby you can just override the ‘puts’ method or use one of the isolation frameworks to fake it and check that it was called. In .NET, the Console class has a static method called “SetOut” that takes a text writer. Combine that with a StringBuilder, and you have a built in way to create a mock that can check what was sent to the console. Another option is to abstract the output medium completly into its own class or interface such as IOutput, that can be used to ‘mediate’ between the real console and the inputs and outputs.

- For test driving a console application, if you’re using .NET, you can test-first a public static Main(params string args[]) function which is the root of the console application. No need to create a new process in your tests.

- For number 3, you will need to devise a way to “wait” for user input without really waiting for a real user. Your test will need to give two seperate inputs to the program, and it should run fast, and not wait for any manual interaction from you. Think about how to do that.

- Can’t think of a way? What if you were to extract a special method called GetNextUserInput() that returns the string the user has provided? Then you can overide that method in your tests (using extract and override if you need to) and return “fake” user inputs to test the system.

## Source

TDD Kata 2 [http://osherove.com/tdd-kata-2/](http://osherove.com/tdd-kata-2/)
