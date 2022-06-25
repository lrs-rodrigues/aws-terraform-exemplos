variable "description" {
  type = string
  default = "Description KMS"
  description = "Description KMS"
}

variable "deletion_window_in_days" {
  type = number
  default = 10
  description = "Deletion Windown In Days"
}

variable "enable_key_rotation" {
  type = bool
  default = true
  description = "Enable Key Rotation"
}

variable "alias" {
  type = string
  default = ""
  description = "Alias KMS"
}

variable "tags" {
  type = map(string)
  default = {}
  description = "Tags"
}