# This function showcases how one might write a function to be used as an
# RStudio project template. This function will be called when the user invokes
# the New Project wizard using the project template defined in the template file
# at:
#
#   inst/rstudio/templates/project/hello_world.dcf
#
# The function itself just echos its inputs and outputs to a file called INDEX,
# which is then opened by RStudio when the new project is opened.
statscourse_skeleton <- function(path, ...) {

  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
  resources = system.file('rstudio', 'templates', 'project', 'resources',
                          package = 'gnntemplate', mustWork = TRUE)
  files = list.files(resources, recursive = TRUE, include.dirs = TRUE)
  source = file.path(resources, files)
  target = file.path(path, files)
  file.copy(source, target)
  f = file.path(path, 'homework_x.Rmd')

  file.rename(f, n)

  TRUE

}