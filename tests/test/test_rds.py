import boto3
import os

def test_rds_instance_exists():
    rds = boto3.client("rds", region_name=os.getenv("AWS_REGION", "us-east-1"))
    dbs = rds.describe_db_instances()
    names = [db["DBInstanceIdentifier"] for db in dbs["DBInstances"]]
    assert "rds-test" in names
