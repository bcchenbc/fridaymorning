
# Table of Contents

1.  [FridayMorning](#org1fc97a3)
    1.  [Problem Statement](#orgdd14c4e)
    2.  [Proposed Solution](#org0588200)
    3.  [Use Case](#org72a153c)
    4.  [Get Started](#org7cf7d6b)
        1.  [Setup the demostration (howto for use this repo)](#org097ba99)
        2.  [Expected result](#org87add51)
        3.  [Scenario](#org9f40c5b)
    5.  [Tech Stack](#org0001474)
        1.  [Gitlab CI/CD:](#org11a9caf)
        2.  [Docker Swarm / Terraform + HAproxy](#orga19b184)
        3.  [Airflow](#org1bd502e)

\#+TITLE FridayMorning org-mode -**- mode: org -**-


<a id="org1fc97a3"></a>

# FridayMorning

A learning (An exploratory) DevOps project for doing new release on Friday Morning (!?)


<a id="orgdd14c4e"></a>

## Problem Statement

Testing can be expensive and high maintenance to work, to be informative, and reflect the reality. It is fundamental but potentially slow-moving part to any software engineering project. Services that relies on real user feedback or real performance in production will benefit the most from this project. Additional benefit may include cost contamination and time for disaster recovery.


<a id="org0588200"></a>

## Proposed Solution

Streamlined test-in-production may ease the pain of setting up an ideal test environment. By directing a proportion of workload to containers or virtual machine with new feature/commit, this test-in-production setup can have the most direct feedback from real user. Also, with additional configuration, this setup will support tasks that require live migration. The deliverable will be a system build on:

-   CI/CD enabled version control system
-   Container/virtual machine orchestration software
-   Health/performance check and feedback mechanism for rollout/failure-recovery/rollback
-   Monitoring tools


<a id="org72a153c"></a>

## Use Case

The project use a basic streaming pipeline for demonstration. A Twitter Streaming API subscriber script handles the generation of data. A set of scripts built for Kafka facilitates the transfer of data from the source to analytics and storage sinks.


<a id="org7cf7d6b"></a>

## Get Started


<a id="org097ba99"></a>

### Setup the demostration (howto for use this repo)

TODO


<a id="org87add51"></a>

### Expected result

1.  Check thing are up and connected.
2.  Take a look on the Grafana Dashboard. The Dashboard will display:
    -   Latency: completion time for each tasks for the nodes.
    -   Traffic: numbers of tasks completed by each node in a minutes.
    -   Errors: numbers of malformed task calls, on each node.
    -   Saturation: memory and cpu utilization for each ndoe.
3.  Now, try to add a new feature to the pipeline. (Try the script "demo/add-new-feature.sh".
4.  A Runner (using Gitlab CI shell runner here) will be triggered to perform a set of jobs based on [.gitlab-ci.yaml].
5.  Let's check the dashboard for the changes.
6.  Check Airflow jobs scheduled.


<a id="org9f40c5b"></a>

### Scenario

1.  Commit to \`Test\` branch (up and destroy).
2.  Commit to \`RC\` branch (up and gradual scaling).
3.  Commit to \`Master\` branch (up and rollover).
4.  (Revert to old commit.)
5.  (Add new branch, and test. (does this make sense?))


<a id="org0001474"></a>

## Tech Stack


<a id="org11a9caf"></a>

### Gitlab CI/CD:

-   Consolidate vcs and CI/CD service
-   Great flexibility with Shell Runner (and etc.)
-   CI features are freely available. ([CE vs EE](https://about.gitlab.com/images/feature_page/gitlab-features.pdf))
-   Can setup ["manual" process](https://about.gitlab.com/2016/08/26/ci-deployment-and-environments/).


<a id="orga19b184"></a>

### Docker Swarm / Terraform + HAproxy

-   Simple and straightforward (as long as microservices)
-   Weighted load balancing included


<a id="org1bd502e"></a>

### Airflow

-   Dynamic workflow definition
-   Python😀

\![Tech Stack Overview](./static/tech-stack.png)
