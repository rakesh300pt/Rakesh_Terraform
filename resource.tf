resource "local_file" "number" {
  filename = "a3"
  content  = var.varnumber
}

resource "local_file" "string" {
  filename = "a4"
  content  = var.varstring
}
resource "local_file" "bool" {
  filename = "a5"
  content  = var.varboolean
}
resource "local_file" "list" {
  filename = "a7"
  content  = var.varlist[1]
}
resource "local_file" "map" {
  filename = "a8"
  content  = var.varmap.id
}

resource "local_file" "object" {
  filename = "Test_object"
  content  = var.varobject.age
}

resource "local_file" "tuple" {
  filename = "Test_tuple"
  content  = var.vartuple[0]
}




