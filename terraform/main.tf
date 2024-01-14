terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "5.44.0"
    }
  }
}

provider "github" {
  # Configuration options
   token = "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"
   owner="pratikraut88895@gmail.com"
}

resource "github_repository" "github-pages-terraform" {
  name        = "github-pages-terraform"
  description = "My awesome web page"
  visibility  = "private"
  auto_init   = true
  pages {
    source {
      branch = "main"
      path   = "/"
    }
  }
}