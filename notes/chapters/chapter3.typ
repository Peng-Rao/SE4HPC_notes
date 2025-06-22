#import "@local/simple-note:0.0.1": *
= Software Design
== Software Architecture
The Architecture is so *important* because it is the vehicle for communication: internal (different teams) and external (teams and stakeholders). The Architecture manifests the first set of design decisions and is a portable abstraction of a system.

#definition("Software Architecture")[
  The *_Software Architecture (SA)_* of a system is the *set of structures* needed to reason about the system. These structures comprise software *elements*, *relations* among them, and *properties* of both.
]

== Architecture and multiple structures
=== Component-and-connector (C&C) structures
Describe how the system is structured as a *set of elements* that have *runtime behavior* (components) and *interactions* (connectors).
- The *components* are the principal units of computation (for example the clients, servers, services, etc.)
- The *connectors* represent communication (for example request-response mechanisms, pipes, asynchronous messages, etc.)
The purpose of these structures is to enable us to answer questions
such as:
- What are the major executing components and how do they interact at runtime?
- What are the major shared data stores?
- Which parts of the system are replicated?
- How does data progress through the system?
- Which parts of the system can run in parallel?
- How does the system's structure evolve during execution?

=== Module structures
Show how a system is structured as *a set of code or data units* that have to be procured or constructed, *together with their relations*. An example of modules: packages, classes, functions, libraries, layers, database tables, etc.

Modules constitute *implementation units* that can be used as the basis for work splitting (identifying functional areas of responsibility). Typical relations among modules are: uses, is-a (generalization), is-part-of.

=== Allocation structures
Define *how the elements* from component-and-connector or module structures *map* onto things that are not software. For example hardware (possibly virtualized), file systems, teams. Some typical allocation structures include deployment structure, implementation structure, work assignment structure.

== Software design descriptions and UML
=== Component Diagram (C&C structure)
A *Component Diagram* breaks down the actual system under development into *various high levels of functionality*. Each component is responsible for one clear aim within the entire system and only interacts with other essential elements on a need-to-know basis.

#figure(
  image("../figures/component-diagram.jpg", width: 80%),
  caption: "Component Diagram",
)

Component-Based Diagrams in UML comprise several key elements, each serving a distinct role in illustrating the system's architecture. Here are the main components and their roles:

==== Component
Represent modular parts of the system that encapsulate functionalities. Components can be *software classes, collections of classes, or subsystems*.
- *Symbol*: *Rectangles* with the component stereotype («component»).
- *Function*: Define and encapsulate functionality, ensuring *modularity and reusability*.

#figure(image("../figures/components.jpg", width: 50%))

==== Interfaces
Specify a set of operations that a component offers or requires, serving as a contract between the component and its environment.
- *Symbol*: *Circles* (lollipops) for provided interfaces and half-circles (sockets) for required interfaces.
- *Function*: Define how components communicate with each other, ensuring that components can be developed and maintained independently.

#figure(image("../figures/interfaces.jpg", width: 50%))

==== Relationships
Depict the connections and dependencies between components and interfaces.
- *Symbol*: Lines and arrows.
  - *Dependency (dashed arrow)*: Indicates that one component relies on another.
  - *Association (solid line)*: Shows a more permanent relationship between components.
  - *Assembly connector*: Connects a required interface of one component to a provided interface of another.
- *Function*: Illustrate how components interact and depend on each other, helping to visualize the overall architecture of the system.

#figure(image("../figures/relationships.jpg", width: 50%))


==== Ports
Role: Represent specific interaction points on the boundary of a component where interfaces are provided or required.
- *Symbol*: Small squares on the component boundary.
- *Function*: Allow for more precise specification of interaction points, facilitating detailed design and implementation.

#figure(image("../figures/ports.jpg", width: 50%))

==== Artifacts
Represent physical files or data that are deployed on nodes.
- *Symbol*: Rectangles with the artifact stereotype («artifact»).
- *Function*: Show how software artifacts, like executables or data files, relate to the components.

#figure(image("../figures/artifacts.jpg", width: 50%))

==== Nodes
Represent physical or virtual execution environments where components are deployed.
- *Symbol*: 3D boxes.
- *Function*: Provide context for deployment, showing where components reside and execute within the system's infrastructure.

#figure(image("../figures/nodes.jpg", width: 50%))

==== Steps to Create Component-Based Diagrams
From understanding the system requirements to creating the final design, there are multiple processes involved in creating a component-based diagram. These steps will assist you in creating the ideal component-based diagram:
+ *Identify the System Scope and Requirements*
+ *Identify and Define Components*
+ *Identify Provided and Required Interfaces*
+ *Identify Relationships and Dependencies*
+ *Identify Artifacts*
+ *Identify Nodes*
+ *Draw the Diagram*
+ *Review and Refine the Diagram*

=== Sequence Diagram (C&C structure)
A *Sequence Diagram* is a key component of Unified Modeling Language (UML) used to visualize the interaction between objects in a sequential order. It focuses on *how objects communicate with each other over time*, making it an essential tool for modeling dynamic behavior in a system. Sequence diagrams illustrate object interactions, message flows, and the sequence of operations, making them valuable for understanding use cases, designing system architecture, and documenting complex processes.

==== Actors
An actor in a UML diagram represents a type of role where it interacts with the system and its objects. It is important to note here that an actor is always outside the scope of the system we aim to model using the UML diagram.

#figure(image("../figures/actors.jpg", width: 50%))

We represent an actor in a UML diagram using a stick person notation. We can have multiple actors in a sequence diagram.

#example("Actors")[
  Here the user in seat reservation system is shown as an actor where it exists outside the system and is not a part of the system.

  #figure(image("../figures/actors-example.jpg", width: 50%))
]

==== Lifelines
A *lifeline* is a named element which depicts an individual participant in a sequence diagram. So basically each instance in a sequence diagram is represented by a lifeline. Lifeline elements are located at the top in a sequence diagram.

#figure(image("../figures/lifelines.jpg", width: 50%))

We display a lifeline in a rectangle called head with its name and type. The head is located on top of a vertical dashed line (referred to as the stem) as shown above.
- If we want to model an unnamed instance, we follow the same pattern except now the portion of lifeline's name is left blank.
- *Difference between a lifeline and an actor*: A lifeline always portrays an object internal to the system whereas actors are used to depict objects external to the system.

#example("Lifelines")[
  The following is an example of a sequence diagram:
  #figure(image("../figures/lifelines-example.jpg", width: 50%))
]

==== Messages
Communication between objects is depicted using messages. The messages appear in a sequential order on the lifeline.
- We represent messages using arrows.
- Lifelines and messages form the core of a sequence diagram.

#figure(image("../figures/messages.jpg", width: 50%))

Messages can be broadly classified into the following categories:

===== Synchronous Messages
A *synchronous message* waits for a reply before the interaction can move forward. The sender waits until the receiver has completed the processing of the message. The caller continues only when it knows that the receiver has processed the previous message i.e. it receives a reply message.
- A large number of calls in *object oriented programming* are synchronous.
- We use a *solid arrow* head to represent a synchronous message.

#figure(image("../figures/synchronous-messages.jpg", width: 50%))

===== Asynchronous Messages
An *asynchronous message* does not wait for a reply from the receiver. The interaction moves forward irrespective of the receiver processing the previous message or not. We use a lined arrow head to represent an asynchronous message.

#figure(image("../figures/asynchronous-messages.jpg", width: 50%))

===== Create Messages
We use a *Create message* to instantiate a new object in the sequence diagram. There are situations when a particular message call requires the creation of an object. It is represented with a dotted arrow and create word labelled on it to specify that it is the create Message symbol.

#figure(image("../figures/create-messages.jpg", width: 50%))

===== Delete Messages
We use a *Delete Message* to delete an object. When an object is deallocated memory or is destroyed within the system we use the Delete Message symbol. It destroys the occurrence of the object in the system.It is represented by an arrow terminating with a `x`.

#figure(image("../figures/delete-messages.jpg", width: 50%))

===== Self Message
Certain scenarios might arise where the object needs to send a message to itself. Such messages are called *Self Messages* and are represented with a *U shaped arrow*.

#figure(image("../figures/self-messages.jpg", width: 50%))

#example("self-messages")[
  Consider a scenario where the device wants to access its webcam. Such a scenario is represented using a self message.

  #figure(image("../figures/self-messages-example.jpg", width: 50%))
]

===== Reply Messages
*Reply messages* are used to show the message being sent from the receiver to the sender. We represent a return/reply message using an open arrow head with a dotted line. The interaction moves forward only when a reply message is sent by the receiver.

#figure(image("../figures/reply-messages.jpg", width: 50%))

#example("reply-messages")[
  Consider the scenario where the device requests a photo from the user. Here the message which shows the photo being sent is a reply message.

  #figure(image("../figures/reply-messages-example.jpg", width: 50%))
]

===== Found Messages
A Found message is used to represent a scenario where an unknown source sends the message. It is represented using an *arrow directed towards a lifeline* from an end point.

#example("Found message")[
  Consider the scenario of a hardware failure.

  #figure(image("../figures/found-messages.jpg", width: 50%))

  It can be due to multiple reasons and we are not certain as to what caused the hardware failure.

  #figure(image("../figures/found-messages-example.jpg", width: 50%))
]

===== Lost Messages
A Lost message is used to represent a scenario where the recipient is not known to the system. It is represented using an arrow directed towards an end point from a lifeline.

#example("Lost message")[
  Consider a scenario where a warning is generated.

  #figure(image("../figures/lost-messages.jpg", width: 50%))

  The warning might be generated for the user or other software/object that the lifeline is interacting with. Since the destination is not known before hand, we use the Lost Message symbol.

  #figure(image("../figures/lost-messages-example.jpg", width: 50%))
]

===== Guard Messages
To model conditions we use *guards* in UML. They are used when we need to restrict the flow of messages on the pretext of a condition being met. Guards play an important role in letting software developers know the constraints attached to a system or a particular process.

#example("Guard message")[
  In order to be able to withdraw cash, having a balance greater than zero is a condition that must be met as shown below.

  #figure(image("../figures/guard-messages.jpg", width: 50%))
]


==== How to create Sequence Diagrams
Creating a sequence diagram involves several steps, and it's typically done during the design phase of software development to illustrate how *different components* or *objects interact* over time. Here's a step-by-step guide on how to create sequence diagrams:

+ *Identify the Scenario*: Understand the specific scenario or use case that you want to represent in the sequence diagram. This could be a specific interaction between objects or the flow of messages in a particular process.
+ *List the Participants*: Identify the participants (objects or actors) involved in the scenario. Participants can be users, systems, or external entities.
+ *Define Lifelines*: Draw a vertical dashed line for each participant, representing the lifeline of each object over time. The lifeline represents the existence of an object during the interaction.
+ *Arrange Lifelines*: Position the lifelines horizontally in the order of their involvement in the interaction. This helps in visualizing the flow of messages between participants.
+ *Add Activation Bars*: For each message, draw an activation bar on the lifeline of the sending participant. The activation bar represents the duration of time during which the participant is actively processing the message.
+ *Draw Messages*: Use arrows to represent messages between participants. Messages flow horizontally between lifelines, indicating the communication between objects. Different types of messages include synchronous (solid arrow), asynchronous (dashed arrow), and self-messages.
+ *Include Return Messages*: If a participant sends a response message, draw a dashed arrow returning to the original sender to represent the return message.
+ *Indicate Timing and Order*: Use numbers to indicate the order of messages in the sequence. You can also use vertical dashed lines to represent occurrences of events or the passage of time.
+ *Include Conditions and Loops*: Use combined fragments to represent conditions (like if statements) and loops in the interaction. This adds complexity to the sequence diagram and helps in detailing the control flow.
+ *Consider Parallel Execution*: If there are parallel activities happening, represent them by drawing parallel vertical dashed lines and placing the messages accordingly.
+ *Review and Refine*: Review the sequence diagram for clarity and correctness. Ensure that it accurately represents the intended interaction. Refine as needed.
+ *Add Annotations and Comments*: Include any additional information, annotations, or comments that provide context or clarification for elements in the diagram.
+ *Document Assumptions and Constraints*: If there are any assumptions or constraints related to the interaction, document them alongside the diagram.

=== Class Diagram (Module structure)
A *Class Diagram* is a *type of static structure* diagram that describes the structure of a system by showing the system's classes, their attributes, operations (or methods), and the relationships among objects.

#figure(
  image("../figures/class-diagram.jpg", width: 80%),
  caption: "Class Diagram",
)

=== Package Diagram (Module structure)
A *Package Diagram*, a kind of structural diagram, shows the *arrangement and organization of model elements in middle to large scale project*. Package diagram can show both structure and dependencies between sub-systems or modules, showing different views of a system, for example, as multi-layered (aka multi-tiered) application --- multi-layered application model.

#figure(
  image("../figures/package-diagram.jpg", width: 60%),
  caption: "Package Diagram",
)

=== Deployment Diagram (allocation structure)
A *Deployment Diagram* is a diagram that shows the configuration of runtime processing nodes and the components that live on them. Deployment diagrams is a kind of structure diagram used in modeling the physical aspects of an object-oriented system. They are often be used to model the static deployment view of a system (topology of the hardware).

#figure(
  image("../figures/deployment-diagram.jpg", width: 80%),
  caption: "Deployment Diagram",
)

== Design Principal
=== Divide and Conquer
Divide and Conquer is a *problem-solving strategy* that involves breaking down a complex problem into smaller, more manageable parts, solving each part individually, and then combining the solutions to solve the original problem.

=== Keep the level of abstraction as high as possible
Ensure that your designs allow you to hide or defer consideration of details, thus reducing complexity. A good abstraction is said to provide information hiding. Abstractions allow you to understand the essence of a subsystem without having to know unnecessary details.

=== Increase cohesion where possible
In general, a file, module, class or whatever should contain the same logical methods. For example, in the following class we have two functions with two different purposes (error!).

```java
Class Utility {
  ComputeAverageScore ( Student s [])
  ReduceImage ( Image i )
}
```

=== Reduce coupling where possible
Coupling is the degree of interdependence between software modules; a measure of how closely connected two routines or modules are; the strength of the relationships between modules. There are different types of couplings:
- *Content Coupling* is said to occur when one module uses the code of another module, for instance a branch. This violates information hiding (2nd design principle).
- *Communication coupling* is said to occur when one module sends too many messages to another module. The creation of a message can be optimized and the number of messages sent between these two modules can be reduced.
- *Control coupling* is one module controlling the flow of another, by passing it information on what to do. For example, passing a what-to-do flag or the following code:

```java
class b {
    func(flag f) {
        if (f == flag1) do this
        else if (f == flag2) do that
        else...
    }
}
```

=== Design for reusability
Design the various aspects of your system so that they can be used again in other contexts. To do this, you need to follow these rules:
- Generalize your design as much as possible;
- Simplify your design as much as possible;
- Follow the preceding all other design principles;
- Design your system to be *extensible*.

=== Reuse existing designs and code
Design with reuse is *complementary* to design for reusability. Take advantage of the investment you or others have made in reusable components. Note: cloning should not be seen as a form of reuse.

=== Design for flexibility
Actively anticipate changes that a design may have to undergo in the future, and prepare for them. To do this, you need to follow these rules:

=== Anticipate obsolescence
Plan for changes in the technology or environment so the software will continue to run or can be easily changed. So do not rush using early releases of technology. If possible:
- Avoid using software libraries that are specific to particular environments;
- Avoid using undocumented features or little-used features of software libraries;
- Avoid using software or special hardware from companies that are less likely to provide long-term support;
- Use standard languages and technologies that are supported by multiple vendors.

=== Design for portability
Have the software run on as many platforms as possible. Avoid, if possible, the use of facilities that are specific to one particular environment (e.g. a library only available in Microsoft Windows).

=== Design for testability
Design the system so that it can be tested easily. To do this, you need to follow these rules:
- Ensure that all the functionality of the code can be driven by an external program, bypassing a graphical user interface;
- Create proper code to exercise the other methods/functions;
- Use unit test automation frameworks.

=== Design defensively
Be careful when you trust how others will try to use a component you are designing. Handle all cases where other code might attempt to use your component inappropriately. Check that all of the inputs to your component are valid: the preconditions. Unfortunately, over-zealous defensive design can result in unnecessarily repetitive checking.

#pagebreak()
