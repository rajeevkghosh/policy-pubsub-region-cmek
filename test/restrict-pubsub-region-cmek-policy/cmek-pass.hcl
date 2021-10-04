  module "tfplan-functions" {
  source = "../../tfplan-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-cmek-pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
