provider "google" {
  access_token = var.access_token
  project = "tokyo-nomad-323506"
}


resource "google_pubsub_topic" "example3" {
  name = "example-topic-3"

  kms_key_name = "projects/tokyo-nomad-323506/locations/us-central1/keyRings/keyring-example-pubsub/cryptoKeys/crypto-key-example-pubsub"

  message_storage_policy {
    allowed_persistence_regions = [
      "us-central1"
    ]
  }
}
