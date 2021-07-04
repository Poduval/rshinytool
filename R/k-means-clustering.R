#' @title Iris k-means clustering
#' @description Simplest shiny application available in shiny galary
#' @details Used for demo R package with shiny tools
#' @usage kmeansClustering()
#' @return Nothing
#' @import shiny 
#' @export
#' @examples
#' if (interactive()) {
#'   kmeansClustering()
#' }
#' 
kmeansClustering <- function() {
  
  app_dir = system.file("k-means-clustering", package = "rshinytool")
  if (app_dir == "") stop("ERROR, try re-installing `rshinytool`.", call. = FALSE)
  runApp(app_dir, display.mode = "normal")
  
}