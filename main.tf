variable template_name                        {} # Relative path and file name to the template file to render
variable template_vars                        {} # Map of variables which will be substituted into the template
variable rendered_file_name              {} # Relative path and file name of the final rendered file

data "template_file" "local_template" {
  template = file("./${var.template_name}")
  vars     = var.template_vars
}


resource "local_file" "local_file" {
    content     = data.template_file.local_template.rendered
    filename    = "${path.module}/${var.rendered_file_name}"
}

