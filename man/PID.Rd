% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PID.R
\name{PID}
\alias{PID}
\title{Segment PID: Patient identification}
\usage{
PID(
  SetID = "",
  PatientID = "",
  PatientIdentifierList = "",
  AlternatePatientIDPID = "",
  PatientName = PatientNameComponents(),
  MothersMaidenName = "",
  DateTimeOfBirth = "",
  Sex = "",
  PatientAlias = "",
  Race = "",
  PatientAddress = PatientAddressComponents(),
  CountyCode = "",
  PhoneNumberHome = PhoneNumberComponents(),
  PhoneNumberBusiness = PhoneNumberComponents(),
  PrimaryLanguage = "",
  MaritalStatus = "",
  Religion = "",
  PatientAccountNumber = "",
  SSNNumberPatient = "",
  DriversLicenseNumberPatient = "",
  MothersIdentifier = "",
  EthnicGroup = "",
  BirthPlace = "",
  MultipleBirthIndicator = "",
  BirthOrder = "",
  Citizenship = "",
  VeteransMilitaryStatus = "",
  Nationality = "",
  PatientDeathDateandTime = "",
  PatientDeathIndicator = "",
  IdentityReliabilityCode = "",
  IdentityUnknownIndicator = "",
  LastUpdateDateTime = "",
  LastUpdateFacility = "",
  SpeciesCode = "",
  BreedCode = "",
  Strain = "",
  ProductionClassCode = "",
  .version = c("2.3.1", "2.4"),
  .FieldSeparator = "|",
  .trim = TRUE
)
}
\arguments{
\item{SetID}{= "",}

\item{PatientID}{= "",}

\item{PatientIdentifierList}{= "",}

\item{AlternatePatientIDPID}{= "",}

\item{PatientName}{= PatientNameComponents(),}

\item{MothersMaidenName}{= "",}

\item{DateTimeOfBirth}{= "",}

\item{Sex}{= "",}

\item{PatientAlias}{= "",}

\item{Race}{= "",}

\item{PatientAddress}{= PatientAddressComponents(),}

\item{CountyCode}{= "",}

\item{PhoneNumberHome}{= PhoneNumberComponents(),}

\item{PhoneNumberBusiness}{= PhoneNumberComponents(),}

\item{PrimaryLanguage}{= "",}

\item{MaritalStatus}{= "",}

\item{Religion}{= "",}

\item{PatientAccountNumber}{= "",}

\item{SSNNumberPatient}{= "",}

\item{DriversLicenseNumberPatient}{= "",}

\item{MothersIdentifier}{= "",}

\item{EthnicGroup}{= "",}

\item{BirthPlace}{= "",}

\item{MultipleBirthIndicator}{= "",}

\item{BirthOrder}{= "",}

\item{Citizenship}{= "",}

\item{VeteransMilitaryStatus}{= "",}

\item{Nationality}{= "",}

\item{PatientDeathDateandTime}{= "",}

\item{PatientDeathIndicator}{= "",}

\item{IdentityReliabilityCode}{= "",}

\item{IdentityUnknownIndicator}{= "",}

\item{LastUpdateDateTime}{= "",}

\item{LastUpdateFacility}{= "",}

\item{SpeciesCode}{= "",}

\item{BreedCode}{= "",}

\item{Strain}{= "",}

\item{ProductionClassCode}{= "",}

\item{.version}{= c("2.3.1", "2.4"),}

\item{.FieldSeparator}{= '|',}

\item{.trim}{= TRUE}
}
\description{
Convert input to a PID segment for HL7 2.3.1. Outputs a character vector of
length 1 with input values pipe delimited. Below function definition are helper
functions for particular fields: PatientNameComponents, PatientAddressComponents,
PhoneNumberComponents
}
