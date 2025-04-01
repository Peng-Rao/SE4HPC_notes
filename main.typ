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
