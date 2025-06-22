#import "@local/simple-note:0.0.1": *
= Software Configuration Management
*Software Configuration Management* is a systematic process for managing changes to software products throughout their lifecycle. It ensures consistency, traceability, and control over software development, testing, and deployment by tracking modifications, maintaining version histories, and coordinating team collaboration.

The basic approach to using a *decentralized CM* is to have a repository (project) on the server side.
- When we want to work on the project, we clone the repository on the local PC. This workflow is used because we can work offline and on the local project without making critical changes to the repository server side.
- When we want to work on the project, we *clone* the repository on the local PC. This workflow is used because we can work offline and on the local project without making critical changes to the repository server side.
- The local changes can be saved using the *commit* command and when we are ready to publish our changes, we use the *push* command to update the repository on the server side.
- After a push, anyone who has a local copy should make a *pull* command to update the local project.

== Workflows
In Configuration Management (CM), it's important to define a workflow. A workflow then defines how an organization uses CM for a specific project.

The main principles are:
- Keep the master repository as clean as possible.
- The distinction between local and central repositories is not sufficient in the case of multiple contributors.
- On the central repository we can create a master repository and as many branches as we want.
- A new commit only becomes part of the master if the whole team agrees.

In detail, the GitFlow is:
+ If we want to develop a new feature or idea, *create a new branch*. A branch can be thought of as a new, independent sub-repository, where we can experiment without affecting what is in the master. #figure(image("../figures/gitflow-1.jpg", width: 70%))
+ New versions of software can be produced in the branch. #figure(image("../figures/gitflow-2.jpg", width: 70%))
+ When the work is done, we can *make a pull request*. Then the sub-teams ask the whole team to review the changes and decide whether or not to accept them. The sub-team has already merged any local changes into the server side of the branch. #figure(image("../figures/gitflow-3.jpg", width: 70%))
+ A discussion starts, and new versions can be created in the branch during the discussion. #figure(image("../figures/gitflow-4.jpg", width: 70%))
+ Finally, the code is deployed and tested. #figure(image("../figures/gitflow-5.jpg", width: 70%))
+ And the branch is *merged into the master*. #figure(image("../figures/gitflow-6.jpg", width: 70%))

== Continuous Integration and Continuous Delivery
*Continuous Integration (CI)* is *the practice of integrating changes into the main codebase as often as possible.* It relies on automation to ensure that proper checks are performed during integration. Typically, commits or pull requests trigger compilation or build, unit and integration testing, code quality checking, and merging into the main repository.

However, *Continuous Delivery (CD)* is different from continuous deployment. The former is the automatic preparation and tracking of a release into production. Instead, continuous deployment automatically deploys into the operational environment.

This theory can be put into practice using *GitHub Actions*. A *workflow* is a configurable automated process that runs one or more jobs. An *event* triggers the execution of workflows, and a job is a set of steps in a workflow. A step can be an action (reusable in different contexts) or a shell script. The *runner* is a Virtual Machine in which a job is executed.

To create the workflow, we'll need to create a directory called .github and a folder called `workflows` within it.
- Example of CI workflow using cmake: #link("https://github.com/actions/starter-workflows/blob/main/ci/cmake-single-platform.yml")[cmake-single-platform.yml]
- Example of CI workflow using Maven: #link("https://github.com/actions/starter-workflows/blob/main/ci/maven.yml")[maven.yml]

== Containers and Schedulers
In general, software should run correctly on multiple environments, such as a developer's laptop. Unfortunately, there are some problems, such as different versions of libraries and middleware.

An optimal solution is containers. A *Container* consists of an entire runtime environment: an application plus all its dependencies, libraries and other binaries and configuration files needed to run it, *bundled into one package*.

A similar concept is the *Virtual Machine*. A Virtual Machine, commonly shortened to just VM, is no different than any other physical computer like a laptop, smart phone, or server. It has a CPU, memory, disks to store your files, and can connect to the internet if needed. While the parts that make up your computer (called hardware) are physical and tangible, VMs are often thought of as virtual computers or software-defined computers within physical servers, existing only as code.

The differences between containers and virtual machines are as follows:
- *Containers*
  - Rely on the underlying operating system.
  - A container image is in the order of MBs.
  - Are available almost instantly.
- *VMs*
  - Each has its own operating system.
  - A VM image is in the order of GBs.
  - Require several minutes to bootstrap.

The most common container frameworks are Docker, which is widely used in classical software development, Singularity, which is used in HPC software, and OCI (Open Container Initiative).

The terminology used when talking about containers is as follows:
- *Image*. This is a read-only *template that contains instructions for creating a container* (such as Docker). An image can be based on another image, with some customization.
- *Container*. An *executable instance of an image*. Containers can be created, started, stopped, moved or deleted. They can be connected to one or more networks and have storage attached to them.
- *Dockerfile* is an example of one of the frameworks and contains the instructions for creating and running a new image.

=== Singularity
*Singularity* is designed to *run complex applications on HPC clusters* in a simple, portable and reproducible way.

This framework has the following features:
- Verifiable reproducibility and security, using cryptographic signatures, an immutable container image format, and in-memory decryption.
- Integration over isolation by default. Easily make use of GPUs, high speed networks, parallel filesystems on a cluster or server by default.
- Mobility of compute. The single file SIF container format is easy to transport and share.
- A simple, effective security model. You are the same user inside a container as outside, and cannot gain additional privilege on the host system by default.

=== Slurm
Along with Singularity, Slurm is also commonly used. *Simple Linux Utility for Resource Management* (SLURM) is a free and open source *job scheduler* (see definition below) for Linux and Unix-like kernels, used by many of the world's supercomputers and computer clusters.

*A Resource Manager* coordinates the actions of all other components in the batch system by maintaining a database of all resources, submitted requests and running jobs.

In addition, a *Job Scheduler* takes the node and job information from the resource manager and *creates a list*, sorted by job priority, *that tells the resource manager when and where to run each job*.

Slurm was originally designed as a simple resource manager, capable only of allocating whole nodes to jobs. It has evolved into a comprehensive work-load scheduler capable of managing the most demanding workflows on many of the world's largest computers. Its design goals are to be open source, portable, scalable, fault tolerant, secure and sys admin friendly.
