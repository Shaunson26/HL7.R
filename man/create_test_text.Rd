% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_test_text.R
\name{create_test_text}
\alias{create_test_text}
\title{Helper for writing tests}
\usage{
create_test_text(x)
}
\arguments{
\item{x}{list, segment from parsing}
}
\description{
Sneaky way for testing. Flatten a segment element, fix the names to select the list
element (. to $ and trail numbers with [[]]), and create string to use with \code{expect_equal()}.
\code{cat()} the result and paste into test script. An even sneaker thing is to parse
the text and evaluate it. \cr
\cr
zz = create_test_text(segment)\cr
eval(parse(text = zz))\cr
\cr
}
