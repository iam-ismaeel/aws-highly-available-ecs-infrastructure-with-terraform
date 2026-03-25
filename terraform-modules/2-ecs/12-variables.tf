variable "cluster_name" {
  description = "ECS cluster name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID from VPC module"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs across 2 availability zones"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "Public subnet IDs across 2 availability zones"
  type        = list(string)
}

variable "image" {
  description = "Container image"
  type        = string
}

variable "container_port" {
  description = "Application container port"
  type        = number
  default     = 80
}

variable "cpu" {
  description = "Task CPU units"
  type        = number
  default     = 512
}

variable "memory" {
  description = "Task memory"
  type        = number
  default     = 1024
}

variable "desired_count" {
  description = "Number of ECS tasks"
  type        = number
  default     = 2
}

variable "max_capacity" {
  description = "Maximum autoscaling tasks"
  type        = number
  default     = 4
}

variable "min_capacity" {
  description = "Minimum autoscaling tasks"
  type        = number
  default     = 2
}

variable "assign_public_ip" {
  description = "Assign public IP to ECS task"
  type        = bool
  default     = false
}