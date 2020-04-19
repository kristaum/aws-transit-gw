## AMI Nat/Transparent proxy

Set the following variables and make sure AWS credentials are set

    VPC_ID
    SUBNET_ID
    REGION

This assumes:
  - Packer is installed.
  - VPC with a subnet that can reach the internet.


Inspec was integrated to double check everything was set just fine, which could be used in a pipeline before actually creating the AMI in a production environment.
