variable "docker_username" {
  type      = string
  sensitive = true # This hides the value from console logs
}

variable "docker_password" {
  type      = string
  sensitive = true
}