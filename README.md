# Mars Robots
This is an exercise to control robots on mars. 

# Approach
Ruby and Rails where chosen not because it's a best fit, (Node.js is probably a better fit for this particular problems) but because this is the setup I currently have and it easy to get going.
I normally build code in TDD fashion, especially when dealing with dynamic languages like Ruby. This solution has a limited number of tests and in production scenario would have a better coverage.

# Corners cut
As the task has to take couple of hours I did intentionally cut quite a few corners and the result code is very far from production quality. Below I have outlined some of the things I compromised on and which I can go over and explain how they need to be done correctly.

## Rest
This application's routes and controllers aren't very restful and could be improved

## Tests
- Very few tests 
- No good rspec structuring
- Tests need refactoring
- No routing, controllers, integration tests
- No factories use to build test objects

## Error handling
- A lot of error cases are not covered
- No user input validation
- No exception handling

## Code refactoring
- Better naming
- Make code more DRY
- logic could be simplified

## Interface
Interface is very rudimental and could be improved
 
## Project structure
- better code structure
- removed unused Rails features
- removed unused folders

# Running project

## Prerequisite

Ruby 2.2.4

## Running

To run tests: `rake`
To run server locally: `rails server`

Sample input:
```
5 3
1 1 E
RFRFRFRF

3 2 N
FRRFLLFFRRFLL

0 3 W
LLFFFLFLFL
```