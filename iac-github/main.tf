terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}




provider "github" {
  token = "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" 
  owner = "samisgh"
}