module "tfplan-functions" {
    source = "./tfplan-functions.sentinel"
}

#module "tfstate-functions" {
    #source = "./tfstate-functions.sentinel"
#}

#module "tfconfig-functions" {
   # source = "./tfconfig-functions.sentinel"
#}

policy "restrict_disk_size" {
    source = "./restrict-pubsub-region-cmek-policy.sentinel"
    enforcement_level = "soft-mandatory"
}
/*
param "prefix" {
value = "us-"
}
*/
