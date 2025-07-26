import boto3
import os

def test_eks_cluster_exists():
    eks = boto3.client("eks", region_name=os.getenv("AWS_REGION", "us-east-1"))
    response = eks.list_clusters()
    assert "eks-dev" in response["clusters"]
