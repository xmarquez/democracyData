% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{count_sequence_breaks}
\alias{count_sequence_breaks}
\title{Count sequence breaks}
\usage{
count_sequence_breaks(seq, seq_step = 1)
}
\arguments{
\item{seq}{A numeric sequence}

\item{seq_step}{The expected difference between steps in sequence}
}
\value{
A numeric vector with the sequence groups
}
\description{
This is a utility function that is useful when plotting countries that have
interrupted periods.
}
\examples{
library(dplyr)
count_sequence_breaks(c(1900:1910, 1920:1930))

# This is how I typically use it

polityIV \%>\%
group_by(polityIV_country, polityIV_ccode) \%>\%
mutate(groups = count_sequence_breaks(year)) \%>\%
filter(any(groups > 1))

}
