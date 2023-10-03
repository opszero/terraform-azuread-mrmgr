variable "github" {
  type        = bool
  default     = true
  description = "Conditionally create github."
}

variable "repos" {
  default = {}
}

variable "sp_name" {
  type        = string
  default     = null
  description = "Service principle name "
}