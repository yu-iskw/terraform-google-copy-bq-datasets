# terraform-copy-bigquery-datasets
This is a terraform module to copy BigQuery datasets across regions.

- [Copying datasets](https://cloud.google.com/bigquery/docs/copying-datasets)

## How to use
```terraform
module "copy_dataset" {
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
}
```
