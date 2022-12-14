% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BHS.R
\name{BHS}
\alias{BHS}
\title{Segment BHS - Batch Header Segment}
\usage{
BHS(
  BHS.1_BatchFieldSeparator = "|",
  BHS.2_BatchEncodingCharacters = "",
  BHS.3_BatchSendingApplication = "",
  BHS.4_BatchSendingFacility = "",
  BHS.5_BatchReceivingApplication = "",
  BHS.6_BatchReceivingFacility = "",
  BHS.7_BatchCreationDateTime = "",
  BHS.8_BatchSecurity = "",
  BHS.9_BatchNameIDType = "",
  BHS.10_BatchComment = "",
  BHS.11_BatchControlID = "",
  BHS.12_ReferenceBatchControlID = "",
  .version = c("2.3.1", "2.4"),
  .trim = TRUE
)
}
\arguments{
\item{BHS.1_BatchFieldSeparator}{= "|",}

\item{BHS.2_BatchEncodingCharacters}{= "",}

\item{BHS.3_BatchSendingApplication}{= "",}

\item{BHS.4_BatchSendingFacility}{= "",}

\item{BHS.5_BatchReceivingApplication}{= "",}

\item{BHS.6_BatchReceivingFacility}{= "",}

\item{BHS.7_BatchCreationDateTime}{= "",}

\item{BHS.8_BatchSecurity}{= "",}

\item{BHS.9_BatchNameIDType}{= "",}

\item{BHS.10_BatchComment}{= "",}

\item{BHS.11_BatchControlID}{= "",}

\item{BHS.12_ReferenceBatchControlID}{= ""}

\item{.version}{= c("2.3.1", "2.4"),}

\item{.trim}{= TRUE}
}
\value{
character vector
}
\description{
Convert input to a BHS segment for HL7 2.3.1 or 2.4. Outputs a character vector of
length 1 with input values pipe delimited.
}
