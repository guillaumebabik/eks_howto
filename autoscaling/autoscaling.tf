# autoscaling.tf
resource "aws_autoscaling_group" "eks_asg" {
  launch_configuration = aws_launch_configuration.eks_launch_configuration.id
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  vpc_zone_identifier  = aws_subnet.eks_subnets[*].id
}

resource "aws_launch_configuration" "eks_launch_configuration" {
  name          = "eks-launch-configuration"
  image_id      = data.aws_ami.eks_worker_ami.id
  instance_type = "t3.medium"
  iam_instance_profile = aws_iam_instance_profile.eks_node_profile.id
  key_name = "my-key-pair"
}

data "aws_ami" "eks_worker_ami" {
  most_recent = true
  owners      = ["602401143452"]  # Amazon EKS optimized AMI owner ID
  filter {
    name   = "name"
    values = ["amazon-eks-node-*"]
  }
}
