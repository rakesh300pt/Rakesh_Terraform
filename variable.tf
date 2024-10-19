
variable "varstring" {
  type = string
}

variable "varnumber" {
  type = number
}

variable "varboolean" {
  type = bool
}

variable "varlist" {
  type = list(string)
}

variable "varmap" {
  type = map(string)
}

variable "vartuple" {
  type = tuple([string, number])
}
variable "varobject" {
  type = object({
    name = string
    age  = number
  })
}



