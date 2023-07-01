resource "aws_efs_file_system" "archive" {
    encrypted                       = true
    performance_mode                = "generalPurpose"
    provisioned_throughput_in_mibps = 0
    tags                            = {
        "Name" = var.name
    }
    tags_all                        = {
        "Name" = var.name
    }
    throughput_mode                 = "bursting"
}
