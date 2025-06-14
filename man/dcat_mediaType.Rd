% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dcat_mediaType.R
\name{dcat_mediaType}
\alias{dcat_mediaType}
\title{Create a dcat:mediaType property in DCAT-AP CH standard}
\usage{
dcat_mediaType(
  media_type = "https://www.iana.org/assignments/media-types/text/csv"
)
}
\arguments{
\item{media_type}{a MIME type of \href{http://www.iana.org/assignments/media-types/media-types.xhtml}{IANA-MEDIA-TYPES}. Example: "https://www.iana.org/assignments/media-types/text/csv"}
}
\description{
Property of \code{dcat:Distribution} (\code{\link[=dcat_distribution]{dcat_distribution()}}).
See also https://handbook.opendata.swiss/fr/content/glossar/bibliothek/dcat-ap-ch.html#dcat-distribution-media-type
}
\examples{
dcat_mediaType()

}
