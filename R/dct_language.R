

# <dct:language>de</dct:language>

#' Create a dct:language property in DCAT-AP CH standard
#'
#' @param language two-letters abbreviation of the language (one of "de", "fr", "it" or "en")
#'
#' @examples
#' dct_language(language = "de")
#' dct_language(language = "fr")
#' dct_language(language = "it")
#' dct_language(language = "en")
#'
#' @export
dct_language <- function(language = c("de", "fr", "it", "en")) {
  language <- language[1]

  check_language(language = language)

  paste0(
    "<dct:language>", language, "</dct:language>"
  )
}

#' @rdname dct_language
#'
#' @param language a language code of 3 letters. See
#'     https://handbook.opendata.swiss/de/content/glossar/bibliothek/dcat-ap-ch.html#dcat-distribution-language and
#'     https://publications.europa.eu/resource/authority/language
#'
#' @examples
#' dct_language2("ENG")
#'
#' @export
dct_language2 <- function(language = c("FRA", "ITA", "DEU", "ENG")) {
  language <- language[1]
  # <dct:language rdf:resource="http://publications.europa.eu/resource/authority/language/FRA"/>

  paste0(
    "<dct:language", " ", "rdf:resource", "=",
    "\"http://publications.europa.eu/resource/authority/language/",
    language, "\"",
    "/>"
  )
}
