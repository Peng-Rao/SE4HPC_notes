#import "@local/simple-note:0.0.1": *
= Testing
== Introduction
*Testing Workflow* is a *type of software testing that verifies that each software workflow accurately reflects the given business process*. A workflow is a series of tasks to produce a desired result, usually involving several stages or steps. For any business process, testing these sequential steps is defined as "workflow testing".

#figure(
  image("../figures/testing-workflow.jpg", width: 90%),
  caption: [ Testing workflow ],
)

*Testing* (dynamic analysis) is an approach to verification. The *main goal of testing is to make programs fail*. Other common goals are:
- Exercise different parts of a program to increase coverage;
- Make sure the interaction between components works (integration testing);
- Support *fault localization* and *error removal* (debugging);
- Ensure that *bugs introduced in the past do not happen again *(regression testing).
Program testing can be used to show the presence of bugs, but never to show their absence!

== Debugging
*Debugging* is a systematic approach to *fault localization and error removal*. The output is often used to support debugging.

#figure(image("../figures/debugging.jpg", width: 70%))

#pagebreak()

== Test case
#definition("Test case")[
  A *Test Case* is a set of inputs, *execution conditions*, and a *pass/fail criterion*.
]
Running a test case typically involves setup, execution and teardown.
- Setup. Bring the program to an initial state that fulfils the execution conditions.
- Execution. Run the program on the actual inputs.
- Teardown. Record the output, the final state, and any failure determined based on the pass/fail criterion.

A test set, or test suite, can include multiple test cases. Finally, a *Test Case Specification* is a requirement to be satisfied by one or more test cases.

== Unit Testing
When discussing test cases, it's necessary to introduce *Unit Testing*. This is conducted by developers and aims to test small pieces (units) of code in isolation. However, when we test in isolation, there should be a problem: the units may depend on other units. Then, we need to simulate missing units.

The *Integration Testing* (integration of the unit tests) aims to exercise the interaction between *interfaces and components*. The faults discovered by integration testing are multiple; some examples:
- Inconsistent interpretation of parameters (e.g. mixed units meters or yards)
- Violations of assumptions about domains (e.g. buffer overflow)
- Side effects on parameters or resources (e.g. conflict on temporary file)
- Nonfunctional properties (e.g. unanticipated performance issues)
- Concurrency-specific problems

Typically, the integration test is defined by the Design Document. In the Design Document, we can find two types of plans:
- Build Plan that establishes the order of the implementation;
- A Test Plan that defines how to carry out integration testing is needed.

#pagebreak()

== Integration Testing
=== Big Bang
Test only after integrating all modules together (not even a real strategy).
\
*Pros*: Does not require stubs, requires less drivers/oracles
\
*Cons*:
- Minimum observability, fault localization/diagnosability, efficacy, feedback
- High cost of repair

=== Iterative and incremental strategies
The main action is run after components are released (not just at the end). The strategy can be done in three different ways:

Based on the hierarchical structure of the system. It can be done *top-down* or *bottom-up*.

==== *Top-down strategy*
Work from the top level (in terms of "use" or "include" relationship) down to the bottom level. As modules are completed (according to the building plan), more functionality is testable. We also need to replace some stubs, and we need other stubs for lower levels. *When all modules are incorporated, the whole functionality can be tested.*
- *Pros*: The drivers use the top level interfaces (e.g. REST APIs).
- *Cons*: This strategy requires stubs of used modules at each step of the process.

#figure(
  image("../figures/example-top-down.jpg", width: 50%),
  caption: [ Example of top-down strategy ],
)

==== *Bottom-up strategy*
Starting from the leaves of the "uses" hierarchy.
- *Pros*: An advantage is that it doesn't require stubs.
- *Cons*: Typically requires more drivers (one for each module, as in unit testing). Another thing to consider is that it may create several working subsystems, and each working subsystem will eventually be integrated into the final one.

#figure(
  image("../figures/example-bottom-up.jpg", width: 50%),
  caption: [ Example of bottom-up strategy ],
)

==== *Threads strategy*
A thread is a part of several modules that together provide a user-visible programme function. By using the thread strategy we can have some advantages.
\
*Pros*:
- We can maximize the progress visible to the user (or other stakeholders);
- Reduce drivers and stubs;
- An integration plan is usually more complex.

#figure(
  image("../figures/example-thread.jpg", width: 50%),
  caption: [ Example of thread strategy ],
)

==== *Critical modules strategy*
The critical modules strategy starts with the highest risk modules. Risk assessment is a necessary first step. *The key point of this strategy is the risk-oriented process*. Integration and testing as a risk mitigation activity, designed to deliver any bad news as early as possible.

#figure(
  image("../figures/summary-integration-test-strategies.jpg", width: 80%),
  caption: [ Summary of integration test strategies ],
)

Given the three strategies above, which one should we choose? Well, the structural strategies (bottom-up or top-down) are simpler, but thread and critical modules provide better external visibility of progress (especially in complex systems).

So the *best choice* should be a *combination of different strategies*:
- Use *top-down/bottom-up* for relatively small components and subsystems;
- *Combinations of thread and critical module* integration testing for larger subsystems.

== E2E Testing
#definition("End-to-end (E2E)")[
  *End-to-end (E2E)* testing is a software testing methodology to test a functional and data application flow consisting of several sub-systems working together from start to end.
]
At times, these systems are developed in different technologies by different teams or organizations. Finally, they come together to form a functional business application. Hence, testing a single system would not suffice. Therefore, *end-to-end testing* verifies the application from start to end putting all its components together.

The following is a list of common types of tests that use the E2E system:

- *Functional testing*: Check whether the software meets the functional requirements.
- *Performance testing*:
  - Detect *bottlenecks* affecting response time, utilization, throughput
  - Detect *inefficient algorithms*
  - Detect *hardware/network issues*
  - Identify *optimization possibilities*
- *Load Testing*:
  - *Expose bugs* such as memory leaks, mismanagement of memory,buffer overflows
  - Identify *upper limits of components*
  - *Compare alternative architectural options*
- *Stress Testing*: Make sure that the system recovers gracefully after failure.

#pagebreak()

== Test case Generation
Test cases can be generated in a *black-box* or *white-box manner*. The *White Box* is a generation based on *code features*. Meanwhile, the *Black Box* is a generation based on *specification features*.

Test case generation can be done manually or automatically. Automatic generation can be done in several ways:
- *Combinatorial testing*. It enumerates all possible inputs according to some policy (e.g. smaller to larger).
- *Concolic Execution*. It's a pseudo-random generation of inputs guided by symbolic path properties.
- *Fuzz testing (fuzzing)*. It's a pseudo-random generation of inputs, including invalid, unexpected inputs.
- *Search-based* testing. It explores the space of valid inputs, looking for those that improve some metric (e.g. coverage, diversity, fault inducing capability).
- *Metamorphic testing*. Generates new test cases based on some metamorphic relationships and other previously defined test cases.

=== Concolic Execution
*Concolic Execution* (concrete-symbolic execution) is an automatic generation of test cases. It's a pseudo-random generation of inputs guided by symbolic path properties.

In other words, the concolic execution *performs symbolic execution* alongside concrete execution (concrete inputs). Under the hood, in concolic execution a *state* combines a symbolic part and a concrete part, used as needed to make progress in the exploration.

The steps are then as follows:
- Concrete $arrow$ Symbolic, derive conditions to explore new paths.
- Symbolic $arrow$ Concrete, simplifying conditions to generate concrete inputs.

Let's take an example to clarify the explanation.

See the code below:
```python
def m2 (x: int , y : int):
  z: int = bb (y) # black - box function
  if z == x:
    z = y + 10
    if x <= z:
      print(" Log message .")
```
Let's explore all the paths of the m2 method, starting with *a (random) concrete input* and at the same time building the *symbolic condition* of the explored path. Unfortunately, in some cases we will not be able to solve the symbolic execution. For example, the behavior of the first if-condition (z == x) is unknown in the code. For this reason, we execute it with the identified input cases: given y = 7, run bb(7) and return 14. With this arrangement, the condition can be solved.

=== Concurrent systems testing
There are many difficulties in testing concurrent software. For example, the concurrency bugs are non-deterministic and can only manifest themselves within certain interleavings. Furthermore, the interleavings depend on execution conditions that are not under the direct control of the program.

== Testing Frameworks
In software development, we typically use *unit testing frameworks* such as the xUnit frameworks (for example, JUnit and NUnit), which allow us to run unit tests to determine whether different parts of the code behave as expected under different circumstances.

The elements of unit test frameworks:
- *Test Runner*: it's a component that orchestrates the execution of tests and delivers the result to the user. The runner can use a graphical inter-face, a textual interface or return a special value to indicate the results of the execution of the tests.
- *Test Case*: in most cases this is a class from which our application-specific code inherits.
- *Test Fixture*: it represents the preparation needed to set up the initial state required for a test case before the test, and to return to the original state after the test.
- *Test Suite*: this is a collection of test cases that share the same fixture.
- *Assertions*: the functions/macros that check the state or output of the system under test (oracles).

#pagebreak()
