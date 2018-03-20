Create a vpc through wizard, having one public subnet and one private subnet. :-

Go to VPC. Select create vpc. Give tag name and IPv4 CIDR block for vpc. Select tenancy = default. Click on create VPC.

Go t subnets. Click on create subnet. Give tag name of subnet. Select vpc. Give AZ. Give IPv4 CIDR block for subnet.

Go to route table. Click on create Route table. Give name tag and select vpc for route table.

Now, Associate route table with subnet. Like private RT with private subnet and public RT with public subnet.

1 subnet can have one RT association. But 1 RT can associates with many subnets.

Now, Create a IG. Go to IG. Select create IG. Give name of IG. Attach new IG with your VPC.

Now, Again go to RT select public RT. Click on routes. Edit routs for public subnet. Add destination IP 0.0.0.0/0 and in target

select IG which we created.

Now go to NAT gateway. Click on create NAT gateway. Give subnet for NAT gateway. We give public subnet always for NAT Gateway.

Now, Again go to RT select private RT. Click on routes. Edit routs for private subnet. Add destination IP 0.0.0.0/0 and in target

select NAT Gateway which we created.



Create two instances within the vpc that you created in task 1, windows instance in public subnet and linux instance in private subnet. check if linux is pingable from windows and vice versa. :-



Select EC2 service.

Click on launch instance. Select AMI. Select instance type. Give no. of instance you want to create. Select VPC in network section. Give

subnet in subnet section. Now, Add storage. Add tag name of instance. configure security group. Review and launch.



Delete all the instances and now make those two instances that you created in previous task using aws-cli. :-

First of all create a new user on AWS.

Give access to user.

Run below mention commands.



pip2.7 install awscli

aws configure. Now, Give access key and secrate key  of your account.

aws ec2 run-instances --image-id ami-1853ac65 --count 1 --instance-type t2.micro  --key-name kavit  --security-group-ids sg-36b0cc40 --subnet-id subnet-ce013693
