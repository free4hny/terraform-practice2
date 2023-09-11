

variable "db_name" {}
variable "db_user" {}
variable "db_password" {}

variable "environment name" {
    description = "Name of the environment"
}

variable "vpc_id" {
    description = "VPC ID for DEV"
    type = string
    default = ""
}

variable "vpn_name" {
    description = "Name of the VPC"
    type = string
    default = ""
}

variable "vpc_aurora_subnet_id" {
    description = "vpc subnet ids"
    type = string
    default = ""
}

variable "aurora_username" {
    description = "RDS Aurora_username"
    type = string
    default = "postgres"
}

variable "aurora_password" {
    description = "RDS Aurora password"
    type = string
    default = "password"
}

