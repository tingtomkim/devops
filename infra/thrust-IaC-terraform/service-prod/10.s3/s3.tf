module "s3" {
    source = "../../module/s3/"
    name   = ["service-prod", "airflow-log-prod"]
    key    = ["uploads/", "airflow-prod-logs/"]
    acl    = "private"
}
