# Build ====

library(devtools)
use_build_ignore(c('Packaging.R', 'release', "renv", 'renv.lock'))
document()
build(path = "release/", quiet = FALSE,
      binary = FALSE, vignettes = TRUE) 
check(quiet = TRUE)
install()

# cd 05-release
# R CMD INSTALL --build BCM_17.1.0.tar.gz


# Test ====
news(package = "rshinytool")
rshinytool:::helloWorld()
rshinytool:::kmeansClustering()
