# monitoring.tf
resource "aws_cloudwatch_log_group" "eks_log_group" {
  name              = "/aws/eks/cluster"
  retention_in_days = 7
}

resource "aws_security_group_rule" "allow_internal_traffic" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/16"]
  security_group_id = aws_security_group.eks_sg.id
}
