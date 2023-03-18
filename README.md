# terraform-google-copy-bq-datasets
[![Lint terraform files](https://github.com/yu-iskw/terraform-google-copy-bq-datasets/actions/workflows/lint.yml/badge.svg)](https://github.com/yu-iskw/terraform-google-copy-bq-datasets/actions/workflows/lint.yml)

This is a terraform module to copy BigQuery datasets across regions.

- [Copying datasets](https://cloud.google.com/bigquery/docs/copying-datasets)

## How to use
```terraform
module "copy_dataset" {
  source = "git::git@github.com:yu-iskw/terraform-google-copy-bq-datasets.git?ref=v0.2.0"

  source_dataset = {
    project_id = "source-project"
    dataset_id = "source_dataset"
    location   = "US"
  }
  
  destination_dataset = {
    project_id = "destination-project"
    dataset_id = "destination_dataset"
    location   = "asia-northeast1"
  }
  
  # The service account has to have permissions to run Data Transfer jobs and create
  # datasets in the destination project and permissions to read the source dataset.
  service_account = "coping-bq-datasets@destination-project.iam.gserviceaccount.com"
  
  job_id = "coping-bq-datasets-job"
}
```
