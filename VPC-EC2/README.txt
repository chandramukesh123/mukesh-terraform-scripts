This terraform script is to setup vpc with 2 subnets, 1 private and 1 public subnets in each availability zone.
private subnet associated with nat gateway which is having elastic ip address through route table.
public subnet associated with internet gateway to connect internet through route table.
we are spinning up 2 ubuntu ec2 instances in each subnet, with 8gb root volume using existing key file.