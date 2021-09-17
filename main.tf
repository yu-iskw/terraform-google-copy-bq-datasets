data "google_project" "destination_project" {
  project_id = var.destination_dataset.project_id
}

resource "google_project_iam_member" "permissions" {
  project = var.destination_dataset.project_id
  role    = "roles/iam.serviceAccountShortTermTokenMinter"
  member  = "serviceAccount:service-${data.google_project.destination_project.number}@gcp-sa-bigquerydatatransfer.iam.gserviceaccount.com"
}


resource "google_bigquery_data_transfer_config" "query_config" {
  depends_on = [google_project_iam_member.permissions]

  data_source_id         = "cross_region_copy"
  display_name           = "test-cross-region-copy"
  location               = var.destination_dataset.location
  destination_dataset_id = var.destination_dataset.dataset_id
  service_account_name   = var.service_account

  params = {
    source_project_id = var.source_dataset.project_id
    source_dataset_id = var.source_dataset.dataset_id
  }
}
