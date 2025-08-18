


#' A closure to create a function that generates a tag like <tag>...</tag>
#'
#'
#' @param tag character string with the desired tag
#'
#'
#' @examples
#' # Create an f function to generate a dct:identifier tag
#' f <- f_gen_tag(tag = "dct:identifier")
#' f(x = "an_identifier")
#'
#' rm(f)
#'
#'
#' @export
f_gen_tag <- function(tag = "dct:identifier") {
  function(x = "...") {
    stopifnot(length(tag) == 1L)

    paste0(
      "<", tag, ">",
      x,
      "</", tag, ">"
    )
  }
}


#' A closure to create a function that generates a tag like <tag rdf:resource="..." />
#'
#'
#' @param tag character string with the desired tag
#' @param rdf_resource character string that comes afer the tag (default: "rdf:resource")
#'
#'
#' @examples
#' # Create an f function to generate a dcat:accessURL tag
#' f <- f_gen_tag2(tag = "dcat:accessURL")
#' f(x = "https://www.example.com")
#'
#' rm(f)
#'
#'
#' @export
f_gen_tag2 <- function(tag = "dcat:accessURL", rdf_resource = "rdf:resource") {
  function(x = "https://example.com") {
    stopifnot(length(tag) == 1L)

    paste0(
      "<", tag, " ", rdf_resource, "=", add_quotes(x), "/>"
    )
  }
}

