% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dcat_distribution.R
\name{dcat_distribution}
\alias{dcat_distribution}
\title{Create a dcat:distribution/dcat:Distribution property}
\usage{
dcat_distribution(
  issued = dct_issued(),
  access_url = dcat_accessURL(),
  license = dct_license2(),
  ...
)
}
\arguments{
\item{issued}{dct:issued property, see \code{\link[=dct_issued]{dct_issued()}}.}

\item{access_url}{dcat:accessURL property, see \code{\link[=dcat_accessURL]{dcat_accessURL()}}.}

\item{license}{dct:license property, see \code{\link[=dct_license]{dct_license()}}.}

\item{...}{any other property to be included to a dcat:Distribution}
}
\value{
A character vector of length greater than one.
}
\description{
Create a dcat:distribution/dcat:Distribution property
}
\details{
A dcat:Dataset class, created with dcat_dataset(),
can/must have the following properties (M stands
for mandatory; R for recommended):
\itemize{
\item dct:issued, M in V1, R in V2: see \code{\link[=dct_issued]{dct_issued()}}
\item dcat:accessURL, M in V1 and V2: see \code{\link[=dcat_accessURL]{dcat_accessURL()}}
\item dct:license, M in V1 and V2: see \code{\link[=dct_license]{dct_license()}}
\item dcatap:availability, R in V2: not yet implemented
\item dct:description, R in V1 and V2: see \code{\link[=dct_description]{dct_description()}}
\item dct:format, R in V2: see \code{\link[=dct_format]{dct_format()}}
\item dct:rights, R in V2: see \code{\link[=dct_rights]{dct_rights()}}
\item dct:title, M in V1, R in V2: see \code{\link[=dct_title]{dct_title()}}
\item dct:modified, R in V2: see \code{\link[=dct_modified]{dct_modified()}}
\item dcat:accessService, R in V2: see \code{\link[=dcat_accessService]{dcat_accessService()}}
}
}
\examples{
dcat_distribution()

dcat_distribution(description = dct_description("Un archivio zip con un csv"))

}
