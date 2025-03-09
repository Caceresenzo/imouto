variable "account_id" {
  type = string
}

variable "zone_id" {
  type = string
}

variable "google_idp_id" {
  type = string
}

variable "tunnel_id" {
  type = string
}

variable "type" {
  type    = string
  default = "self_hosted"
}

variable "instance_name" {
  type = string
}

variable "application_name" {
  type = string
}

variable "icon_file" {
  type = string
}

variable "group_ids" {
  type = list(string)
}

variable "tags" {
  type    = list(string)
  default = []
}
