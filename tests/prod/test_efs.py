import boto3
import os

def test_efs_exists():
    efs = boto3.client("efs", region_name=os.getenv("AWS_REGION", "us-east-1"))
    filesystems = efs.describe_file_systems()
    fs_names = [fs["Name"] for fs in filesystems["FileSystems"] if "Name" in fs["Tags"]]
    assert "efs-prod" in fs_names
