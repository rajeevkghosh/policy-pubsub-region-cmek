module "tfplan-functions" {
  source = "../../tfplan-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-cmek-pass.sentinel"
  }
}

param "prefix" {
    value = "us-"
}

test {
  rules = {
    main = true
  }
}
