# How to deploy service principal
### Example
- In the below defined block, we are creating two `app` and `api` service principals.
- In `app` service principal used Federated credentials of `opszero/app` repo.
- In `api` service principal used Federated credentials of `opszero/api` Repo.


```
  github = {
    app = {
      sign_in_audience  = "AzureADMyOrg"
      alternative_names = []
      repos             = "opszero/app"
      entity_type       = "pull_request" # for branch ref:refs/heads/<branch name>
    },
    api = {
      sign_in_audience  = "AzureADMyOrg"
      alternative_names = []
      repos             = "opszero/api"
      entity_type       = "pull_request" # for branch ref:refs/heads/<branch name>
    }
  }
```

#### Need to allow access `service principal` to `Kubernetes`

- Get the output of `client_id`.
- `client_id` put it in `kubelogin-cluterrole.yml` name section in subjects.

```
subjects:
  - apiGroup: rbac.authorization.k8s.io
    kind: User
    name: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```
- Run the command `kubectl apply kubelogin-cluterrole.yml`