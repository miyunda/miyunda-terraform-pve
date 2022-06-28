variable "pm_api_url" {
  description = "Proxmox API endpoint URL"
  sensitive   = true
}
variable "pm_api_token_id" {
  description = "Proxmox API token ID"
  sensitive   = true
}
variable "pm_api_token_secret" {
  description = "Proxmox API token secret"
  sensitive   = true
}