variable "vpc_cidr" {
    type = string
}

variable "subnet_cidrs" {
    type = list(string)
}

variable "availability_zones" {
    type = list(string) 
}

variable "region" {
    type = string
}

variable "rt_cidr" {
    type = string
}