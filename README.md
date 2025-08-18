
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![R-CMD-check](https://github.com/SwissStatsR/dcatapchr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/SwissStatsR/dcatapchr/actions/workflows/R-CMD-check.yaml)
[![:name status
badge](https://swissstatsr.r-universe.dev/badges/:name)](https://swissstatsr.r-universe.dev/)
[![dcatapchr status
badge](https://swissstatsr.r-universe.dev/badges/dcatapchr)](https://swissstatsr.r-universe.dev/dcatapchr)

# dcatapchr

The goal of dcatapchr is to create a metadata catalog compatible with
the DCAT-AP CH standard.

Basically, a catalog consists of one or more datasets, and each dataset
has one or more distributions (see
<https://www.dcat-ap.ch/releases/2.0/dcat-ap-ch.html> and
<https://handbook.opendata.swiss/de/content/glossar/bibliothek/dcat-ap-ch.html>).

## Installation

You can install the development version of dcatapchr like so:

``` r
remotes::install_github("SwissStatsR/dcatapchr")
```

Or from the `swissstatsr.r-universe.dev`:

``` r
install.packages("dcatapchr", repos = "https://swissstatsr.r-universe.dev")
```

## Example

In the example below, a catalog is created with a dataset with 3
distributions.

``` r
library(dcatapchr)

# Create the metadata of a dataset with 3 distributions

# First create the 3 distributions
distributions <- c(
  dcat_distribution(
    issued = dct_issued("2021-10-14"), 
    access_url = dcat_accessURL(
      "https://www3.ti.ch/DFE/DR/USTAT/allegati/cubo/cubi_POL_01_xlsx.zip"
    ), 
    license = dct_license3(
      "http://dcat-ap.ch/vocabulary/licenses/terms_by"
    )
  ),
  
  dcat_distribution(
    issued = dct_issued("2021-10-14"), 
    access_url = dcat_accessURL(
      "https://www3.ti.ch/DFE/DR/USTAT/allegati/cubo/cubi_POL_01_px.zip"
    ), 
    license = dct_license3(
      "http://dcat-ap.ch/vocabulary/licenses/terms_by"
    )
  ),
  
  dcat_distribution(
    issued = dct_issued("2021-10-14"), 
    access_url = dcat_accessURL(
      "https://www3.ti.ch/DFE/DR/USTAT/allegati/cubo/cubi_POL_01_csv.zip"
    ), 
    licence = dct_license3(
      "http://dcat-ap.ch/vocabulary/licenses/terms_by"
    )
  )
)

distributions
#>  [1] "<dcat:distribution>"                                                                                        
#>  [2] "  <dcat:Distribution>"                                                                                      
#>  [3] "    <dct:issued rdf:datatype=\"http://www.w3.org/2001/XMLSchema#dateTime\">2021-10-14T00:00:00</dct:issued>"
#>  [4] "    <dcat:accessURL rdf:resource=\"https://www3.ti.ch/DFE/DR/USTAT/allegati/cubo/cubi_POL_01_xlsx.zip\" />" 
#>  [5] "    <dct:license rdf:resource=\"http://dcat-ap.ch/vocabulary/licenses/terms_by\"/>"                         
#>  [6] "  </dcat:Distribution>"                                                                                     
#>  [7] "</dcat:distribution>"                                                                                       
#>  [8] "<dcat:distribution>"                                                                                        
#>  [9] "  <dcat:Distribution>"                                                                                      
#> [10] "    <dct:issued rdf:datatype=\"http://www.w3.org/2001/XMLSchema#dateTime\">2021-10-14T00:00:00</dct:issued>"
#> [11] "    <dcat:accessURL rdf:resource=\"https://www3.ti.ch/DFE/DR/USTAT/allegati/cubo/cubi_POL_01_px.zip\" />"   
#> [12] "    <dct:license rdf:resource=\"http://dcat-ap.ch/vocabulary/licenses/terms_by\"/>"                         
#> [13] "  </dcat:Distribution>"                                                                                     
#> [14] "</dcat:distribution>"                                                                                       
#> [15] "<dcat:distribution>"                                                                                        
#> [16] "  <dcat:Distribution>"                                                                                      
#> [17] "    <dct:issued rdf:datatype=\"http://www.w3.org/2001/XMLSchema#dateTime\">2021-10-14T00:00:00</dct:issued>"
#> [18] "    <dcat:accessURL rdf:resource=\"https://www3.ti.ch/DFE/DR/USTAT/allegati/cubo/cubi_POL_01_csv.zip\" />"  
#> [19] "    <dct:license>NonCommercialAllowed-CommercialAllowed-ReferenceNotRequired</dct:license>"                 
#> [20] "    <dct:license rdf:resource=\"http://dcat-ap.ch/vocabulary/licenses/terms_by\"/>"                         
#> [21] "  </dcat:Distribution>"                                                                                     
#> [22] "</dcat:distribution>"

# Then create the dataset with the 3 distributions created above
description <- readLines(
  system.file(
    "cubi_POL_01_INFORMAZIONI.txt", package = "dcatapchr"
  ), encoding = "UTF-8"
)
description <- strwrap(description, width = 80)
description <- paste(description, collapse = "\n")

# Substitute & with &amp; in urls
description <- gsub("&", "&amp;", description, fixed = TRUE)

dataset <- dcat_dataset(
  title = dct_title(
    title = "Partecipazione alle elezioni del Consiglio di Stato, per comune, in Ticino, dal 1921 al 2011", 
    language = "it"
  ), 
  description = dct_description(
    description = description, 
    language = "it"
  ), 
  publisher = dct_publisher2(
    publisher = "https://www.ti.ch/ustat", 
    foaf_name = "Ustat",
    language = "it"
  ), 
  contactPoint = dcat_contactPoint(), 
  identifier = dct_identifier(),
  distribution = distributions
)

# dataset

# And finally put the dataset in a catalog
catalog <- dcat_catalog(
  catalog_endpoint = "https://www3.ti.ch/DFE/DR/USTAT/allegati/digitale/catalogo_ustat.rdf", 
  datasets = dataset
)

head(catalog, n = 15)
#>  [1] "<?xml version=\"1.0\" encoding=\"utf-8\" ?>"                                                        
#>  [2] "<rdf:RDF "                                                                                          
#>  [3] "  xmlns:foaf=\"http://xmlns.com/foaf/0.1/\""                                                        
#>  [4] "  xmlns:rdfs=\"http://www.w3.org/2000/01/rdf-schema#\""                                             
#>  [5] "  xmlns:hydra=\"http://www.w3.org/ns/hydra/core#\""                                                 
#>  [6] "  xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\""                                        
#>  [7] "  xmlns:dcat=\"http://www.w3.org/ns/dcat#\""                                                        
#>  [8] "  xmlns:dct=\"http://purl.org/dc/terms/\""                                                          
#>  [9] "  xmlns:vcard=\"http://www.w3.org/2006/vcard/ns#\""                                                 
#> [10] "  xmlns:xsd=\"http://www.w3.org/2001/XMLSchema#\""                                                  
#> [11] "  xmlns:schema=\"http://schema.org/\""                                                              
#> [12] ">"                                                                                                  
#> [13] "  <dcat:Catalog rdf:about=\"https://www3.ti.ch/DFE/DR/USTAT/allegati/digitale/catalogo_ustat.rdf\">"
#> [14] "    <dcat:dataset>"                                                                                 
#> [15] "      <dcat:Dataset>"


tail(catalog, n = 20)
#>  [1] "        </dcat:distribution>"                                                                                       
#>  [2] "        <dcat:distribution>"                                                                                        
#>  [3] "          <dcat:Distribution>"                                                                                      
#>  [4] "            <dct:issued rdf:datatype=\"http://www.w3.org/2001/XMLSchema#dateTime\">2021-10-14T00:00:00</dct:issued>"
#>  [5] "            <dcat:accessURL rdf:resource=\"https://www3.ti.ch/DFE/DR/USTAT/allegati/cubo/cubi_POL_01_px.zip\" />"   
#>  [6] "            <dct:license rdf:resource=\"http://dcat-ap.ch/vocabulary/licenses/terms_by\"/>"                         
#>  [7] "          </dcat:Distribution>"                                                                                     
#>  [8] "        </dcat:distribution>"                                                                                       
#>  [9] "        <dcat:distribution>"                                                                                        
#> [10] "          <dcat:Distribution>"                                                                                      
#> [11] "            <dct:issued rdf:datatype=\"http://www.w3.org/2001/XMLSchema#dateTime\">2021-10-14T00:00:00</dct:issued>"
#> [12] "            <dcat:accessURL rdf:resource=\"https://www3.ti.ch/DFE/DR/USTAT/allegati/cubo/cubi_POL_01_csv.zip\" />"  
#> [13] "            <dct:license>NonCommercialAllowed-CommercialAllowed-ReferenceNotRequired</dct:license>"                 
#> [14] "            <dct:license rdf:resource=\"http://dcat-ap.ch/vocabulary/licenses/terms_by\"/>"                         
#> [15] "          </dcat:Distribution>"                                                                                     
#> [16] "        </dcat:distribution>"                                                                                       
#> [17] "      </dcat:Dataset>"                                                                                              
#> [18] "    </dcat:dataset>"                                                                                                
#> [19] "  </dcat:Catalog>"                                                                                                  
#> [20] "</rdf:RDF>"
```

Export to an rdf file (with UNIX line endings):

``` r
# f <- file("./catalogo_ustat.rdf", "wb")
# writeLines(catalog, con = f, useBytes = TRUE)
# close(f)
write_unix(catalog, filename = "catalogo_ustat.rdf")
```
