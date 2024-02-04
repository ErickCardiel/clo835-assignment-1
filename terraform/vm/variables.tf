variable "region" {
  default     = "us-east-1"
  type        = string
  description = "AWS Resources Region"
}


variable "keypair_name" {
  default     = "keypair"
  type        = string
  description = "Kaypair name"
}


variable "default_tags" {
  default = {
    project = "clo835-assignment1"
  }
  type        = map(string)
  description = "Default tags for all resources"
}