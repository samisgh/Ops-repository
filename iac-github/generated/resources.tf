resource "github_repository" "var=repodata" {
  name                   = "var=repodata"
  description            = "var=repodata"
  visibility             = "public"
  has_issues             = false
  has_projects           = false
  has_wiki               = false
  delete_branch_on_merge = true
  auto_init              = true
  vulnerability_alerts   = true

lifecycle {
    create_before_destroy = true
  }
}

resource "github_branch_default" "var=repodata"{
  repository = github_repository.test.name
  branch     = "main"
}

resource "github_branch_protection" "var=repodata" {
  repository_id = github_repository.test.node_id
 for_each = {
    main = {
      pattern          = "main",
      strict           = true,
      contexts         = ["continuous-integration/jenkins/branch"],
      allows_deletions = false
    }
 }


  pattern                = "main"
  enforce_admins         = true
  allows_deletions       = each.value["allows_deletions"]
  allows_force_pushes    = false
  require_signed_commits = true

  required_status_checks {
    strict   = each.value["strict"]
    contexts = each.value["contexts"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews  = true
  }

  
 lifecycle {
    create_before_destroy = true
  }
}