# Xcode TDD Kata: Practice with the Bowling Game

How do you learn Test Driven Development? I could explain the principles and practices of Xcode TDD, but the question that comes back is, “But what do I actually do in Xcode?”

That’s what the Bowling Game TDD Kata is for. There’s an [Objective-C version](https://qualitycoding.org/files/BowlingGame-ObjectiveC.pdf) and a [Swift version](https://qualitycoding.org/files/BowlingGame-Swift.pdf).

![TDD Code Kata](https://qualitycoding.org/jrwp/wp-content/uploads/2011/08/code-kata-1.jpg)

## What’s a code kata?

“Kata” is a Japanese martial arts term for choreographed patterns of movement. Also called “forms,” both students and masters practice these detailed patterns over and over, so that the movements can come without thought.

A “code kata” applies this idea to coding. Some use the term to refer to coding puzzles (how would you code this or that) but let’s be faithful to the martial arts metaphor. A code kata is a set of moves, meant to be memorized and practiced until they can flow effortlessly.

So a “TDD kata” is designed to train your TDD muscles. [“Uncle Bob” Martin designed the Bowling Game Kata](http://butunclebob.com/ArticleS.UncleBob.TheBowlingGameKata) to impart the moves of Test Driven Development. I have taken his presentation and created a version showing these moves in Xcode, using either Objective-C or Swift.

## The importance of a notepad in TDD

Before you start: **Make sure you have something to write with and a piece of paper.** An index card or sticky note is all the space you need.

In the upper-left corner of the slides, you will see a box with notes that looks like this:

![slide image](https://qualitycoding.org/jrwp/wp-content/uploads/2011/08/tdd-take-notes@2x.png)

Every time you see something there, jot it down on your paper.

**This is important!** TDD is a discipline of doing one thing at a time, so when we notice something to clean up, we write it down for later. When you are done with a clean-up item, cross it out.

## TDD Kata: Specific moves for the Bowling Game slides

Green lines show code that was just added. Red lines show code that is about to be removed. In this example, we added the last line, and are about two remove the two lines above it:

![function image](https://qualitycoding.org/jrwp/wp-content/uploads/2016/01/kata-annotations@2x.png)

Let me call out some specific slides…

**Slide 12:** Set up your Xcode display to mimic the slide. Do this as follows:

- *Objective-C:* Click the test file so it shows on the left. Option-click the .h file so it shows on the right. Shift-option-click the .m file and double-click the “+” in the bottom right. On the right side, you should have .h above and .m below.

- *Swift:* Click the test file so it shows on the left. Option-click the implementation file so it shows on the right.

**Slide 23:** *Currently Objective-C only…* Select the two circled lines, then try to use the contextual menu to Refactor → Extract. (If this causes Xcode to crash, just do it by hand.)

**Slide 40:** *Both Objective-C and Swift!* Rename loop variable “i” in one shot by selecting its first appearance and doing Edit All in Scope. This is available through the menus, or in a little pop-up menu that appears when you hover over a selection, as shown here:

![edit image](https://qualitycoding.org/jrwp/wp-content/uploads/2011/08/edit-all-in-scope@2x.png)

## Daily practice

If you’re doing this by yourself, I’d recommend going through the entire TDD kata, once.

Then following Marlena Compton’s advice in [Learning TDD with Katas](https://medium.com/@marlenac/learning-tdd-with-katas-3f499cb9c492#.z8qqh1je3), do 15 minutes a day. Set a timer. Stop when you get to 15 minutes. Try doing this daily.

## Source

Xcode TDD Kata: Practice with the Bowling Game [https://qualitycoding.org/tdd-kata/](https://qualitycoding.org/tdd-kata/)