
resource "aws_key_pair" "north-virginia-ssh" {
  key_name   = "north-virginia-ssh-key"
  public_key = "d8he7de87h87deh8d8"
  provider   = aws.north-virginia
}

resource "aws_key_pair" "ohio-ssh" {
  key_name   = "ohio-ssh-key"
  public_key = "xsij87cdy8cdh98cd98"
  provider   = aws.ohio
}
