resource "local_file" "aws_key" {
  content = "${tls_private_key.ucsf_test_key.private_key_pem}"
  filename = "aws_test.pem"
}