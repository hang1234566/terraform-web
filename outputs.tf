output "server_name" {
  description = "Tên máy chủ"
  value       = hyperv_vm.web_server.name
}

output "server_ip" {
  description = "Địa chỉ IP của máy chủ"
  value       = try(hyperv_vm.web_server.ip_addresses[0], "IP chưa được cấp")
}

output "vhd_path" {
  description = "Đường dẫn ổ đĩa máy ảo"
  value       = hyperv_vhd.web_disk.path
}

output "vm_id" {
  description = "ID của máy ảo"
  value       = hyperv_vm.web_server.id
}