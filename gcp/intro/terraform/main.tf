terraform {
  required_version = ">=1.0.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.79, <4.0"
    }
  }
}
provider "google" {
  project     = "terraform-vm-415814"
}

resource "google_service_account" "example" {
  account_id   = "a-example1"
  display_name = "sa-1"
}
data "google_service_account" "example" {
  account_id = google_service_account.example.account_id
}

output "service_account_email" {
  value = data.google_service_account.example.email
}