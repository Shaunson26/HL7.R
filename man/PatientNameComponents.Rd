% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PID.R
\name{PatientNameComponents}
\alias{PatientNameComponents}
\title{Components of PID PatientName}
\usage{
PatientNameComponents(
  familyName = "",
  givenName = "",
  middleName = "",
  suffix = "",
  prefix = "",
  degree = "",
  nameTypeCode = "",
  nameRepresentationCode = "",
  .sep = "^",
  .trim = TRUE
)
}
\arguments{
\item{familyName}{= "",}

\item{givenName}{= "",}

\item{middleName}{= "",}

\item{suffix}{= "",}

\item{prefix}{= "",}

\item{degree}{= "",}

\item{nameTypeCode}{= "",}

\item{nameRepresentationCode}{=  "",}

\item{.sep}{= "^",}

\item{.trim}{= TRUE}
}
\description{
Function will create a character vector of length 1 with input values separated
with a ^
}
