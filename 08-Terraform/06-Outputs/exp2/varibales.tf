variable "zones" {
   default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "backend_count" {
  default = 2
}

variable "frontend_count" {
  default = 1
}
