
# Table of Contents

1.  [FridayMorning](#org59dd02c)
    1.  [Problem Statement](#org6b6a1dc)
    2.  [Proposed Solution](#org8d97786)
    3.  [This Repo as A Demo](#orgc69754d)
    4.  [Get Started](#org7adbb32)
        1.  [Setup the demostration (howto for use this repo)](#orga695d03)
        2.  [Expected result](#org7d7e73b)
        3.  [Scenario](#orga692129)
    5.  [Tech Stack](#org69584e5)
        1.  [Gitlab CI/CD:](#org5259880)
        2.  [Docker Swarm / Terraform + HAproxy](#orgf4f8f60)
        3.  [Fluentd](#orgc6d2006)
        4.  [Airflow](#org5d411aa)

\#+TITLE FridayMorning org-mode -**- mode: org -**-


<a id="org59dd02c"></a>

# FridayMorning

A learning (An exploratory) DevOps project for doing new release on Friday Morning (!?)


<a id="org6b6a1dc"></a>

## Problem Statement

Testing can be expensive and high maintenance to work, to be informative, and reflect the reality. It is fundamental but potentially slow-moving part to any software engineering project. Services that relies on real user feedback or real performance in production will benefit the most from this project. Additional benefit may include cost contamination and time for disaster recovery.


<a id="org8d97786"></a>

## Proposed Solution

Streamlined test-in-production may ease the pain of setting up an ideal test environment. By directing a proportion of workload to containers or virtual machine with new feature/commit, this test-in-production setup can have the most direct feedback from real user. Also, with additional configuration, this setup will support tasks that require live migration. The deliverable will be a system build on:

-   CI/CD enabled version control system
-   Container/virtual machine orchestration software
-   Health/performance check and feedback mechanism for rollout/failure-recovery/rollback
-   Monitoring tools


<a id="orgc69754d"></a>

## This Repo as A Demo

This project will build a pipeline and a dashboard for web traffic log data.
The intention is to provide a user-friendly interface for observing/comparing/contrasting webserver performances.
The system can be summarized as:

1.  CI tool spins up VM/containers which serves new codes and updates load-balancer settings.
2.  Load-balancer collects and logs various measurements from the services.
3.  A data pipeline collects and parses the log data.
4.  Metrics from the data is then aggregated into databases and populated in the dashboards.
5.  Monitoring/alerting tools will provide feedback to users and trigger rollout/rollback to settings.


<a id="org7adbb32"></a>

## Get Started


<a id="orga695d03"></a>

### Setup the demostration (howto for use this repo)

TODO


<a id="org7d7e73b"></a>

### TODO Expected result

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
7.  Check Log (TODO) aggregator for new logs.


<a id="orga692129"></a>

### Scenario

1.  Commit to \`Test\` branch (up and destroy).
2.  Commit to \`RC\` branch (up and gradual scaling).
3.  Commit to \`Master\` branch (up and rollover).
4.  (Revert to old commit.)
5.  (Add new branch, and test. (does this make sense?))


<a id="org69584e5"></a>

## Tech Stack

\![Tech Stack Overview](./static/tech-stack.png)


<a id="org5259880"></a>

### Gitlab CI/CD:

-   Consolidate VCS and CI/CD service
-   Great flexibility with Shell Runner (and etc.)
-   CI features are freely available. ([CE vs EE](https://about.gitlab.com/images/feature_page/gitlab-features.pdf))
-   Can setup ["manual" process](https://about.gitlab.com/2016/08/26/ci-deployment-and-environments/) (when sign-off, QA, etc. required).


<a id="orgf4f8f60"></a>

### Docker Swarm / Terraform + HAproxy

-   Simple and straightforward (as long as microservices)
-   Weighted load balancing included
-   Kubernetes, "the" contender, has all the features, but containering everything could be expensive.


<a id="orgc6d2006"></a>

### Fluentd

-   Small, simple, and straightforward.
-   Battle tested, yet highly flexible.
-   Open source.


<a id="org5d411aa"></a>

### Airflow

-   Dynamic workflow definition
-   Python😀
