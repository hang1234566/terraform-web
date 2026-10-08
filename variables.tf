variable "server_name" {
  description = "Tên máy chủ"
  type        = string
  default     = "terraform-web"
}

variable "cpu" {
  description = "Số CPU"
  type        = number
  default     = 2
}

variable "ram_gb" {
  description = "RAM tính bằng GB"
  type        = number
  default     = 2
}

variable "disk_gb" {
  description = "Dung lượng ổ đĩa tính bằng GB"
  type        = number
  default     = 20
}

variable "region" {
  description = "Region"
  type        = string
  default     = "local-hyperv"
}

variable "zone" {
  description = "Zone"
  type        = string
  default     = "default-switch"
}

variable "ssh_key" {
  description = "SSH key"
  type        = string
  default     = ""
}