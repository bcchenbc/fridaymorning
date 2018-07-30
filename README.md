# fridaymorning
A learning (An exploratory) DevOps project for doing new release on Friday Morning (!?)



#### Problem Statement

Testing can be expensive and high maintenance to work, to be informative, and reflect the reality. It is fundamental but potentially slow-moving part to any software engineering project. Services that relies on real user feedback or real performance in production will benefit the most from this project. Additional benefit may include cost contamination and time for disaster recovery.



#### Proposed Solution

Streamlined test-in-production may ease the pain of setting up an ideal test environment. By directing a proportion of workload to containers or virtual machine with new feature/commit, this test-in-production setup can have the most direct feedback from real user. Also, with additional configuration, this setup will support tasks that require live migration. The deliverable will be a system build on:

- CI/CD enabled version control system
- Container/virtual machine orchestration software
- Health/performance check and feedback mechanism for rollout/failure-recovery/rollback
- Monitoring tools



#### Use Case

The project use a basic streaming pipeline for demonstration. A Twitter Streaming API subscriber script handles the generation of data. A set of scripts built for Kafka facilitates the transfer of data from the source to analytics and storage sinks.


###### Setup the demostration (howto for use this repo)
TODO

###### Expected result
1. Check thing are up and connected.
2. Take a look on the Grafana Dashboard. The Dashboard will display:
   - Latency: completion time for each tasks for the nodes.
   - Traffic: numbers of tasks completed by each node in a minutes.
   - Errors: numbers of malformed task calls, on each node.
   - Saturation: memory and cpu utilization for each ndoe.
3. Now, try to add a new feature to the pipeline. (Try the script "demo/add-new-feature.sh".
4. A Runner (using Gitlab CI shell runner here) will be triggered to perform a set of jobs based on [.gitlab-ci.yaml].
5. Let's check the dashboard for the changes.


#### Tech Stack

###### Gitlab CI/CD:

- Consolidate vcs and CI/CD service
- Great flexibility with Shell Runner (and etc.)
- CI features are freely available. ([CE vs EE](https://about.gitlab.com/images/feature_page/gitlab-features.pdf))

###### Docker Swarm / Terraform + HAProxy

- Simple and straightforward (as long as microservices)
- Weighted load balancing included

###### Airflow

- Dynamic workflow definition
- Python😀

![tech-stack](./static/tech-stack.png)