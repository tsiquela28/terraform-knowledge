output "vm_ip" {
  description = "IP público da máquina"
  value       = azurerm_linux_virtual_machine.vm.public_ip_address

}