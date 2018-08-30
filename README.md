
# Table of Contents

1.  [Problem Statement](#orgfc70845)
2.  [Proposed Solution](#org217a4b1)
    1.  [Canary Testing](#orge21e1cf)
    2.  [The Demo](#org928752a)
3.  [Tech Stack Overview](#org06e2b91)
    1.  [Overview](#org159ea3c)
    2.  [Gitlab CI/CD:](#org9d8f059)
    3.  [Docker Swarm + HAProxy](#org4308154)
    4.  [Fluentd](#orga5875bd)
    5.  [InfluxDB + Grafana + Prometheus](#orgaf9e635)
4.  [Configuration Notes](#org27d2677)
    1.  [Gitlab CI](#org31a5454)
        1.  [Gitlab CI Server](#orgf7763c4)
        2.  [Gitlab CI Runner](#org4df2920)
        3.  [Fluentd](#org9efa970)


FridayMorning
A learning (An exploratory) DevOps project for performing test in production on Friday Morning


<a id="orgfc70845"></a>

# Problem Statement

Testing is a fundamental but potentially speed-limiting part in software development process.
Conducting tests that reflect the real world can be expensive.
The cost of infrastructure and engineer efforts to maintain an environment for testing may be significant.
Also, users can behave unexpectedly. 
Test in production can mitigate part of these problems.


<a id="org217a4b1"></a>

# Proposed Solution

Streamlined test in production may ease the pain of setting up an ideal test environment.
By directing a proportion of workload to containers or virtual machine with new feature/commit,
this test-in-production setup will enable the collection of direct feedback from real user.
Also, with additional configuration, this setup will support tasks that require live migration.
The deliverable will be a system build on:

-   CI/CD enabled version control system (GitLab CI)
-   Container/virtual machine orchestration software (Docker Swarm)
-   Health/performance check and feedback mechanism to rollout/rollback (InfluxDB)
-   Monitoring tools (Grafana)


<a id="orge21e1cf"></a>

## Canary Testing

Canary testing is one of the methodologies of test in production.
The basic idea is that the newly released codes will serve only a small proportion of services.
Defects that is not caught during the prerelease testing may be detected in this canarying stage, 
which allows timely rollback to prevent further damage even system outage.


<a id="org928752a"></a>

## The Demo

This project aims to demonstrate a canary testing use case for a web service.
This is done by setting up a pipeline for continuous deployment and a dashboard for web serivices performance monitoring.

The basic workflow can be described as:

1.  CI tool deploy new codes to containers that serve a load-balancer.
2.  Load-balancer collects and logs various measurements from the services.
3.  A log collection system aggregates and parses all log data.
4.  Metrics from the data is then aggregated into databases and populated on the dashboards.
5.  Monitoring/alerting tools will provide feedback to users and trigger rollout/rollback to settings.


<a id="org06e2b91"></a>

# Tech Stack Overview


<a id="org159ea3c"></a>

## Overview

\![Tech Stack Overview](./static/tech-stack.png)


<a id="org9d8f059"></a>

## Gitlab CI/CD:

-   Consolidated VCS and CI/CD service
-   Great flexibility with Shell Runner (and etc.)
-   CI features are freely available. ([CE vs EE](https://about.gitlab.com/images/feature_page/gitlab-features.pdf))
-   Can setup ["manual" process](https://about.gitlab.com/2016/08/26/ci-deployment-and-environments/) (when sign-off, QA, etc. required)


<a id="org4308154"></a>

## Docker Swarm + HAProxy

-   Docker Swarm is simple and straightforward (short lead time)
-   HAProxy has out-of-box weighted load balancing support
-   HAProxy can be integrated into Docker networks
-   Kubernetes, "the" contender, has all the features, but containering everything could be expensive


<a id="orga5875bd"></a>

## Fluentd

-   Small, simple, straightforward, yet battle-tested
-   Natively supports log delivery for multiple programming languages, ideal for non-web applications


<a id="orgaf9e635"></a>

## InfluxDB + Grafana + Prometheus

-   SQL-like query supports, large user base, easy-to-use interfaces
-   Efficient persistent timeseries storage
-   Chronograf has more friendly query builder, but percentile is not yet available


<a id="org27d2677"></a>

# Configuration Notes


<a id="org31a5454"></a>

## Gitlab CI


<a id="orgf7763c4"></a>

### Gitlab CI Server

-   Gitlab Server is based on official AMI.
-   Baremetal, GCP, etc. installation instructions/scripts are available [here](https://about.gitlab.com/installation/).
-   A c4.large (or larger) is recommended in the instruction, but not required in this light-load demonstrative system.


<a id="org4df2920"></a>

### Gitlab CI Runner

-   Gitlab Runner handles the building/testing/deployment tasks.
-   Have Shell Runners installed on the system where applications are deployed can be the most straightforward way for setting up the pipelines.
-   Runner installation instructions [here](https://docs.gitlab.com/runner/install/). In short, install the package, get token from repo's [Settings > CI/CD > Runners], `gitlab-runner register` in service-providing servers.


<a id="org9efa970"></a>

### Fluentd

-   Fluentd is configured with multi-workers.
-   Fluentd is setup to listen to HAProxy through UDP. Capturing from log file (tail) is doable, and was easier to debug at the getting-hands-dirty stage, but disk usage and rsyslog setup are both unnecessary.
-   To have Fluentd works with other components, the plugins have to be installed first.

