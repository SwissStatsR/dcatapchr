

# <dct:license rdf:about="http://dcat-ap.ch/vocabulary/licenses/terms_by">
#   <rdf:type rdf:resource="http://purl.org/dc/terms/RightsStatement"/>
# </dct:license>

# <dct:license>NonCommercialAllowed-CommercialAllowed-ReferenceNotRequired</dct:license>


# See https://www.dcat-ap.ch/vocabulary/licenses/20210623.html


#' Create a dct:license property in DCAT-AP CH standard
#'
#'
#' @param about a dct:license uri. See https://www.dcat-ap.ch/vocabulary/licenses/20210623.html
#'
#' @examples
#' dct_license(
#'   about = "http://dcat-ap.ch/vocabulary/licenses/terms_open"
#' )
#'
#' @export
dct_license <- function(about = "http://dcat-ap.ch/vocabulary/licenses/terms_open") {
  stopifnot(length(about) == 1L)

  c(
    paste0(
      "<dct:license rdf:about=", add_quotes(about), ">"
    ),
    "  <rdf:type rdf:resource=\"http://purl.org/dc/terms/RightsStatement\"/>",
    "</dct:license>"
  )
}


#' @rdname dct_license
#'
#' @inheritParams dct_rights
#'
#' @export
#'
dct_license2 <- function(license = c(
  "NonCommercialAllowed-CommercialAllowed-ReferenceNotRequired",
  "NonCommercialAllowed-CommercialAllowed-ReferenceRequired",
  "NonCommercialAllowed-CommercialWithPermission-ReferenceNotRequired",
  "NonCommercialAllowed-CommercialWithPermission-ReferenceRequired"
)) {
  license <- license[1]

  paste0(
    "<dct:license>", license, "</dct:license>"
  )
}

#' @rdname dct_license
#'
#' @inheritParams dct_rights
#'
#' @examples
#' dct_license3("http://dcat-ap.ch/vocabulary/licenses/terms_by")
#'
#' @export
dct_license3 <- function(license = c("http://dcat-ap.ch/vocabulary/licenses/terms_open",
                                     "http://dcat-ap.ch/vocabulary/licenses/terms_by",
                                     "http://dcat-ap.ch/vocabulary/licenses/terms_ask",
                                     "http://dcat-ap.ch/vocabulary/licenses/terms_by_ask")) {
  license <- license[1]

  paste0(
    "<dct:license", " ", "rdf:resource", "=", add_quotes(license), "/>"
  )
}
