#' Create statscourse project directory
#'
#' This function is used to create the directory structure for the
#' basic statistics homework assignments. It will also automatically
#' create an RMarkdown file for the homework assignement.
#'
#' @param path The path of the created project.
#' @param assignment The homework assignment number.
#' @param number The student id number.
#' @param yourname The student name.
#' @param thedate The date.
#'
statscourse_skeleton <- function(path,
                                 assignment = "01",
                                 number = "45110000",
                                 yourname = "Last First",
                                 thedate = "2014-04-01") {
  # collect inputs

  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
  resources = system.file('rstudio', 'templates', 'project', 'resources',
                          package = 'gnntemplate', mustWork = TRUE)
  files = list.files(resources, recursive = TRUE, include.dirs = TRUE)
  source = file.path(resources, files)
  target = file.path(path, files)
  file.copy(source, target)
  f = file.path(path, 'homework_x.Rmd')
  repl = paste0(number, "_", assignment)
  n = gsub("homework_x", repl, f)
  file.rename(f, n)
  f = file.path(n)
  xfun::gsub_file(f, "TITLE", paste0("Assignment ", assignment))
  xfun::gsub_file(f, "NAME", yourname)
  xfun::gsub_file(f, "DATE", thedate)
  TRUE

}

