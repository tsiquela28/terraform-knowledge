output "vm_ip" {
  description = "IP da VM criada na AWS"
  value       = aws_instance.instance.public_ip
}