variable "service_account" {
  description = "The service account to run Data Transfers in the destination project"
  type        = string
}

variable "source_dataset" {
  description = "The GCP project ID, dataset ID and location of the source dataset exist"
  type = object({
    project_id = string
    dataset_id = string
    location   = string
  })
}

variable "destination_dataset" {
  description = "The GCP project ID, dataset ID and location of the destination dataset exist"
  type = object({
    project_id = string
    dataset_id = string
    location   = string
  })
}

variable "job_id" {
  description = "The job ID of Data Transfers"
  type        = string
}
