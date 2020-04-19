# AWS Transit Gateway with Nat/Transparent Proxy

This code was inspired using the idea from this [ blog post ](https://aws.amazon.com/blogs/security/how-to-add-dns-filtering-to-your-nat-instance-with-squid/).

Which then led to use the following two options to build this.

## option 1
proxy_ami base AMI
  - bake code
  - integration/functional test

transit and nat/proxy build
  - deployment code
  - integration/functional test

Tests
  - chaos engineering
  - performance

## option 2
docker image pipeline
  - docker code
  - integration/functional test

transit and nat/proxy build
  - deployment code
  - integration/functional test

Tests
  - chaos engineering
  - performance


## Code on this repo

Packer will:
  - Create AMI with proxy packages and dependencies
  - Run [ Inspec ](https://www.inspec.io/) to check resources changed on AMI


Terraform will create:
  - Transit Gateway
  - Egress VPC to reach the internet
      - 3 private subnet (AZ HA)
      - 3 public subnet (AZ HA)
  - Egress VPC attachment to Transit Gateway
      - VPC Association and Propagation
  - 3 Nat/Proxy instance (AZ HA)
  - APP VPC to test transit and proxy
      - 2 private subnets
  - APP VPC attachment to Transit Gateway
      - VPC Association and Propagation
  - 2 EC2 on APP VPC


ToDo:

    - Ansible (configure/changes proxy settings)

    - Create Second option of the solution:

        - AMI with docker and it's dependencies

        - Docker image with proxy configured

        - Code to deploy config changes for proxy

    - CI Pipeline
