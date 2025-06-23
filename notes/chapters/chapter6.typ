#import "@local/simple-note:0.0.1": *
= Verification and Validation
== Terminology
There are some differences between the terms *verification* and *validation*.

First of all, the *verification* is internal, while the *validation* is external. Assuming an abstract process with the following levels:

#figure(image("../figures/VV-terminology.jpg", width: 80%))

The verification is intended as: "Is level $i$ consistent with level $i + 1$?”. It's an internal consistency check. The validation is: "Does level i conform to needs?". It's an external consistency check.

Another fundamental topic when we speak about verification and validation is *Quality Assurance* (QA). It *defines the policies and processes to achieve quality*. So it can *judge the quality and find defects*.

A direct *consequence* of the QA is the improvement of the quality. With the term "quality", we refer to an ideal absence of defects (impossible) and an absence of other issues that prevent the fulfillment of non-functional requirements or the degradation of some software qualities.

Since it is impossible to have zero defects, a *periodic quality assurance evaluation is critical*. Ideally, every artifact shall be the subject of QA; even the verification artifact must be verified!

The V-model is a *graphical representation of a systems development lifecycle*. It is used to produce rigorous development lifecycle models and project management models. It describes the activities and the results that must be made during product development.

#figure(image("../figures/V-model.jpg", width: 80%), caption: [ V-model ])

The _left side_ of the "V" represents the decomposition of requirements and the creation of system specifications. The _right side_ of the "V" represents an integration of parts and their validation.

We have presented the V-model to help you understand where the verification can be placed. Now, the *verification* is concerned with the code and the architecture. Considering the *software* side, it has two possible approaches:
- *Static Analysis*. It is done using source code or other software artifacts but without execution. Note that the analysis is static, but the properties are dynamic.
- *Dynamic Analysis (Testing).* It is done by executing the sources. The analysis is made by comparing the actual behavior and the expected one.

On the other hand, to verify the architectural level, it is necessary to consider some aspects:
- The *structure must be consistent*. Some examples:
  - For every required interface, a corresponding provided interface exists.
  - Sequence diagrams are consistent with component diagrams and with the defined interfaces.
  - Each component has one or more modules that implement it.
- All *functional requirements must have the possibility to be satisfied*. Some examples:
  - Each requirement is mapped on one or more components.
  - Each use case event flow is detailed in terms of one or more sequence diagrams.
- *Concurrent use of resources must be correctly defined.* Problems like order violation or a deadlock are expected. Some techniques must be applied to analyze these problems.
- *Non-functional requirements must have the possibility to be fulfilled*.

#definition("DevOps")[
  DevOps is a *set of practices, tools, and a cultural philosophy that automate and integrate the processes between software development and IT teams*. It emphasizes team empowerment, cross-team communication and collaboration, and technology automation.
]

#pagebreak()

== Petri Net
It is necessary to model distributed systems to study the concurrent use of resources at the architectural level.

A *Petri Net (PT Net or P/T Net)*, a place/transition net (PT net), is one of several mathematical modelling languages used to describe distributed systems. Like industry standards such as UML activity diagrams, *Petri nets offer a graphical notation for stepwise processes* that include choice, iteration, and concurrent execution.

The Petri net uses a graphic tool. It is a bipartite-directed graph containing places (circles), transitions (bars), and directed arcs.

#figure(image("../figures/Petri-net-graphic.jpg", width: 50%), caption: [ Petri net graphic ])

A Petri net is a five-tuple $N = (P, T, F, W, M^0)$ where:
- $P$ is a finite set of places;
- $T$ is a finite set of transitions;
- $F$ is a flow relation between places and transitions and vice versa.
- $W$ is a weight function that assigns a positive integer to each arc in the flow relation;
- $M^0$ is the initial marking, a function that assigns a non-negative integer to each place.

Some observations of the Petri net:
- *In a given marking $M$, a transition $t$ can fire only if it is enabled.*
- An enabled transition not necessarily fires.
- More than one transition can be enabled in a marking.
- If two transitions are enabled at the same time:
  - Which one fires first is not determined;
  - Petri nets are an intrinsically nondeterministic model;
  - The firing of a transition might disabled another enabled transition.

=== Dynamics
*Enabling Rule*: A transition $t$ is enabled if every input place contains at least one token.
\
*Firing Rule*: Firing an enabled transition
- removes one token from each input place of the transition
- adds one token to each output place of the transition

#figure(image("../figures/dynamics.jpg", width: 40%))

=== Basic Constructs
==== Sequential Actions
Each action is a transition.

#figure(image("../figures/sequential-actions.jpg", width: 40%))

==== Dependency
A transition requires two inputs.

#figure(image("../figures/dependency.jpg", width: 40%))

==== Conflict Construct
Only one of the two transitions can fire.

#figure(image("../figures/conflict-construct.jpg", width: 40%))

==== Concurrency Construct
These two sequences can occur simultaneously.

#figure(image("../figures/concurrency-construct.jpg", width: 40%))

==== Synchronization
Machine can process one part at once.

#figure(image("../figures/synchronization.jpg", width: 40%))

==== Resource Sharing
One worker for two machines. The worker can work at one machine at a time.

#figure(image("../figures/resource-sharing.jpg", width: 40%))

==== Buffer (Queue)
The buffer can hold a limited number of parts.

#figure(image("../figures/buffer.jpg", width: 40%))

==== Producer-Consumer Model

#figure(image("../figures/petri-net-example-1.jpg", width: 40%), caption: [
  Example of Petri nets of producer-consumer model with unbounded buffer.
])

#figure(image("../figures/petri-net-example-2.jpg", width: 40%), caption: [
  Example of Petri nets of producer-consumer model with finite buffer with a parametric number of positions.
])

==== Deadlock

#figure(image("../figures/petri-net-example-3.jpg", width: 60%), caption: [
  Example of Petri nets of deadlock.
])

=== Example: Traffic Semaphore
Consider a *traffic semaphore* with the usual colors red, green and yellow. The semaphore can be of one color at a time and, in a cyclic manner, after being red, it can become green, then yellow, and then red again to restart the cycle.

==== Question 1
Assuming that the semaphore colors are modeled in a Petri net through the places *R, G and Y*, complete such Petri net to model the behavior of the semaphore. Provide a short and clear description of your model.

The Petri net consists of three places: *R* (red), *G* (green), and *Y* (yellow), representing the three colors of the semaphore. There are transitions between these places that model the cyclic behavior of the semaphore. The initial marking has one token in place *R*, indicating that the semaphore starts in the red state. The transitions are as follows:

1. From *R* to *G*: This transition fires when the semaphore is red, removing the token from *R* and adding it to *G*.
2. From *G* to *Y*: This transition fires when the semaphore is green, removing the token from *G* and adding it to *Y*.
3. From *Y* to *R*: This transition fires when the semaphore is yellow, removing the token from *Y* and adding it back to *R*.

#figure(image("../figures/petri-example-1.jpg", width: 50%), caption: [ Petri net of a traffic semaphore. ])

==== Question 2
Consider *two semaphores synchronized* to control a street intersection. Initially, one of them is red and the other green. Moreover, *one can move from red to green only when the other moves from yellow to red*. Extend the single semaphore Petri net to model the two semaphores and the defined rule. Provide a short and clear description of your choices.

In @fig:example2 the transitions from yellow to red of one semaphore and from red to green of the other occur at the same time. Places $R_1$, $G_1$, and $Y_1$ represent the first semaphore, while places $R_2$, $G_2$, and $Y_2$ represent the second semaphore.

Transitions $T_1$ and $T_3$ are the ones that determine the movements from $Y_x$ and $R_y$ to $R_x$ and $G_y$, while $T_2$ and $T_4$ regulate the transition from $G$ to $Y$ of an individual semaphore independently from the other.

We can also see that $T_1$ occurs always after $T_4$. Similarly, the transitions causing a movement of tokens from $R_2$ to $G_2$ and from $G_1$ to $Y_1$ are $T_3$ and $T_2$, respectively. Again, $T_3$ occurs always after $T_2$.

#figure(image("../figures/petri-example-2.jpg", width: 50%), caption: [ Synchronized semaphores. ]) <example2>

==== Question 3
Demonstrate that, given an initial marking representing in your Petri net one green semaphore and one red semaphore, *it can never happen that the two semaphores are green at the same time*.

@fig:reachability-graph-example-1 shows the reachability graph of the Petri net in @fig:example2. Given the initial marking, the case ${G_1, G_2}$ never occurs, thus demonstrating that the fulfill the required constraint.

#figure(image("../figures/reachability-graph-example-1.jpg", width: 50%), caption: [
  Reachability graph
]) <reachability-graph-example-1>

==== Question 4
Reflect on the behavior of your Petri net. Which one of the following three sentences is true in your case? Provide a justification for your answer.

+ One semaphore moves from red to green at the same time in which the other moves from green to yellow (*True*);
+ One semaphore moves from red to green after the other moves from green to yellow (*False*);
+ One semaphore moves from red to green before the other moves from green to yellow (*False*).

Considering as initial marking ${R_1, G_2}$, we can notice
that the transition that causes $R_1$ to lose its token and $G_1$ to gain it is $T_1$, while the transition that causes $G_2$ to lose its token in favor of $Y_2$ is $T_4$.

#pagebreak()

== Quantitative impact of architectural decisions
Architectural choices directly influence several software qualities (e.g., *scalability*, *reliability*, *availability*, *usability*).

To cope with this, we need metrics to quantify qualities and specific methodologies to analyze the quantitative impact of architectural choices on these qualities. The tactics are also foundational to address the issues.

First, before discussing how to evaluate the quantitative impact of architectural decisions, we must introduce the availability concept and explain a system life-cycle to introduce some exciting *metrics*.

In general, a *service shall be continuously available* to the user, and if it fails after a bit of downtime, it should be a *rapid service recovery*. So the *availability* of a service depends on:
- The *complexity* of the *infrastructure* architecture.
- *Reliability* of the individual components.
- *Ability to respond* quickly and effectively to faults.
- *Quality of the maintenance* by support organizations and suppliers.
- *Quality* and scope of the *operational management* processes.

=== System Life-Cycle
The System Life-Cycle relates to failures in the following way:

#figure(image("../figures/system-life-cycle.jpg", width: 80%), caption: [ The System Life-Cycle when faults occur. ])
- *Time of occurrence*. Time at which the user becomes aware of the failure.
- *Detection time*. Time at which operators become aware of the failure.
- *Response time*. Time required by operators to diagnose the issue and respond to users.
- *Repair time*. Time required to fix the service/components that caused the failure.
- *Recovery time*. Time required to restore the system (re-configuration, re-initialization, ...).
- *Mean Time to Repair (MTTR)*. Average time between the occurrence of a failure and service recovery, also known as the _downtime_.
- *Mean Time to Failures (MTTF)*. Mean time between the recovery from one failure and the occurrence of the next failure, also known as _uptime_.
- *Mean Time Between Failures (MTBF)*. Mean time between the occurrences of two consecutive failures.

#definition("Availability Metric")[
  The *availability metric* is the probability that a component works correctly at time $t$. As a mathematician term, we can express this definition as the relationship between the Mean Time to Failures (MTTF) and the MTTF plus the Mean Time to Repair (MTTR):
  $
    A = "MTTF" / ("MTTF" + "MTTR")
  $
  Note that if the Mean Time to Repair (MTTR) is small, then the Mean Time Between Failures (MTBF) is approximately equal to the Mean Time to Failures(MTTF): $"MTBF" approx.eq "MTTF"$
]

Availability is typically specified in "*nines notation*". For example, 3-nines availability corresponds to $99.9%$, 5-nines availability corresponds to $99.999%$ availability.

#align(center)[
  #table(
    columns: 2,
    table.header([*Availability*], [*Downtime per year*]),

    [90% (1-nine)], [36.5 days/year],
    [99% (2-nines)], [3.65 days/year],
    [99.9% (3-nines)], [8.76 hours/year],
    [99.99% (4-nines)], [52 minutes/year],
    [99.999% (5-nines)], [5 minutes/year],
  )
]

=== Methodology
The Analysis Methodology depends on the system. The Availability is calculated by *modelling the system* as an interconnection of elements in series and parallel:
- *Elements operating in #underline[series]* mean that if one element fails, the whole combination fails.
- *Elements operating in #underline[parallel]* mean that if a component fails, the other elements take over the operations of the failed element.

==== Availability in series
The combined system is *operational only if every part is available*. Then, the combined Availability is the product of the parts' Availability.
$
  A = Pi_(i=1)^n A_i
$

#example("Example of availability in series")[
  We assume there is a system composed of two components with the following availability and downtime:
  - Component 1 has $99%$ (2-nines) of availability and 3.65 days/year of downtime.
  - Component 2 has $99.999%$ (5-nines) of availability and 5 minutes/year of downtime.
  So the combined availability is $98.999%$ with 3.65 days/year of downtime.
  This result means that a chain is as strong as the weakest link.
]

==== Availability in parallel
The combined system is operational if at least one part is available. Then, the combined Availability is $1 - P$, where $P$ indicates all parts that a re not available.
$
  P = Pi_(i=1)^n (1 - A_i)
$

#example("Example of availability in parallel")[
  We assume there is a system composed by two components with the following Availability and downtime:
  - Component 1 has $99%$ (2-nines) of Availability and 3.65 days/year of downtime.
  - Component 2 has $99%$ (2-nines) of Availability and 3.65 days/year of downtime.
  Despite the previous example, the combined availability is $99.99%$ (4-nines) with 52 minutes/year of downtime.
]

=== Tactics for Availability
As we explained in the past pages, Availability is crucial, but it's also fundamental to use intelligent tactics to improve the quality of the attributes.

#definition("Tactics")[
  The *Tactics* are design decisions that influence the control of one or more quality attributes.
]

Some well-known tactics are:

==== Replication approaches
The *Replication* is very simple to manage in the case of stateless components. The approaches are different:
+ *Hot spare*: One component leads, and another is always ready to take over. In the following example, C1 leads, C2 is always ready to take over. #figure(image("../figures/hot-spare.jpg", width: 50%))
+ *Warm spare*: One component leads and *periodically* updates another component. If the primary component fails, the second component takes time to update itself fully. C1 is leading and periodically updating C2. If C1 fails, some time might be needed to fully update C2. #figure(image("../figures/warm-spare.jpg", width: 50%))
+ *Cold spare*: A second component is dormant, started, and updated only if required. In the following example, C2 is dormant, started, and updated only if required. #figure(image("../figures/cold-spare.jpg", width: 50%))
+ *Triple modular redundancy*: Three components are always active, and the result is the one produced by the majority. This is good when reliability is also important. In the following example, C1, C2, and C3 are all active. The result is the one produced by the majority. #figure(image("../figures/triple-redundancy.jpg", width: 50%))

==== Forward error recovery
*Forward Error Recovery* is a *tactic* in which a recovery mechanism moves the failed component to a degraded state. In a degraded state, a component continues to be available even if it is not fully functional. Here is an example:

#figure(image("../figures/forward-error-recovery.jpg", width: 50%))

==== Circuit breaker
The *Circuit Breaker (CB)* tactic is a client-side resiliency pattern. The CB acts as a proxy for a remote component:
+ A component is called;
+ The CB monitors the call.
But note that there should be possible failures:
- CB receives an error;
- The call takes "too long" (CB kills the call).
If there are too many failures, the circuit breaker inhibits future calls by moving to the open state.

=== Example: Availability of a Kafka Cluster
Consider the following instance of a Kafka cluster. Suppose that the servers on which the 3 Brokers are hosted have the following availability values.
- Server Broker 1: 97%
- Server Broker 2: 94%
- Server Broker 3: 98%

#figure(image("../figures/kafka-cluster-example.jpg", width: 80%), caption: [ Kafka cluster with three Brokers. ])

As illustrated by the schema, _Consumers_, retrieve various messages concerning certain topics. Messages are obtained through the `getMessages` operation, which can retrieve messages from any broker handling a topic and partition. For the purpose of this exercise, assume that the messages have already been published. Assume also that the schema shows all the existing partitions for the depicted topics.

==== Availability 1
What is the total availability of an operation that needs to retrieve 2 messages, one related to `Topic 3 partition 1` and the other to `Topic 2 partition 0`?

This is the series of the availability of `Topic 2 partition 0` (which is not replicated, so the availability of the partition is the availability of the corresponding broker) and `Topic 3 partition 1` (which is replicated, so its availability is the parallel of the corresponding brokers).
$
  A = 0.94 times (1 - (1 - 0.97) times (1 - 0.98)) = 0.939
$

==== Availability 2
What is the total availability of an operation that needs to retrieve 2 messages, one related to `Topic 1 partition 1` and the other to `Topic 4 partition 0`?

This is the series of the availability of `Topic 1 partition 1` (which is not replicated, so the availability of the partition is the availability of the corresponding broker) and `Topic 4 partition 0` (also not replicated). The two partitions happen to be on the same broker:
$
  A = 0.98 times 0.98 = 0.96
$

==== Availability 3
Assuming that each broker can handle only a *single partition* for each topic and that the number of available servers is fixed, define a new configuration of the Kafka Cluster so that the operation of point *Availability 2* has a total availability greater or equal to 99%.

This is possible under the assumption that we can introduce new partitions in each broker while respecting the constraint of not having partitions of the same topic in a broker. This will result in the following availability, which fulfills the required constraint:
$
  A = (1 - (1 - 0.94) * (1 - 0.98)) times (1 - (1 - 0.97) * (1 - 0.98)) = 0.998
$

#pagebreak()

== Static Analysis (Symbolic Execution)
*Static Analysis* analyzes the source code, and each analyzer targets a fixed set of hard-coded (pre-defined, not custom) properties. It is entirely automatic, and the output reports two types of results: *safe (no issues)* and *unsafe (potential problems)*. Also, the analysis is made on *generic (or symbolic) inputs*.

The properties that we have mentioned are safety properties, such as:
- No _overflow_ for integer variables
- No _type errors_
- No _null-pointer dereferencing_
- No _out-of-bound array accesses_
- No _race conditions_
- No _useless assignments_
- No _usage of undefined variables_
- No _execution of specific paths_

Using the static analysis, we can use the symbolic execution.

#definition("Symbolic Execution")[
  The *symbolic execution* is a technique to analyze the program by executing it with *symbolic inputs* instead of concrete values. The symbolic execution engine generates a set of constraints that must be satisfied for the program to reach a specific state.
]

The symbolic execution analyzes actual source code and reachability and path feasibility properties. It is automatic and may fail to explore all possible paths. Sometimes, it is used to support testing. The checked properties by the static analysis can be of different types:
- *Reachability*. Does some program execution reach location `L` (generic line of code) in `S` (source code)? With the reachability property, the symbolic execution tries:
  - To verify that `L` cannot be reached;
  - Or spots the condition under which `L` can be reached.
Static analysis checks the reachability properties and verifies that $L$ cannot be reached, or discovers the condition under which $L$ can be reached.
- *Path Feasibility*. Is the given path $p$ feasible? With the path feasibility property, the symbolic execution tries:
  - To verify that $p$ cannot be executed;
  - Or *spots the condition under which `p` can be executed*.
  The $p$ will be
  $
    p =<0,1, dots, k, dots, n>
  $
Symbolic execution *executes programs on symbolic values*. Each symbolic value has its *symbolic states*, which keep track of the variables' (symbolic) values. The inputs are initialized with symbolic (generic) values.

=== Limitations
- The *path conditions may be too complex for constraint solvers*. Because solvers are very good at checking linear constraints, but it is harder for them to reason about non-linear arithmetic, bit-wise operations, string manipulation, etc.
- It is *impossible* or *difficult to use when the number of paths to be explored is infinite* or *huge*. For example, unbounded loops give rise to infinite sets of paths. Although the set of paths is finite, checking all loops is expensive and impractical.
- Finally, there may be *external code*. Then the sources are not available, such as a precompiled library, or the behavior is unknown to the solver.

=== Example: Loop
```c
int fun(int x, int y)
{
    int z, k;
    if (x * y == 0)
        return -1;
    if (x < 0)
        x = -x;
    if (y < 0)
        y = -y;
    z = x;
    k = y;
    while (x != y)
    {
        if (x > y)
            x = x - y;
        else
            y = y - x;
    }
    if (z % x == 0)
        return z;
    else
        return k;
}
```

==== Question 1
Derive the path condition corresponding to the execution of path 1, 2, 3, 4, 6, 7, 8, 10, 11, 12, 13, 14, 12, 13, 14, 12, 13, 15, 12, 16, 17.

#figure(table(
  columns: 6,
  stroke: 0.7pt,
  align: center,
  table.header([*\#*], [*$x$*], [*$y$*], [*$z$*], [*$k$*], [$bold(pi)$]),

  [1-3], [$X$], [$Y$], [], [], [],
  [4], [$X$], [$Y$], [], [], [$X times Y != 0$],
  [6], [$X$], [$Y$], [], [], [$(X < 0) and (Y != 0)$],
  [7], [$-X$], [$Y$], [], [], [$(X < 0) and (Y != 0)$],
  [8], [$-X$], [$Y$], [], [], [$(X < 0) and (Y > 0)$],
  [10], [$-X$], [$Y$], [$-X$], [], [$(X < 0) and (Y > 0)$],
  [11], [$-X$], [$Y$], [$-X$], [$Y$], [$(X < 0) and (Y > 0)$],
  [12], [$-X$], [$Y$], [$-X$], [$Y$], [$(X < 0) and (Y > 0) and (-X != Y)$],
  [13], [$-X$], [$Y$], [$-X$], [$Y$], [$(X < 0) and (Y > 0) and (-X > Y)$],
  [14], [$-X-Y$], [$Y$], [$-X$], [$Y$], [$(X < 0) and (Y > 0) and (-X > Y)$],
  [12], [$-X-Y$], [$Y$], [$-X$], [$Y$], [$(X < 0) and (Y > 0) and (-X > Y) and (-X-Y != Y)$],
  [13], [$-X-Y$], [$Y$], [$-X$], [$Y$], [$(X < 0) and (Y > 0) and (-X > Y) and (-X-Y > Y)$],
  [14], [$-X-2Y$], [$Y$], [$-X$], [$Y$], [$(X < 0) and (Y > 0) and (-X > Y) and (-X > 2Y)$],
  [12], [$-X-2Y$], [$Y$], [$-X$], [$Y$], [$(X < 0) and (Y > 0) and (-X > Y) and (-X < 3Y)$],
  [15], [$-X-2Y$], [$3Y+X$], [$-X$], [$Y$], [$(X < 0) and (Y > 0) and (-X > Y) and (-X < 3Y)$],
  [12], [$-X-2Y$], [$3Y+X$], [$-X$], [$Y$], [$(X < 0) and (Y > 0) and (-2X=5Y)$],
  [16], [$-X-2Y$], [$3Y+X$], [$-X$], [$Y$], [$(X < 0) and (Y > 0) and (-2X=5Y) and (-X% (-X / 5) =0)$],
  [17], [$-X-2Y$], [$3Y+X$], [$-X$], [$Y$], [$(X < 0) and (Y > 0) and (-2X=5Y)$],
))
The path condition is consistent. Possible test case: $x = -10$ and $y = 4$.

==== Question 2
Derive the path condition corresponding to the execution of path 1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 16, 18.

#figure(table(
  columns: 6,
  stroke: 0.7pt,
  align: center,
  table.header([*\#*], [*$x$*], [*$y$*], [*$z$*], [*$k$*], [$bold(pi)$]),

  [1-3], [$X$], [$Y$], [], [], [],
  [4], [$X$], [$Y$], [], [], [$X times Y != 0$],
  [6], [$X$], [$Y$], [], [], [$(X < 0) and (Y != 0)$],
  [7], [$-X$], [$Y$], [], [], [$(X < 0) and (Y != 0)$],
  [8], [$-X$], [$Y$], [], [], [$(X < 0) and (Y < 0)$],
  [9], [$-X$], [$-Y$], [], [], [$(X < 0) and (Y < 0)$],
  [10], [$-X$], [$-Y$], [$-X$], [], [$(X < 0) and (Y < 0)$],
  [11], [$-X$], [$-Y$], [$-X$], [$-Y$], [$(X < 0) and (Y < 0)$],
  [12], [$-X$], [$-Y$], [$-X$], [$-Y$], [$(X < 0) and (Y < 0) and (-X != -Y)$],
  [16], [$-X$], [$-Y$], [$-X$], [$-Y$], [$(X < 0) and (-X = -Y) and ((-X)%(-X) != 0)$],
  [18], [], [], [], [], [],
))

The path condition is not feasible as it is not possible that $(-X)%(-X) != 0$. Therefore, the path cannot be executed.

=== Example: Tree
```c
def foo(a, b, c):
    r = 0
    x = 0
    y = 0
    if a[b] >= 0:
        y = 7
    else:
        y = 5

    a[y] = c

    if a[b] < 3:
        x = 2
        if a[b] <= 0 or c != 0:
            y = y - 3

    r = a[x + y - 2]
    return r
```

==== Question 1
Consider the function foo and carry out a symbolic execution for all paths (note that, in this case, the number of paths is finite). Given that this code fragment does not contain loops, you may be facilitated in your work if you create a binary tree to represent these paths. The nodes of the tree shall include at least the initial symbolic assignment in lines 0-2 (root), the final assignments (leaves), and all the conditional statements (internal nodes). You can annotate the arcs with the conditions and assignments that are relevant to the corresponding part of the code. For each path (i.e., each leaf of the previous tree structure), determine the symbolic condition that ensures the execution of the corresponding path. Then, identify the unfeasible path(s), if any.

#figure(image("../figures/symbolic-execution-tree.jpg", width: 80%), caption: [
  Symbolic execution tree of the function foo.
])

There are 6 leaves (from left to right) with the following path conditions:
- $A[B] < 0 and A[B] >= 3$. Path: 0, 1, 2, 3, 6, 7, 8, 9, 10, 15, 16, 17 *(unfeasible)*
- $A[B] < 0 and A[B] < 3 and A[B] > 0 and C = 0$. Path: 0, 1, 2, 3, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
- $A[B] < 0 and A[B] < 3 and (A[B] != 0 or C = 0)$. Path: 0, 1, 2, 3, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
- $A[B] >= 0 and A[B] >= 3$. Path: 0, 1, 2, 3, 4, 5, 9, 10, 15, 16, 17
- $A[B] >= 0 and A[B] < 3 and A[B] > 0 and C = 0$. Path: 0, 1, 2, 3, 4, 5, 9, 10, 11, 12, 14, 15, 16, 17
- $A[B] ≥ 0 and A[B] < 3 and (A[B] ≤ 0 or C = 0)$. Path: 0, 1, 2, 3, 4, 5, 9, 10, 11, 12, 13, 14, 15, 16, 17

==== Question 2
Suppose that we wanted to guarantee that the result of the foo function is not zero. According to the previous analysis, try to determine a pre-condition among the possible ones that ensures the satisfaction of this property.

- $|a| = 10$ and $0 < b < 9$ and $a[b] < 0$ and $a[2] != 0$
- $|a| = 10$ and $0 < b < 9$ and $a[b] > 3$ and $a[5] != 0$
- $|a| = 10$ and $0 < b < 9$ and $0 < a[b] < 3$ and $c = 0$ and $a[7] != 0$
- $|a| = 10$ and $0 < b < 9$ and ($a[b] = 0$ or ($0 < a[b] < 3$ and $c != 0$)) and $a[4] != 0$

Considering the tree, the conditions above ensure the execution of feasible paths to the leaves and further constrain the return value $r$.

Note that path 0, 1, 2, 3, 4, 5, 9, 10, 11, 12, 14, 15, 16, 17 (path 5) cannot lead to the desired condition; indeed, it would give the following condition:
$
  (|a| = 10 "and" 0 <= b <= 9 "and" 0 < a[b] < 3 "and" c = 0 "and" a[7] != 0)
$
which cannot hold because $a[7]$ is equal to $c$, which, in turn, should be 0. Therefore, the corresponding path must return 0 to the caller.

#pagebreak()
