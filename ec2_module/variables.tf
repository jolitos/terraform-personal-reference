variable "aws_region" {
  description = "AWS region where the resources will be created"

  type = object({
    dev  = string
    prod = string
  })

  default = {
    dev  = "us-east-2"
    prod = "us-east-2"
  }
}

variable "instance" {
  type = object({
    dev = object({
      type   = string
      number = number
    })
    prod = object({
      type   = string
      number = number
    })
  })

  default = {
    dev = {
      type   = "t2.micro"
      number = 1
    }
    prod = {
      type   = "t2.micro"
      number = 2
    }
  }
  description = "Instance configuration"
}
