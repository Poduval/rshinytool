# ==== Initialization ====
library(devtools)

# ==== Meta information ====
pkg_name <- "rshinytool"
pkg_path <- file.path("release", pkg_name)
pkg_version <- "0.0.1"
pkg_author <- person("Rakesh", "Poduval",
                     email = "poduval.rakesh@icloud.com",
                     role = c("aut", "cre"))

RScripts <- c("hello-world.R", "k-means-clustering.R")
RFiles <- file.path("R", RScripts)
RshinyApps <- c("hello-world", "k-means-clustering")
RshinyFolders <- file.path("tools", RshinyApps)
RData <- "data"

# ==== Package setup ====

# clear the directory (to restart package building) ====
unlink(pkg_path, force = TRUE, recursive = TRUE)

# Create the package directory ====
create_package(
  pkg_path,
  fields = list(
    Title = "rshinytool",
    Description = "shiny tool for statistical analysis - NO CODING",
    Version = pkg_version,
    Date = Sys.Date(),
    `Authors@R` = pkg_author,
    License = "GPL-2",
    Encoding = "UTF-8",
    Suggests = "",
    Imports =  c("shiny")),
  rstudio = FALSE,
  roxygen = TRUE,
  check_name = TRUE,
  open = FALSE)

# Copy the R scripts into sub directory R ====
file.copy(RFiles, file.path(pkg_path, "R"))

# Copy the shiny tools into sub directory inst ====
destdir <- file.path(pkg_path, "inst")
shinydir <- file.path(destdir, basename(RshinyFolders))

for(i in 1:length(shinydir)) {
  if(!dir.exists(shinydir[i]))
    dir.create(file.path(destdir, basename(shinydir[i])), recursive = T)
  file.copy(file.path(RshinyFolders[i], list.files(RshinyFolders[i])), 
            shinydir[i])
}

# Add release notes
file.copy("NEWS.md", pkg_path, overwrite = T)

# Create Rd files (help files) from roxygen comments ====
document(pkg_path)

# Build the package (generates rp.tar.gz) ====
build(pkg_path)

# check package ====
check(pkg_path, check_dir = pkg_path, document = FALSE, manual = TRUE)

# ==== install ====
install(pkg_path)

# create win-binary (generates rp.zip for windows only) ====
# build(pkg_path, binary = TRUE)

# ==== test ====
news(package = "rshinytool")
rshinytool:::helloWorld()
rshinytool:::kmeansClustering()
