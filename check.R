

# https://www.easyrdf.org/converter
# https://opendata.swiss/fr/dataset/statistisches-jahrbuch-der-schweiz-18931.rdf
# https://www.dcat-ap.ch/releases/2.0/dcat-ap-ch.html#classes

# devtools (check, build, load, ...) ------------
library(devtools)

load_all(".")

document()
check_man()
build_readme()
# check()
check(args = "--no-tests")

build()
if (Sys.info()[["sysname"]] == "Windows") build(binary = TRUE)

install(upgrade = "never")

test()
check()  # check() + test()

# use_pkgdown()

# usethis ---------
use_r("f_gen_tag")
use_r("dct_language")

# dct_description issue -------------------------
# In the txt imported (with readLines) there is an
# url, https://www3.ti.ch/DFE/DR/USTAT/index.php?fuseaction=temi.dettaglioMeta&metId=1002&p1=40&p2=219&p3=221&proId=220&t=1,
# that does not pass the easyrdf validator
# (https://www.easyrdf.org/converter).
# Is there a way to make such an url to be "valid"
# What is the problem?
# - "=" character?
# - "&" character?  --> YES, these are problematic
#   - substitute & with %26  --> NO

"https://www3.ti.ch/DFE/DR/USTAT/index.php?fuseaction=definizioni.fonti&amp;tema=35&amp;id=64&amp;proID=178&#13;"
"https://www3.ti.ch/DFE/DR/USTAT/index.php?fuseaction=definizioni.fonti&tema=35&id=64&proID=178"

tmp <- "https://www3.ti.ch/DFE/DR/USTAT/index.php?fuseaction=temi.dettaglioMeta&metId=1002&p1=40&p2=219&p3=221&proId=220&t=1"
gsub("&", "&amp;", tmp, fixed = TRUE)

# Sì così funziona



# Copia tar.gz nel progetto 00_copia_sorgenti_gib_packs -------------
file.copy(
  "../dcatapchr_0.0.0.3.tar.gz", to = "../00_copia_sorgenti_gib_packs/"
)

file.copy(
  "../dcatapchr_0.0.0.3.zip", to = "../00_copia_sorgenti_gib_packs/win.binaries/"
)

# Re-style R scripts
styler::style_pkg()



# usethis (test, ...) -----------------
library(usethis)
# create_package(path = ".")
use_package_doc()

use_github_action(name = "check-standard")
# use_github_pages()
use_github_action("pkgdown")

use_testthat()

use_test("add_quotes")
use_test("check_language")
use_test("dcat_accessURL")
use_test("dcat_catalog")
use_test("dcat_contactPoint")
use_test("dcat_dataset")
use_test("dcat_distribution")
use_test("dcat_keyword")
use_test("dcat_landingPage")
use_test("dcat_theme")
use_test("dct_accrualPeriodicity")
use_test("dct_description")
use_test("dct_format")
use_test("dct_identifier")
use_test("dct_issued")
use_test("dct_language")
use_test("dct_license")
use_test("dct_license2")
use_test("dct_modified")
use_test("dct_publisher")
use_test("dct_rights")
use_test("dct_spatial")
use_test("dct_temporal")
use_test("dct_title")
use_test("foaf_homepage")
use_test("indent")
use_test("rdf_dataset")
use_test("write_unix")
use_test("dcat_themeTaxonomy")
use_test("dcat_service")
use_test("dcat_endpointURL")
use_test("dcat_enpointDescription")
use_test("dcat_DataService")
use_test("dcat_servesDataset")
use_test("dcat_accessService")
use_test("gen_tag")
use_test("f_gen_tag")
use_test("dcat_byteSize")
use_test("dcat_downloadURL")

use_r("dcat_mediaType")
use_test("dcat_mediaType")

# covr::package_coverage() ------------
# Da eseguire in una nuova sessione R
rstudioapi::restartSession()
library(covr)
cov <- package_coverage()
cov
# as.data.frame(cov)
# report()
report(cov, file = "dcatapchr-report.html")


# pkgdown -----------------------------
library(pkgdown)
pkgdown::build_site()



# trials ------------------------------
library(xml2)

x <- read_xml("https://www.web.statistik.zh.ch/ogd/harvester/stadt-winterthur.xml")
y <- as_list(x)

names(y)
y$RDF

names(y$RDF$Catalog$dataset)

names(y$RDF$Catalog$dataset$Dataset)


# git push both on gitlab and github ------------
# From the terminal:
# git remote add github https://github.com/SwissStatsR/dcatapchr.git
# git remote add gitlab.ti git@gitlab.ti.ch:r-code/dcatapchr.git
# git remote -v
# origin is gitlab, github is github

# To push on both remote repositories:
# git push -u origin main    # push on gitlab
# git push -u github main    # push on github
# git push -u upstream main  # push on github/gibonet
# git push --set-upstream gitlab.ti --all

# To modify the upstream locally
# git branch --set-upstream-to=gitlab.ti/main

# Does this work?
# git push --all





