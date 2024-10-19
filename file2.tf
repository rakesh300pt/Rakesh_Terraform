
resource "local_file" "r1" {
  filename   = "b"
  content    = "this is from resouce r1 "
  depends_on = [local_file.r2]
}

resource "local_file" "r2" {
  filename = "b2"
  content  = "this from r3source r2"
}

