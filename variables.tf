variable "environment_name" {
    description = "Name of the environment"
    type = string
    default = "dev"
}

variable "vpc_id" {
    description = "VPC ID for DEV"
    type = string
    default = "vpc-08a1b8d567baacd6e"
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

