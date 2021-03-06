resource "aws_inspector_resource_group" "test-group" {
  tags {
    Name = "${aws_instance.inspector.tags.Name}"
    Env  = "test-group"
  }
}

resource "aws_inspector_assessment_target" "test-target" {
  name = "inspector-assessment"
  resource_group_arn = "${aws_inspector_resource_group.test-group.arn}"
}

resource "aws_inspector_assessment_template" "test-template" {
  name       = "test-template"
  target_arn = "${aws_inspector_assessment_target.test-target.arn}"
  duration   = 3600

  rules_package_arns = [
    "arn:aws:inspector:us-east-1:316112463485:rulespackage/0-PmNV0Tcd",
  ]
}
