variable "tag" {
  type = string
}
variable "ami_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}
variable "sg_id" {
  type = list(string)
}
variable "volume_size" {
  type = number
}
variable "user_data" {
  type = string
}
variable "instance_profile" {
  type = string
}
