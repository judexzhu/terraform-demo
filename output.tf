output "example1_public_ip" {
  value = "${aws_instance.example1.public_ip}"
}
output "example2_public_ip" {
  value = "${aws_instance.example2.public_ip}"
}
output "example1_private_ip" {
  value = "${aws_instance.example1.private_ip}"
}
output "example2_private_ip" {
  value = "${aws_instance.example2.private_ip}"
}
output "rds" {
  value = "${aws_db_instance.mariadb.endpoint}"
}
output "ELB" {
	value = "${aws_elb.my-elb.dns_name}"
}
