#The configuration for the `remote` backend.
terraform {
  cloud {
    organization = "3M-using-GithubActions"

    workspaces {
      name = "3M-using-GithubActions"
    }
  }
}

variable "cli_config_credentials_token" {
  description = "Terraform Cloud user token"
  type = string
  default = "default_value"
}

# An example resource that does nothing.
resource "null_resource" "example" {
  triggers = {
    value = "This example resource does nothing still!"
  }
}

output "secret_value" {
  value = var.cli_config_credentials_token
}