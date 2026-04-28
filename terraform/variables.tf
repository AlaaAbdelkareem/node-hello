variable "docker_username" {
  type      = string
  sensitive = true # This hides the value from console logs
}

variable "docker_password" {
  type      = string
  sensitive = true
}

variable "new_relic_key" {
  type      = string
  sensitive = true
}