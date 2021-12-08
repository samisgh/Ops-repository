terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "v4.18.2"
    }
  }
}


provider "github" {
  token = "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" 
  owner = "samisgh"
}