resource "aws_iam_role" "task_role" {
  name = "${var.cluster_name}-task-role"
}
