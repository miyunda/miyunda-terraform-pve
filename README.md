[![Create or Destroy](https://github.com/miyunda/terraform-pve/actions/workflows/terraform.yml/badge.svg)](https://github.com/miyunda/terraform-pve/actions/workflows/terraform.yml)
# Terraform PVE
This repo is for my personnal usage only, just to test PVE VM/LXC provisioning, by means of Terraform automation. Please kindly do not submit any PR. 

Fork me and play with your own repo.

You need a PVE(Proxmox), accessabile from internet (by Github hosted runners), and an OCI bucket (S3 compatibile).

Once you have following secrets defined in one of your repo's environment, you are good to go.
- [x] AWS_ACCESS_KEY_ID
- [x] AWS_S3_ENDPOINT
- [x] AWS_SECRET_ACCESS_KEY
- [ ] BACKEND_BUCKET
- [x] TF_VAR_pm_api_token_id
- [x] TF_VAR_pm_api_token_secret=
- [x] TF_VAR_pm_api_url

>Note that `BACKEND_BUCKET` is not very sensitive, you may not want to keep it as a secret, hard code it in your .tf files if you like.

For more info, this repo is a companion repo to the "fill URL of the blog".