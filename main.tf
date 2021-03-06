provider "google" {
  access_token = var.access_token
  project = "tokyo-nomad-323506"
}

resource "google_kms_key_ring" "keyring-pubsub2" {
  name     = "keyring-example-pubsub2"
  location = "us-central1"
}

resource "google_kms_crypto_key" "example-key-pubsub2" {
  name            = "crypto-key-example-pubsub2"
  key_ring        = google_kms_key_ring.keyring-pubsub2.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
}

# Grant access to storage sa to encrypt and decrypt using the CMEK key
resource "google_kms_crypto_key_iam_member" "encryption" {
crypto_key_id = google_kms_crypto_key.example-key-pubsub2.id
role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
member        = "serviceAccount:service-420069091023@gcp-sa-pubsub.iam.gserviceaccount.com"
}

resource "google_pubsub_topic" "example" {
  name = "example-topic"

  kms_key_name = google_kms_crypto_key.example-key-pubsub2.id

  message_storage_policy {
    allowed_persistence_regions = [
      "us-central1"
    ]
  }
}

