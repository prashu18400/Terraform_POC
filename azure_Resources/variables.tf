variable "rgName" {
  type = string
  nullable = false
}

variable "location" {
  type = string
  default = "eastus2"
}

variable "tags" {
  type = object({
  })
}