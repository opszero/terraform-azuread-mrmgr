provider "azuread" {}


module "openid" {
  source = "./.."
  github = true
  sp_name = "testing-sp-name"
  repos  = {
    app = {
      repo        = "opszero/app"
      entity_type = "pull_request" # for branch ref:refs/heads/<branch name>
    }
    api = {
      repo        = "opszero/api"
      entity_type = "pull_request" # for branch ref:refs/heads/<branch name>
    }
  }
}

