#' @title Hello world application
#' @description Simplest shiny application available in shiny galary
#' @details Used for demo R package with shiny tools
#' @usage helloWorld()
#' @return Nothing
#' @import shiny 
#' @export
#' @examples
#' if (interactive()) {
#'   helloWorld()
#' }
#' 
helloWorld <- function() {
  
  app_dir = system.file("hello-world", package = "rshinytool")
  if (app_dir == "") stop("ERROR, try re-installing `rshinytool`.", call. = FALSE)
  runApp(app_dir, display.mode = "normal")
  
}