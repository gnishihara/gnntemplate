# Borrowed from rticles to avoid having to deal w/ name space issues
# Not exported


find_file <- function(template, file) {
  template <- system.file("rmarkdown", "templates",
                          gsub("_", "-", template),file,
                          package = "gnntemplate")
  if (template == "") {
    stop("Couldn't find template file ", template, "/", file, call. = FALSE)
  }

  template
}

find_resource <- function(template, file) {
  find_file(template, file.path("resources", file))
}

# find_resource("gnn_beamer", "template.tex")
# find_resource("gnn_statistics", "template.tex")
