# Private VPC Endpoints
resource "aws_vpc_endpoint" "s3_data" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.us-east-1.s3"
  vpc_endpoint_type = "Gateway"
}
# Reduces data transfer costs.