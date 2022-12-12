
<!-- README.md is generated from README.Rmd. Please edit that file -->

# HL7.R

<!-- badges: start -->

[![R-CMD-check](https://github.com/Shaunson26/HL7.R/actions/workflows/r-cmd-check.yml/badge.svg)](https://github.com/Shaunson26/HL7.R/actions/workflows/r-cmd-check.yml)
![GitHub R package
version](https://img.shields.io/github/r-package/v/shaunson26/HL7.R)
<!-- badges: end -->

The goal of HL7.R is to enable wrangling of HL7 2.3.1/2.4 in R. This
package was driven by the need of HL7 wrangling for NCIMS tasks (a
notifiable conditions database for a state health authority). HL7
messages are just flattened list objects, and as such can be imported
into R as a nested list.

Information on HL7 specifications were sourced from:

- <http://www.hl7.eu/HL7v2x/v231/hl7v231segm.htm>
- <https://hl7-definition.caristix.com/v2/>

## Installation

### Devops

Clone repo, open `HL7.R.Rproj` and use `devtools`

``` r
library(devtools)
#> Loading required package: usethis
load_all()
#> ℹ Loading HL7.R
#> HL7.R - for help see vignette('Getting-started', package = 'HL7.R') or vignette('package = 'HL7.R') for other examples
```

### From archive

Someone built the package and has given you the file - be aware if they
built using source or binary. Generally, `tar.gz` = source, `zip` =
binary

``` r
install.packages('HL7.R.xxx.tar.gz', repos = NULL, type = 'source')
install.packages('HL7.R.xxx.zip', repos = NULL)
```

### From DRAT

A local package repo may exist. Again, be aware if they built using
source or binary. Look for `./bin` and `./src` in the DRAT folder.

``` r
library(drat)
drat::addRepo("workgroup", 'file:drive:/path/to/drat')
install.packages('HL7.R', repos = options()$repos[2]) # assuming binary
```

## Parsing a HL7

The first problem this package solves is parsing of HL7 messages into a
nested list. The function `parse_hl7_message()` will parse a HL7 file
into a list. This works for both single messages and batch messages. For
each parsed message, the function will try it’s best at naming all the
elements. This is simple for the top level elements (HL7 segments), but
a bit more cumbersome within the list elements (HL7 segment fields). By
convention, fields are referenced by number (“The fourth field in MSH is
the sending facility”), but having names can make things a bit more
readable at times. Repeated segments within a message are numbered in
the output list e.g. OBX.1 OBX.2 (using the Set ID value).

**Notes**

- All values should be imported as text, and any conversion needs to be
  done downstream e.g with datetimes
- A `filename` attribute is attached with the list object

### Single HL7 message

Use `parse_hl7_message()` on a file path.

``` r
hl7_file <- system.file(package = 'HL7.R', 'extdata/hl7-2.3.1.hl7')

hl7_list <- parse_hl7_message(hl7_file)

names(hl7_list)
#> [1] "MSH"   "PID"   "PV1"   "OBR"   "OBX.1" "OBX.2" "OBX.3" "OBX.4"

# First 5 fields of these segments
hl7_list$MSH[1:5]
#> $EncodingCharacters
#> [1] "^~\\&"
#> 
#> $SendingApplication
#> [1] "22-70047081"
#> 
#> $SendingFacility
#> [1] "AN EXAMPLE LAB"
#> 
#> $ReceivingApplication
#> [1] "NDD"
#> 
#> $ReceivingFacility
#> [1] "NSW HEALTH"
hl7_list$PID[1:5]
#> $SetID
#> [1] ""
#> 
#> $PatientID
#> [1] ""
#> 
#> $PatientIdentifierList
#> [1] "AN EXAMPLE LAB"
#> 
#> $AlternatePatientIDPID
#> [1] ""
#> 
#> $PatientName
#> $PatientName$familyName
#> [1] "SIMPSON"
#> 
#> $PatientName$givenName
#> [1] "HOMER"
```

``` r
# File from where data parsed
attr(hl7_list, 'filename')
#> [1] "hl7-2.3.1.hl7"
```

Traditionally indexes are used, but using named elements can help
readability.

``` r
with(hl7_list,
     data.frame(
       first_name = PID[[5]][[2]],
       last_name = PID[[5]][[1]],
       suburb = PID[[11]][[3]]
     )
)
#>   first_name last_name      suburb
#> 1      HOMER   SIMPSON SPRINGFIELD

with(hl7_list,
     data.frame(
       first_name = PID$PatientName$givenName,
       last_name = PID$PatientName$familyName,
       suburb = PID$PatientAddress$city
     )
)
#>   first_name last_name      suburb
#> 1      HOMER   SIMPSON SPRINGFIELD
```

### Batch HL7 message

`parse_hl7_message()` will check for batch headers and parse
appropriately. The result is a list of parsed messages.

``` r
hl7_file <- system.file(package = 'HL7.R', 'extdata/fake-covid-batch.hl7')

hl7_list <- parse_hl7_message(hl7_file)
#> Found 2 messages within file

# unnamed list of length of the number of messages
length(hl7_list)
#> [1] 2
names(hl7_list)
#> NULL

# a single message lives within the list elements now
names(hl7_list[[1]])
#> [1] "MSH"   "PID"   "OBX.1"

# accessing things
hl7_list[[1]]$PID$PatientName
#> $familyName
#> [1] "Homer"
#> 
#> $givenName
#> [1] "Simpson"
hl7_list[[2]]$PID$PatientName
#> $familyName
#> [1] "Ned"
#> 
#> $givenName
#> [1] "Flanders"
```

### Multiple HL7 to line list

Cycle through each file and use `parse_hl7_message()`

``` r
# Two HL7 files starting with 'fake' are distributed with this package, 
hl7_files <- 
  system.file(package = 'HL7.R', 'extdata') %>% 
  list.files(pattern = 'fake-covid-\\d.hl7$', full.names = T)

basename(hl7_files)
#> [1] "fake-covid-1.hl7" "fake-covid-2.hl7"

# Parse into list
hl7_list <- lapply(hl7_files, parse_hl7_message)

length(hl7_list)
#> [1] 2

# Equivalent result to a parsed batch HL7
hl7_list[[1]]$PID$PatientName
#> $familyName
#> [1] "Homer"
#> 
#> $givenName
#> [1] "Simpson"
hl7_list[[2]]$PID$PatientName
#> $familyName
#> [1] "Ned"
#> 
#> $givenName
#> [1] "Flanders"

# el = list element in each loop
lapply(hl7_list, function(el){
  
  with(el,
       data.frame(
         first_name = PID$PatientName$givenName,
         last_name = PID$PatientName$familyName,
         suburb = PID$PatientAddress$city,
         lab = MSH$SendingFacility,
         test = OBX.1$ObservationIdentifier$text,
         result = OBX.1$ObservationValue[[2]]
       )
  )
}) %>% 
  do.call(rbind.data.frame, .)
#>   first_name last_name      suburb                     lab          test   result
#> 1    Simpson     Homer Springfield      Dr Hibbert Medical nCoV-2019 PCR  Postive
#> 2   Flanders       Ned Springfield Nick Riviera Appartment nCoV-2019 PCR Negative
```

## Creating HL7 2.3.1

The second problem this package solves is converting any arbitrary piece
of data into a HL7 message. This is conducted by piecing together
**segments** such as the message header (MSH), Patient identification
(PID) and Observation/Results (OBX). This package provides segment
functions e.g. `MSH()`, `PID()`, with named parameters that will build a
text segment ready for piecing together using the function
`build_hl7()`.

**Notes**

- There a default blank values for all the fields in a segment function,
  and they will be included in the final output as shown below up until
  the last observed value i.e. trailing blanks are trimmed see the
  parameter `.trim` in most functions
- There are helper functions `*Components()` for nested fields. As these
  are helpers, you can safely skip if you can correctly create the
  required value
- Dates/Datetimes can be converted using `datetime_to_hl7_datetime()`

``` r
example_hl7_build <-
  build_hl7(
    MSH(SendingFacility = 'A lab', ReceivingFacility = 'NSW Health', VersionID = '2.3.1'),
    PID(PatientID = '1234', 
        PatientName = PatientNameComponents(familyName = 'Ross', 
                                            givenName = 'Bob'), 
        PatientAddress = PatientAddressComponents(streetAddress = '123 Fake Street', 
                                                  city = 'Springfield',
                                                  zipPostcode = '90120')),
    OBX(SetID = 1,
        ValueType = 'CE',
        ObservationIdentifier = ObservationIdentifierComponents(identifier = 'NSW_LOINC-376',
                                                                text = 'nCoV-2019 PCR',
                                                                nameOfCodingSystem = 'LN'),
        ObservationValue = variedComponents('260415000^Not Detected^SNOMED-CT'))
  )
```

``` r
example_hl7_build
#> MSH|^~\&||A lab||NSW Health||||||2.3.1
#> PID||1234|||Ross^Bob||||||123 Fake Street^^Springfield^^90120
#> OBX|1|CE|NSW_LOINC-376^nCoV-2019 PCR^LN||260415000^Not Detected^SNOMED-CT
```

Conversion of Date and Datetimes

``` r
datetime_to_hl7_datetime(Sys.time())
#> [1] "20221212105930"
```

`.trim` will trim trailing blank fields. It is `TRUE` by default

``` r
MSH(SendingFacility = 'NSW HEALTH', VersionID = '2.3.1')
#> MSH|^~\&||NSW HEALTH||||||||2.3.1
MSH(SendingFacility = 'NSW HEALTH', VersionID = '2.3.1', .trim = FALSE)
#> MSH|^~\&||NSW HEALTH||||||||2.3.1||||||||

PatientAddressComponents(streetAddress = '123 Fake Street')
#> [1] "123 Fake Street"
PatientAddressComponents(streetAddress = '123 Fake Street', .trim = FALSE)
#> [1] "123 Fake Street^^^^^"
```

### Line list to HL7

Often we have the task of translating a line list into HL7 messages. A
simple example is show below:

- loop through the rows using `lapply`
- convert the row into a list for easy reference e.g. `d$firstname`

``` r
# A 2 row line list with fake data is distributed with this package
some_line_list <- read.csv(system.file(package = 'HL7.R', 'extdata/fake-covid-n2.csv'))
some_line_list
#>   firstname lastname                street      suburb test_id     text_text result_code result_text                facility
#> 1     Homer  Simpson 742 Evergreen Terrace Springfield  ncov19 nCoV-2019 PCR           P     Postive      Dr Hibbert Medical
#> 2       Ned Flanders 744 Evergreen Terrace Springfield  ncov19 nCoV-2019 PCR           N    Negative Nick Riviera Appartment
```

``` r
hl7_build_list <-
  lapply(1:nrow(some_line_list), function(row){
    
    # d = data element (the row, as a list)
    d <- as.list(some_line_list[row,])
    
    build_hl7(
      MSH(SendingFacility = d$facility, ReceivingFacility = 'NSW Health', VersionID = '2.3.1'),
      PID(PatientID = '1', 
          PatientName = PatientNameComponents(familyName = d$firstname, 
                                              givenName = d$lastname), 
          PatientAddress = PatientAddressComponents(streetAddress = d$street, 
                                                    city = d$suburb)),
      OBX(SetID = 1,
          ValueType = 'CE',
          ObservationIdentifier = ObservationIdentifierComponents(identifier = d$test_id,
                                                                  text = d$text_text,
                                                                  nameOfCodingSystem = 'LN'),
          ObservationValue = variedComponents(d$result_code, d$result_text))
    )
  })
```

``` r
hl7_build_list
#> [[1]]
#> MSH|^~\&||Dr Hibbert Medical||NSW Health||||||2.3.1
#> PID||1|||Homer^Simpson||||||742 Evergreen Terrace^^Springfield
#> OBX|1|CE|ncov19^nCoV-2019 PCR^LN||P^Postive
#> 
#> [[2]]
#> MSH|^~\&||Nick Riviera Appartment||NSW Health||||||2.3.1
#> PID||1|||Ned^Flanders||||||744 Evergreen Terrace^^Springfield
#> OBX|1|CE|ncov19^nCoV-2019 PCR^LN||N^Negative
```

``` r
# for filenames 001, 002, etc if necessary
n_leading_zero <- sprintf('%%0%sd', nchar(length(hl7_build_list)))

# Output somewhere
# * note this was used to make fake-covid-*.hl7 used above
for(i in seq_along(hl7_build_list)){ 
  i_leading_zero = sprintf(fmt = n_leading_zero, i)
  filename = sprintf('Some-filename-%s.hl7', i_leading_zero)
  path = file.path('some/path', filename)
  writeLines(hl7_build_list[[i]], con = path)
}
```
