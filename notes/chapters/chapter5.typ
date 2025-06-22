#import "@local/simple-note:0.0.1": *
= Architectural Style
An architectural style determines the vocabulary of components and connectors that can be used in instances of that style, together with a set of constraints on how they can be combined.

== Client-Server
A *Client-Server Architecture* is a *network-based computing structure* where responsibilities and operations get *distributed between clients and servers*. Client-Server Architecture is widely used for network applications such as email, web, online banking, e-commerce, etc.

#tip("When to use it")[
  The three most common cases are:
  - When *multiple users* need to access a *single resource* (e.g. database).
  - When there is a *preexisting software* and we must access remotely (e.g. email server).
  - When it is convenient to organize the system around a shared *piece of functionality used by multiple components* (e.g. authentication or authorization server).
]

With this architecture, it's necessary to design and *document proper interfaces* for our server. It is also necessary to ensure that the server can handle *multiple simultaneous requests*.

=== Interface Design
An interface is a *boundary* across which components interact. Proper definition of interfaces is an architectural concern (affects maintainability, usability, testability, performance, integrability).

There are two important guiding principles for interface design: *information hiding and low coupling*. An interface should *encapsulate* a component implementation so that it can be changed without affecting other components. There are several aspects to interface design that need to be considered:
- *Contract principle*: any resource (operation, data) added to an interface implies a commitment to maintaining it.
- *Least surprise principle*: interfaces should behave consistently with expectations.
- *Small interfaces principle*: interfaces should limit the exposed resources to the minimum.

There are also some important elements to define: *interaction style* (e.g. sockets, RPC, REST); representation and *structure of exchanged data* (affecting expressiveness, interoperability, performance and transparency); *error handling*.

=== Error handling, multiple interfaces and interface evolution
Sometimes there may be some problems, for example: an operation is called with invalid parameters and consequently the call doesn't return anything. This simple example can provoke some scenarios: the component cannot handle the request in its current state; or hardware/software errors prevent successful execution; or there is a misconfiguration issue (e.g. the server is not correctly connected to the database).

A *server* can offer *multiple interfaces* at the same time. This enables separation of concerns, different levels of access rights and support ot *interface evolution*.

*Interface evolution* occurs for many reasons (e.g. to support new requirements). Several strategies are needed to support continuity:
- *Deprecation*: declare well in advance that an interface version will be retired by a certain date;
- *Versioning*: maintain multiple active versions of the interface;
- *Extension*: a new version extends the previous one.

=== Handling multiple requests
The server must be able to receive and process requests from multiple clients. There are two main approaches to this: _forking and worker pooling_.

==== Forking
The forking approach is the same as that used by the Apache Web Server: one process per request or per client.

#figure(
  image("../figures/forking-diagrams.jpg", width: 60%),
  caption: "Forking diagrams",
)

Forking Advantages:
- Architectural *simplicity*.
- *Isolation* and *protection* given by the one-connection-per-process model. Note: slow processes do not affect other incoming connections.
- *Simple to program*.

Forking Issues:
- Growth of the WWW over the last 20 years (number of users and weight of web pages).
- The number of *active processes* at time $t$ is *difficult to predict* and may *saturate resources*.
- *Expensive* fork-kill operations for each *incoming connection*.

==== Worker pooling
It is an alternative approach adopted by NGINX Web Server. It is designed for high concurrency but has to deal with scalability issues.

#figure(
  image("../figures/worker-pooling-diagrams.jpg", width: 60%),
  caption: "Worker pooling diagrams",
)

Despite the well-known problem of this architecture (scalability), NGINX addresses the previous problems by introducing a new *architectural tactic*. A tactic is a design decision that affects the control of one or more quality attributes.

Worker Pooling Advantages (quality attribute trade-offs)
- *Number of workers* is *fixed*, so they do not saturate available resources.
- *Each worker* has a *queue*.
- When *queues* are *full* the dispatcher drops the incoming requests to keep high performance (optimize scalability and performance by sacrificing availability).
- Dispatcher balances the workload among available workers according to specific policies.


== Three-Tier Architecture
*Three-tier architecture* is a well-established software application architecture that organizes applications into three logical and physical computing tiers:
- The *presentation tier*, or user interface;
- The *application tier*, where data is processed;
- The *data tier*, where application data is stored and managed.

=== Benefits
The chief benefit of three-tier architecture is its logical and physical separation of functionality. Each tier can run on a separate operating system and server platform - for example, web server, application server, database server -that best fits its functional requirements. And each tier runs on at least one dedicated server hardware or virtual server, so the services of each tier can be customized and optimized without impacting the other tiers. Other benefits include:
- *Faster development*: Because each tier can be developed simultaneously by different teams, an organization can bring the application to market faster. And programmers can use the latest and best languages and tools for each tier.
- *Improved scalability*: Any tier can be scaled independently of the others as needed.
- *Improved reliability*: An outage in one tier is less likely to impact the availability or performance of the other tiers.
- *Improved security*: Because the presentation tier and data tier can't communicate directly, a well-designed application tier can function as an internal firewall, preventing SQL injections and other malicious exploits.

== Microservice architectural style
The microservice architectural style is an approach to developing a single application as a suite of *small services*, each running in its own process and communicating *lightweight mechanisms*, often an HTTP resource API.

There are two main benefits:
- *Technology heterogeneity.* *Each service uses its own technology stack*. The technology stack can be selected to fit the task best (e.g. data analysis vs video streaming). The teams can experiment with new technologies within a single microservice (e.g. we can deploy two versions and do A/B testing). Also, no unnecessary dependencies or libraries for each service.
- *Scaling. Each microservice can be scaled independently*. Also, identified bottlenecks can be addressed directly. Parts of the system that do not represent bottlenecks can remain simple and unscaled.

== Event-Driven Architecture
An *Event-Driven Architecture* uses *events to trigger and communicate between decoupled services* and is common in modern applications built with microservices. An event is a change in state, or an update, like an item being placed in a shopping cart on an e-commerce website. Events can either carry the state (the item purchased, its price, and a delivery address) or events can be identifiers (a notification that an order was shipped).

Often it's called *publish-subscribe* (publish is the event generation, and subscribe is the declaration of the interest).

=== Benefits
- *Very common in modern development practices* (e.g. continuous integration and deployment, such as GitHub Actions).
- *Easy addition/deletion of components* (publishers and subscribers are decoupled; the event dispatcher handles this dynamic set).

=== Problems
- *Potential scalability problems* (the event dispatcher may become a bottleneck under high workload).
- *Ordering of events* (not guaranteed, not straightforward).

Other characteristics of this architecture:
- The messages and the events are *asynchronous*.
- Computation is *reactive* (driven by receipt of message).
- *Destination* of messages determined by receiver, not sender (location/identity abstraction).
- *Loose coupling* (senders and receivers added without reconfiguration).
- *Flexible* communication means (one-to-many, many-to-one, many-to-many).

Some examples of relevant technologies are: `Apache Kafka` and `RabbitMQ`.

#pagebreak()

=== Apache Kafka Architecture
Kafka is a framework for the event-driven paradigm:
- Includes primitives to create *event produces* and *consumers* and a runtime infrastructure to handle *event transfer* from producers to consumers.
- *Stores events* durably and reliably.
- Allow *consumers* to process events as they occur or retrospectively.
These services are offered in a *distributed, highly scalable, elastic, fault-tolerant, and secure manner*.

#figure(
  image("../figures/Kafka-architecture.jpg", width: 70%),
  caption: [ Kafka architecture (the ZooKeeper is a "health manager") ],
)

Some important features:
- Each *broker* handles a set of *topics* and *topic partitions*, parts including sets of messages on the topic.
- The partitions are independent from each other and can be *replicated* on multiple brokers for fault tolerance.
- There is one *leading broker* per partition. The other brokers containing the same partition are followers.
- The *producers* know the available leading brokers and send messages to them.
- Messages in the same topic are organized *in batches* at the producers'side and then sent to the broker when the batch size overcomes a certain threshold.
- Consumers adopt a *pull approach*. They receive in a single batch all messages belonging to a certain partition starting from a specified offset.
- Messages remain available at the brokers' side *for a specified period* and can be *read multiple times* in this period.
- The leader keeps track of the *in-synch followers*.
- *ZooKeeper is used to monitor the correct operation of the cluster.* All brokers send heartbeats to ZooKeeper. ZooKeeper will replace a failed broker by electing a new leader for all partitions that the failed broker was leading. It can also start/restart brokers.

==== Producer
+ Brokers commit messages by storing them in the corresponding partition;
+ Leader adds the message to followers (replicas) if available.

#figure(
  image("../figures/sequence-diagram-kafka-producer.jpg", width: 70%),
  caption: [ Sequence diagram of a producer sending a message to a Kafka broker ],
)

A possible *issue*: in case of failure, the producer may not get the response (message number 7 in figure). In this case, the producer has to resend the message and kafka brokers can identify and eliminate duplicates.

Synchronization with replicas can be transactional and it's possible to choose between the following options:
- *Exactly-once* semantics is possible but long waiting time. So *replicas are not allowed*, but the problem is that Kafka spent a long time trying to guarantee uniqueness.
- *At-least-once* can be chosen by excluding duplicates' management.
- *At-most-once* can be chosen by publishing messages asynchronously.

==== Consumer
Each consumer can rely on a persistent log to keep track of the offset so that it is not lost in case of failure.

*Issue case*: if the consumer fails after having elaborated messages and before storing the new offset in the log, the same messages will be retrieved again (*at-least-once semantics*). Note that the delivery semantics can be changed if the new offset is store before the elaboration and we can choose *at-most-once semantics* because, if failing after storing the offset, the effect of the received messages does not materialize. Finally, transactional management of the log also allows *exactly-once semantics*.

#figure(
  image("../figures/sequence-diagram-kafka-consumer.jpg", width: 70%),
  caption: [ Sequence diagram of a consumer reading messages from a Kafka broker ],
)

=== Kafka architectural tactics
There are some tactics used to improve some features of Kafka. In the following section we can see scalability and fault tolerance.

==== Improve Scalability
By *creating multiple partitions and multiple brokers*, we can create the ability to distribute producers/consumers to different partitions handled by different brokers. We can also *scale the operations* because Kafka supports the *creation of clusters of brokers*. Consider that each cluster contains up to a hundred brokers capable of handling trillions of messages per day.

==== Improve Fault Tolerance
By *creating partitions*, we use the *persistence* of the partitions. Replication also reduces the risk of data loss. Finally, cluster management takes care of restarting brokers and setting leaders as needed.

== Data-Intensive applications
Before we introduce the architectural styles for data-intensive applications, we explain the difference between *batch and stream processing*.

*Batch processing* is a method of running software programs called jobs in batches automatically. While users are required to submit the jobs, no other interaction by the user is required to process the batch.

*Stream processing* (also known as event stream processing, data stream processing, or distributed stream processing) is a programming paradigm which views streams, or sequences of events in time, as the central input and output objects of computation.

#table(
  columns: 2,
  [*Batch*], [*Stream*],
  [Has access to all data.], [Computes a function of one data element, or a smallish window of recent data.],
  [Might compute something big and complex.], [Computes something relatively sim-ple.],
  [Is generally more concerned with throughput than latency of individual components of the computation.],
  [Needs to complete each computation in near-real-time --- probably seconds at most.],

  [Has latency measured in minutes or more.], [Computations are generally independent.],
  [],
  [Asynchronous --- source of data doesn't interact with the stream processing directly, like by waiting for an answer.],
)

=== Batch approach: MapReduce
*MapReduce* is a *programming architecture* and an associated implementation for processing and generating big data sets with a parallel, distributed algorithm on a cluster.

A MapReduce is composed of a *map procedure*, which performs filtering and sorting (such as sorting students by first name into queues, one queue for each name), and a *reduce method*, which performs a summary operation (such as counting the number of students in each queue, yielding name frequencies). The "MapReduce System" (also called "infrastructure" or "framework") orchestrates the processing by marshalling the distributed servers, running the various tasks in parallel, managing all communications and data transfers between the various parts of the system, and providing for redundancy and fault tolerance.

#example("an example of a batch approach using MapReduce")[
  #figure(image("../figures/mapreduce-example.jpg", width: 70%))

  The workflow is the following:
  + Read a set of input files and break it into records;
  + Call the *map* function. It extracts a key and a value from each record (the assigned value is application-dependent);
  + Sort all the key-value pairs by key;
  + Call the reduce function. It iterates over the ordered sets of key-value pairs and combines the values (the combination logic is application-dependent)
]

#figure(
  image("../figures/mapreduce-architecture.jpg", width: 70%),
  caption: [ MapReduce architecture ],
)

==== Advantages
- Works well on *commodity hardware*: *Commodity hardware* in computing is computers or components that are readily available, inexpensive and easily interchangeable with other *commodity hardware*. Almost all PCs use *commodity hardware*.

==== Disadvantages
- Implementing a complex processing job is not simple (high level programming model have been built on top of it);
- Reducers have to wait until the preceding Mappers have concluded their job;
- Materialization of intermediate states can be overkilling;
- Sometimes it is not necessary to sort the results of mappers;
- New batch computation approaches supported by frameworks as Spark, Tez, Flink, etc.

=== Stream approach: Apache Storm
*Apache Storm* is a *distributed stream processing computation framework* written predominantly in the Clojure programming language. Originally created by Nathan Marz and team at BackType, the project was open sourced after being acquired by Twitter. It uses custom created “spouts” and “bolts” to define information sources and manipulations to allow batch, distributed pro-cessing of streaming data.

Some features:
- Support stream processing.
- More than 1 million messages per second per node.
- Can scale up to thousands of nodes per cluster.
- Expects and manages failures (fully fault tolerant).
- Provides guaranteed message delivery with exactly once semantics (reliable).

A Storm application is designed as a "topology" in the shape of a* directed acyclic graph (DAG)* with *spouts* (source of streams) and *bolts* (receives messages) acting as the graph vertices. *Edges on the graph are named streams* and direct data from one node to another. Together, the topology acts as a data transformation pipeline. At a superficial level the general topology structure is similar to a MapReduce job, with the main difference being that data is processed in real time as opposed to in individual batches. Additionally, Storm topologies run indefinitely until killed, while a MapReduce job DAG must eventually end.

#table(
  columns: 2,
  [*Stream Grouping*], [*Description*],
  [*Shuffle*], [Sends messages to bolts in random, round robin sequence. Use for atomic operations, such as math.],
  [*Fields*],
  [Sends messages to a bolt based on one or more fields in the tuple. Used to segment an incoming stream and to count tuples of a specified type with a specified value.],

  [*All*],
  [Sends a single copy of each message to all instances of a receiving bolt. Use to send a signal, such as clear cache or refresh state, to all bolts.],

  [*Custom*],
  [Customized processing sequence. Use to get maximum flexibility of topology processing based on factors such as data types, load, and seasonality.],

  [*Direct*], [Source decides which bolt receives a message.],
  [*Global*],
  [Sends messages generated by all instances of a source to a single target instance. Use for global counting operations.],
)

#example("example of topology with different groupings")[
  #figure(image("../figures/example-topology.jpg", width: 70%))
]

=== Combining batch and stream: Lambda Architecture
*Lambda architecture* is a *data-processing architecture* designed to handle massive quantities of data by taking advantage of both batch and stream-processing methods.

This approach to architecture attempts to balance latency, throughput, and fault-tolerance by using batch processing to provide comprehensive and accurate views of batch data, while simultaneously using real-time stream processing to provide views of online data. The two view outputs may be joined before presentation.

The rise of lambda architecture is correlated with the growth of big data, real-time analytics, and the drive to *mitigate the latencies of map-reduce*.

#figure(
  image("../figures/lambda-architecture.jpg", width: 80%),
  caption: [ Lambda architecture ],
)

Exist also *Kappa architecture*. Kappa architecture is a software architecture used for processing streaming data with a single technology stack. It is a simplification of Lambda architecture, where the data is processed in batches. Kappa architecture ingests data into a messaging system like Apache Kafka, and performs both real-time and batch processing, especially for analytics, on the same stream. It allows for recomputation on the data by streaming it through the pipeline again.

#figure(
  image("../figures/kappa-architecture.jpg", width: 80%),
  caption: [ Kappa architecture ],
)

#pagebreak()
