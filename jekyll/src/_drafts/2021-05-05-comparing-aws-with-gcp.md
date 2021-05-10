---
layout: post
title: How different are Google Cloud Platform & Amazon Web Services, really?
tags: cloud
---

In the past—should the topic come up—I'd broach the topic of cloud vendors
with some degree of nonchalance; they're all the same right?! Having started a
new job where there are real talks of AWS vs. GCP however I thought now would be
good a time to put my old views to the test.

# How can you compare cloud vendors, really?

To try and keep _some_ amount of objectivity in this write up, I'm conscious
that:
- The services offered by cloud vendors are vast. High-dimensionality increases
  the risk that I could go off on wild tangents and start comparing apples to
  oranges.
- I've used AWS in production over 5 years now. It would be be remiss of me to
  think I'm unbiased towards something I've used for some time...

That said I'll go about the task with a beginners mindset; I'll define a common
scenario to solve and use the experience of _that_ to drive what gets written.

# What are we making?

The scenario is fairly common—we're creating a auto-scaling group in a private
network that is accessible via load balancer:

![scenario][scenario]

I chose this scenario because it entails a vertical slice across numerous
services; for example I assume there's a compute, network and security elements
that will need to be linked up correctly in order to work.

# How are we making it?

In terms of _how_ it gets done, the constraint is to use infrastructure-as-code
(herein IaC) that offered by the cloud vendors (this means using [Cloud
Deployment Manager][clouddeploymentmanager] for GCP and
[CloudFormation][cloudformation] for AWS). The reasoning behind this is:

- I find that learning code provides me with a better picture of what the
  services to be created are and what their properties/relations to each other
  are.
- As some services can be configured with many different properties (e.g. see
  [backendService][backend-service]), IaC helps with understanding what the
  _required_ properties to learn are vs. those which can be ignored for now.
- The documentation surrounding IaC provides good insight into how the cloud
  vendors classify their objects/services. This helps me infer a taxonomy of
  services, which I can therefore use as a map to navigate myself around their
  systems (this is faster than any UI!).

It's probably worth addressing why we're not using higher-level IaC such as
[CDK][cdk] or [Terraform][terraform]. For this exercise Introduces a layer of
abstraction

## DevX

CLI
Google
AWS

## documentation

aws
ties in to dash - easy to search
very detailed

gcp


## features
gcp

ability to run container on asg
load balancer capabilities
declare load balancer type-knowledge of protocol (osi)
mtls

## ease of use

tooling
aws
cloudformation
cli output does not help

gcp
cloud deployment manager
cli output does help!

gcp
faff setting up routing
basic vs advanced ui
api led, interacting with rest endpoints and ui different
whats going on with firewall rule?

differences
similarities

iams

## GCP feels more coherent

[scenario]: {{ "/assets/gcpaws/scenario.png"  | relative_url }}
[backend-service]: https://cloud.google.com/compute/docs/reference/rest/beta/backendServices
[clouddeploymentmanager]: https://cloud.google.com/deployment-manager
[cloudformation]: https://aws.amazon.com/cloudformation/
[cdk]: https://docs.aws.amazon.com/cdk/latest/guide/home.html
[terraform]: https://www.terraform.io/
