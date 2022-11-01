library(devtools)
library(testthat)

load_all()
document()

# Build vignettes and move to inst/doc
devtools::build_vignettes()
dir.create("inst/doc")
file.copy(dir("doc", full.names=TRUE), "inst/doc", overwrite=TRUE)

devtools::document(roclets = c('rd', 'collate', 'namespace'))
devtools::build(binary = T)

latest_file <- rev(list.files(path = '../', pattern =  '^HL7.*zip$', full.names = TRUE))[1]
latest_file

drat::insertPackage(latest_file, repodir = 'N:/Epidemiology/R-package-repo/')

# r <- getOption('repos')
# r['covid'] <- paste0('file:', 'N:/Epidemiology/R-package-repo/')
# options(repos = r)
# getOption('repos')
install.packages('HL7.NCIMS.R',  repos = getOption('repos')[2])

# This remove inst/doc
#devtools::build(vignettes = T)
#drat::insertPackage('../HL7.NCIMS.R_0.1.0.tar.gz', repodir = 'N:/Epidemiology/R-package-repo/')




