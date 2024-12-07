# Configuring AWS

In this tutorial, we'll see how to generate access and secret keys with AWS. Then we will see how to get the subnet ID for each availability zone (`a`, `b`, `c`...), the security group ID as well as the DNS hosted zone ID.

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../../../translations/fr/tutorials/selfhosted/configuration/aws.md)

## Configuration

### Choosing a region

On the right of the Console Home page, you can find a list of all activated regions in your account. Choose the closest region to where you're working:

You can write the region value in this environment variable:

```shell
AWS_STRATEGY_DEFAULT_REGION="xx-xxxx-x"
```

![aws_1](../../../img/aws_regions5.png)

### Create a user

We first have to create a user from which we generate access and secret keys. Search for IAM:

![aws_1](../../../img/aws_1.png)

Select Users: 

![aws_2](../../../img/aws_users.png)

![aws_2](../../../img/aws_adduser.png)

You will have a three step process to create the user:

1. Write user's name.

2. Set his permissions.

![aws_4](../../../img/aws_4.png)

3. Then create.

![aws_rcreate_user](../../../img/aws_rcreate_user.png)

### Create access and secret keys

Select the created user then:

![aws_access](../../../img/aws_access.png)

We go down in the user page:

![aws_5](../../../img/aws_5.png)

Choose the Command Line Interface option, then write a description (optional). Finally, create the key.

![aws_6](../../../img/aws_6.png)

Then you can get the your access and secret key as well as the default region so that you can write them into those environment variables:

```shell
AWS_STRATEGY_ACCESS_KEY_ID="AKIxxxxxxxxxxxxxxxxx"
AWS_STRATEGY_SECRET_ACCESS_KEY="qvXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
```

![aws_7](../../../img/aws_7.png)

### Get subnet ID

Search for VPC:

![aws_8](../../../img/aws_8_vpc.png)

Seleck the VPC you want to work with:

![aws_sebnet1](../../../img/aws_subnets.png)

Select the wanted VPC. You can find the subnet ID for each availability zone (a, b, c, etc.)

![aws_subnet2](../../../img/aws_vpc_hierarchy.png)

You choose the subnet IDs accordingly to each availability zone. You can write the subnet ID in the cloud environments yaml file: 

```shell
zones:
  - name: "availability_zone"
    subnet: subnet-048XXXXXXXXXXXXXX
```

### Get security group ID

In the left side-bar, choose Security Groups: 

![aws_sg1](../../../img/aws_sg1.png)

You choose the subnet IDs accordingly to each region and availability zone(a, b, c). You can write the security group ID in the cloud environments yaml file: 

```shell
zones:
  - name: "availability_zone"
    subnet: sg-026XXXXXXXXXXXXXX
    sg: sg-0266XXXXXXXXXXXXX
```

![aws_9_sg_list2](../../../img/aws_9_sg_list2.png)

### Get the DNS hosted zone ID

Search for Route53:

![aws_route53_1](../../../img/aws_route53_1.png)

You should buy a Domain so that you can get a Hosted Zone automatically.

![aws_route53_1](../../../img/aws_route53_2.png)

You can write the hosted zone ID in the cloud environments yaml file:

```shell
dns_hosted_zone_id: Z08XXXXXXXXXXXXXXXXB
```

![aws_route53_1](../../../img/aws_route53_3.png)
