# DemoExceptionInCMark
A minimal iOS Application in Swift to Demonstrate an Abort in CMark

I created this quickie project because my application _OpenLibrary Browser_ crashed while attempting to display the biography for _Flannery O'Connor_. I traced the problem to the point where _CMark_ calls the _abort()_ function.

I put the offending text into a file named _FlanneryO'ConnorBio.md_.
