# variable "name" {
#   type        = string
#   description = "The name of the security group."
# }

# variable "description" {
#   type        = string
#   description = "The description of the security group."
# }

# variable "ingress_ports" {
#   type        = list(number)
#   description = "List of ports to allow inbound traffic."
# }
# variable "vpc_id" {
#   type        = string
#   description = "The ID of the VPC where the security group will be created."
# }

variable "name" {
  type        = string
  description = "Name of the security group."
}

variable "description" {
  type        = string
  description = "Description of the security group."
}

variable "ingress_ports" {
  type        = list(number)
  description = "List of ports for ingress rules."
  default     = [22, 80, 443]
}
