#import "@local/simple-note:0.0.1": *

#show: simple-note.with(
  title: [
    Software Engineering for High Performance Computing
  ],
  date: datetime(year: 2025, month: 2, day: 17),
  authors: (
    (
      name: "Rao",
      github: "https://github.com/Raopend",
      homepage: "https://github.com/Raopend",
    ),
  ),
  affiliations: (
    (
      id: "1",
      name: "Politecnico di Milano",
    ),
  ),
  // cover-image: "./figures/polimi_logo.png",
  background-color: "#FAF9DE",
)
#set math.mat(delim: "[")
#set math.vec(delim: "[")
#set math.equation(supplement: [Eq.])

= Introduction
== Why software engineering is important
Software is everywhere and our society is now totally dependent on *software-intensive systems*. Obviously, our society could not function without software. For example, transportation systems, energy systems and manufacturing systems.

== Definition
There are some fields of computer science dealing with software systems:
- Large and complex
- Built by teams
- It exists in may versions
- Last many years
- Undergo changes

== Required skills
We should know that software engineering is not just about programming, as a *programmer*, we should have these following skills:
- develops a complete program
- works on known specifications
- works individually
For a *software engineer*, we should have these following skills:
- identifies requirements and develops specifications
- designs a component to be combined with other components, developed, maintained,used by others; component can become part of several systems
- works in a team
We can summarize the skills of a software engineer as follows:
- Technical
- Project management
- Cognitive
- Enterprise organization
- Interaction with different cultures
- Domain knowledge
The quality of human resources is of primary importance.
The main goal of a software engineer is to develop software products. Not
only is the product significant, but the process is also fundamental. The quality of the process affects the quality of the product.

== The software product and the process
The product developed by a software engineer differs from traditional product types. It isn't easy to describe and evaluate because it is intangible. Some *aspects affecting the product quality*:
- Devlopment technology
- Process quality
- People quality
- Cost, time and schedule

=== ISO/IEC 25010
An ISO (International Organization for Standardization) called *ISO/IEC 25010* comprises the *nine quality characteristics*:
#figure(
  image("figures/iso_25010_en.png", width: 80%),
  caption: "ISO/IEC 25010",
)

=== Productivity
A process quality to consider is *productivity* (the process of *producing a product*). The definition can be: "ability to produce a good amount of product". To measure it, we can use *delivered items by unit of effort*, where:
- *Delivered items*: lines of code (and variations) function points
- *Unit of effort*: person month (note: persons and months cannot be interchanged).

=== Timeliness
Another process quality to consider is timeliness. The definition is: "the ability to respond to change requests in a timely fashion".

As you can see by the graph, the "user needs" is a linear function. A software engineer should be able to respond to the client's requests as soon as possible. As the graph shows, a request made on time $t_0$ is completed on time $t_2$; but another request can be made at that time, and so on. The actual system capabilities can't grow up always because sometimes there are “brainstorming times” to increase product quality.

#figure(image("figures/user-needs.jpg", width: 80%))

== Software Lifecycle
Initially, no reference model is inside a software lifecycle: code and fix(or refactoring). However, a traditional waterfall model is chosen to react to the many problems that a software engineer faces.

=== Waterafall model
The *waterfall model* is a breakdown of development activities into linear sequential phases, meaning they are passed down onto each other, where each phase depends on the deliverables of the previous one and corresponds to a specialization of tasks. Its organization is the following:
*High phases*:
- *Feasibility Study*: this is a cost-benefit analysis. The main goal is determining whether the project should be started, possible alternatives, and needed resources. The outcome is a feasibility study document. This paper provides
  - A preliminary problem description
  - Some scenarios describing possible solutions
  - Costs and schedules for the different alternatives
- *Requirement analysis and specification*: this is an analysis of the domain in which the application takes place. The main goal is to identify requirements and derive specifications for the software. Note these specifics require a interaction with the user and an understanding of the properties of the domain. The *outcome* is a particular document called *Requirements Analysis and Specification Document* (RASD).
- *Design*: this is the *definition of the software architecture*. There, the definition of components (modules) and the relations/in-teractions among these components. The *main goal* is to support the concurrent development of separate responsibilities. The outcome is a summary of this info in a *design document*.
*Low phases*:
- *Coding and Unit Test*: each module is *implemented using the chosen programming language*. Furthermore, each module is tested in isolation by the module developer. Also, the programs should include their documentation.
- *Integration and System Test*: the modules are *integrated into* (sub)systems. The integrated (sub)systems are *tested*. Follows an incremental implementation scheme. A complete system test is needed to verify the overall properties. Note that sometimes we have alpha test and beta test.
- *Deployment*: is the process used to conceive, specify, design, program, document, test, and bug fix to create and maintain applica-tions, frameworks, or other software components.
- *Maintenance*: the maintenance is divided into *two types*:
  - Corrective deals with the repair of faults or defects found.
  - Evolution is also divided into three types:
    - *Adaptive*: the software is adapted to new environments or requirements.
    - *Perfective*: the software is improved to meet new requirements.
    - *Preventive*: the software is improved to prevent future problems.

#pagebreak()

= HPC software, relevant qualities and SE methods
High Performance Computing the practice of aggregating computing power in a way that delivers much high performance than one could get out of a typical desktop computer or workstation to solve large problems in science, engineering, or business.

Thousands of processors working in parallel to analyze billions of pieces of data in real time, performing calculations thousands of times faster than a normal computer.

The use of parallel processing for running advanced, large-scale application programs efficiently, reliably and very quickly on supercomputer systems.

The platform technology concerned with programming for performance, where performance takes the broad meaning of:
- Speed (reducing time to solution)
- Energy efficiency (doing more with less power)
- Upscaling (handling larger problems such as simulating a wing and then a full plane, or a cell and then an organ)
- High throughput (the ability to handle large volumes of data in near real-time, as required in the financial services industry, telecoms or satellite imagery).

== HPC software
There are two categories of HPC software:
- *Compute-intensive applications*: These are complex calculations that require a large number of computing resources. They also often require parallel computing.
- *Data-intensive applications*. They focus on processing, storing and retrieving large amounts of data. Typically built as distributed systems to ensure reliability and scalability.

== Relevant Qualities
For the two categories explained, there are some important characteristics:

For Compute-intensive applications:
- *Correctness*
- *Performance*
- *Portability*
- *Maintainability*
- *Evolvability*

For Data-intensive applications:
- *Reliability*
- *Scalability*
- *Maintainability*

In the software, there can be some errors, but a software engineer should be able to recognize the type of failure, faults or defects. The fault can be of two types:
- *Hardware Faults*
- *Software Faults*

== Systems Engineering Methods
There are several systems engineering methodologies required in High Performance Computing.
- Modelling the software structure and checking its properties.
- Performance analysis and improvement.
- Documentation, standards, support to maintainability.
- Support to scalability.
- Attention to operability and automation.

#pagebreak()

= Requirement Engineering
== Definition
*Requirement engineering* is the process of defining, documenting and maintaining requirements in the engineering design process. It is a critical part of software development and systems engineering. The questions derived from requirement engineering are:
- Identify stakeholders
- Identify their needs
- Produce documentation
- Analyze, communicate, implement requirements

== Interplat between the world and the machine
For an ambulance dispatching system:
- For every urgent call reporting an incident, an ambulance should arrive at the incident location within 14 mins
- For every urgent call, details about the incident are correctly encoded
- When an ambulance is dispatched, it will reach the incident location in the shortest possible time
- Accurate ambulance locations are known by GPS
- Ambulance crews correctly notify ambulance availability through a mobile data terminal

The *machine* is the part of the system to be developed (typically a software-to-be and a hardware). The *world* (or environment) is the part of the real world that is affected by the machine.

Requirements engineering is *concerned with the phenomena that occur in the world*. In the previous example, RE is concerned with the following phenomena:
- Occurrence of incidents
- Reports of incidents by public calls
- Encoding of call details into dispatching software
- Assignment of an ambulance
- Arrival of an ambulance at the scene of an incident

But RE is also interested in the phenomena that occur inside the machine. In
the previous example
- The creation of a new object of the class `Incident`
- The updating of a database entry
Using the example on the previous page, we can show the phenomena we are interested in the world or in the machine set.

#figure(
  image("figures/World-machine-set.jpg", width: 80%),
  caption: "World and machine set",
)

More generally, we can divide the machine and the world sets as:
- The world which have goals and domain properties
- The machine which have computers and programs
- The requirements which is the bridge between the world and the machine.

#figure(image("figures/bridge.jpg", width: 80%))

We explain more detailed these value inside the two sets:
- *Goals* are prescriptive assertions formulated in terms of world phenomena (not necessarily shared)
- *Domain properties* are descriptive assertions assumed to hold in the world
- *Requirements* are prescriptive assertions formulated in terms of shared phenomena

Using the example, we can identify the goal, the domain assumptions and the requirement as follows:
- *Goal*: For every urgent call reporting an incident, an ambulance should arrive at the incident scene within 14 minutes.
- *Domain assumptions*
  - For every urgent call, details about the incident are correctly encoded.
  - When an ambulance is mobilized, it will reach the incident location in the shortest possible time.
  - Accurate ambulances' location are known by GPS.
  - Ambulance crews correctly signal ambulance availability through mobile data terminals on board of ambulances.
- *Requirement*: When a call reporting a new incident is encoded, the Automated Dispatching Software should mobilize the nearest available ambu-lance according to information available from the ambulances' GPS and mobile data terminals.

#definition("Completeness of Requirements")[
  We say that $R$ is *complete* if and only if:
  - *R* ensures satisfaction of *G* in the context of domain assumptions *D*
  $
    R "and" D | = G
  $
  - *G* captures all the stakeholders' needs.
  - *D* represents *valid properties/assumptions about the world*.
]

== Formulating and classifying requirements
The requirements can be of three types:
- *Functional requirements*: describe the interactions between the system and its environment (independent from implementation). In other words, are the main (functional) goals the software has to realize.
- *Non-functional requirements (NFRs)*: further characterization of user-visible aspects of the system not directly related to functions.
- *Constraints requirements*: imposed by the customer or the environment in which the system operates.

NFRs have some characteristics:
- Constraints on *how functionality must be provided to the end user*
- The application domain determines their *relevance* and their *prioritization*
- Have a *strong influence on the structure of the system to be built*. For example, a system may require 24/7 availability. As a result, it is likely to be designed as a replicated system (with redundant components).

== Eliciting requirements
The *Requirements Elicitation* is the practice of researching and discovering the requirements of a system from users, customers, and other stakeholders. The goal of *requirements elicitation* is to ensure that the software development process is based on a clear and comprehensive under-standing of the custome's needs and requirements. To do that, exist a simple and effective tool called *_scenarios_*.

#definition("Scenario")[
  A scenario is a concrete, focused, informal description of a single feature of the system to be.
]

== Use cases
Scenarios provide a nice summary of what the requirements analysis team can derive from observation, interviews, analysis of documentation. By generalizing the scenarios, we can get *Use Cases*.

To specify a use case, it's very important to follow the following scheme.

#definition("Use Case Schema")[
  - *Name of Use Case*
  - *Actors*: Description of Actors involved in the use case
  - *Entry condition*: When this use case starts the following condition is true
  - *Flow of Events*: Free form, informal natural language
  - *Exit condition*: When this use case ends the following condition is true
  - *Exceptions*: Describe what happens if things go wrong
  - *Special Requirements*: Nonfunctional Requirements, Constraints.
]

The following suggestions are useful in defining an appropriate use cases:
- Use cases named with *verbs* that indicate what the user is trying to accomplish
- Actors named with *nouns*
- Use cases steps in *active voice*
- The causal relationship between steps should be clear
- A use case per user transaction
- Separate description of exceptions
- Keep use cases small (no more than two/three pages)
- The steps accomplished by actors and those accomplished by the system should be clearly distinguished (this helps us in identifying the boundaries of the system)

#example("Bad Use case")[
  Example of a bad use case referring to the ambulance dispatching:
  - *Use case name*: Accident
  - *Actors*: Field Officer
  - *Flow of Events*:
    + The Field Officer reports the accident
    + An ambulance is dispatched
    + The dispatcher is notified when the ambulance arrives on the site.

  The errors are as follows:
  - In the use case name field, *the word is a noun*. It's better to use a verb that indicates what the user is trying to achieve.
  - The Dispatcher actor is not declared in the Participating Actors field, but is mentioned in the Flow of Events field.
]
Now we present an example of a _well composed_ use case.

#example("Good Use case")[
  There are two *actors* involved:
  - *Field Officer*: the person who reports the accident
  - *Dispatcher*: the person who dispatches the ambulance
  The *Entry Condition* is always true because an emergency can be reported at any time. The *sequence of events* is as follows:
  - The *FieldOfficer* activates the Report Emergency function of her terminal
  - Friend (the system to be developed) responds by presenting a form to the officer
  - The FieldOfficer fills the form, by selecting the emergency level, type, location, and brief description of the situation
  - At which point, the Dispatcher is notified
  - The Dispatcher reviews the submitted information and allocates resources by invoking the AllocateResources use case. The Dispatcher selects a response and acknowledges the emergency report

  The *Exit Condition* is the following: the FieldOfficer has received the acknowledgment and the selected response.

  There are two *exceptions*:
  - The FieldOfficer is notified immediately if the connection between her terminal and the control room is lost
  - The Dispatcher is notified immediately if the connection between any logged in FieldOfficer and the control room is lost

  And the *Special Requirements* are:
  - The FieldOfficer's report is acknowledged within 30 seconds
  - The selected response arrives no later than 30 seconds after it is sent by the Dispatcher
]

== UML Use Case Diagrams
A Use Case Diagram is a type of *Unified Modeling Language (UML)* diagram that represents the interaction between actors (users or external systems) and a system under consideration to accomplish specific goals. It provides a high-level view of the system's functionality by illustrating the various ways users can interact with it.

#definition("The shapes of a Use Case Diagram")[
  - *Actors*:
  #figure(image("figures/Actor.jpg", width: 50%))
  - *Use Cases*:
  #figure(image("figures/UseCase.jpg", width: 50%))
  - *System Boundary*: The system boundary is a visual representation of the scope or limits of the system you are modeling. It defines what is inside the system and what is outside. The boundary helps to establish a clear distinction between the elements that are part of the system and those that are external to it. The system boundary is typically represented by a rectangular box that surrounds all the use cases of the system.
  #figure(image("figures/system-boundary.jpg", width: 50%))
]

=== Association Relationship
In a Use Case Diagram, *relationships* play a crucial role in depicting the interactions between actors and use cases. These relationships provide a comprehensive view of the system's functionality and its various scenarios. Take _Online Banking System_ as an example:
- *Actor*: Customer
- *Use Case*: Transfer Funds
- *Association*: A line connecting the "Customer" actor to the "Transfer Funds" use case, indicating the customer's involvement in the funds transfer process.

#figure(image("figures/asscociation.jpg", width: 50%))

=== Include Relationship
The *_Include Relationship_* indicates that a use case includes the functionality of another use case. It is denoted by a dashed arrow pointing from the including use case to the included use case. This relationship promotes modular and reusable design.
- *Use Cases*: Compose Post, Add Image
- *Include Relationship*: The "Compose Post" use case includes the functionality of "Add Image." Therefore, composing a post includes the action of adding an image.

#figure(image("figures/include.jpg", width: 50%))

=== Extend Relationship
The *_Extend Relationship_* illustrates that a use case can be extended by another use case under specific conditions. It is represented by a dashed arrow with the keyword "extend." This relationship is useful for handling optional or exceptional behavior.

#figure(image("figures/extend.jpg", width: 50%))

=== Generalization Relationship
The *_Generalization Relationship_* establishes an "is-a" connection between two use cases, indicating that one use case is a specialized version of another. It is represented by an arrow pointing from the specialized use case to the general use case.

#figure(image("figures/generalization.jpg", width: 50%))

Below are the main steps to draw use case diagram in UML:
+ *Identify Actors*: Determine who or what interacts with the system. These are your actors. They can be users, other systems, or external entities.
+ *Identify Use Cases*: Identify the main functionalities or actions the system must perform. These are your use cases. Each use case should represent a specific piece of functionality.
+ *Connect Actors and Use Cases*: Draw lines (associations) between actors and the use cases they are involved in. This represents the interactions between actors and the system.
+ *Add System Boundary*: Draw a box around the actors and use cases to represent the system boundary. This defines the scope of your system.
+ *Define Relationships*: If certain use cases are related or if one use case is an extension of another, you can indicate these relationships with appropriate notations.
+ *Review and Refine*: Step back and review your diagram. Ensure that it accurately represents the interactions and relationships in your system. Refine as needed.
+ *Validate*: Share your use case diagram with stakeholders and gather feedback. Ensure that it aligns with their understanding of the system's functionality.

#example("Online Shopping System")[
  Let's understand how to draw a Use Case diagram with the help of an Online Shopping System: \
  *Actors*:
  - Customer
  - Admin
  *Use Case*:
  - Browse Products
  - Add to Cart
  - Checkout
  - Manage Inventory (Admin)
  *Relations*:
  - The Customer can browse products, add to the cart, and complete the checkout.
  - The Admin can manage the inventory.

  #figure(
    image("figures/use-cases-example.jpg", width: 80%),
    caption: "Use Case Diagram for Online Shopping System",
  )
]

#pagebreak()

= Software Design
== Software Architecture
