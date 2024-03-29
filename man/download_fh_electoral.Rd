% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/download_functions.R
\name{download_fh_electoral}
\alias{download_fh_electoral}
\alias{fh_electoral}
\title{Freedom House Electoral Democracies List}
\source{
The "Freedom in the World" dataset from Freedom House, updated to
2022 (Freedom in the World report 2023 edition). Original data and
methodology is available at
\url{https://freedomhouse.org/report/freedom-world}
}
\usage{
download_fh_electoral(verbose = TRUE, return_raw = FALSE, ...)
}
\arguments{
\item{verbose}{Whether to print a running commentary of what the function is
doing while processing the data.}

\item{return_raw}{Whether to return the raw data, without any processing.
Default is \code{FALSE}.}

\item{...}{Other parameters passed to \link{country_year_coder}.}
}
\value{
A time-series tidy version of the FH electoral democracies dataset,
with the following variables:
\itemize{
\item country: The original country name.
\item year: The calendar year. This is approximate. The surveys cover specific
periods in the original data that do not always overlap with a single year.
In particular, the year 1981 is "skipped" -- a single survey covers Jan.
1981 - Aug. 1982 and its value is assigned to 1982 here. Freedom House did
not appear to issue a list of electoral democracies in its 2021 Freedom in
the World report, so the year 2020 is not available; but there is a list of
electoral democracies for the 2022 report, so the year 2021 is available.
2020 is thus "skipped". (It is in principle possible to reconstruct the
list of electoral democracies using the full FH data, but the methodology
is a little opaque).
\item electoral: Electoral democracy indicator. \code{TRUE} = yes, \code{FALSE}
= no.
}
}
\description{
Downloads the 2023 update of the Freedom House Electoral Democracies list and
processes it using \link{country_year_coder}. The original data is available at
\url{https://freedomhouse.org/report/freedom-world},
spread over a number of different urls.
}
\section{Standard descriptive variables (generated by this package)}{

\describe{

\item{extended_country_name}{The name of the country in the Gleditsch-Ward
system of states, or the official name of the
entity (for non-sovereign entities and states not in the Gleditsch and Ward
system of states) or else a common name for disputed cases that do not have
an official name (e.g., Western Sahara, Hyderabad). The Gleditsch and Ward
scheme sometimes indicates the common name of the country and (in
parentheses) the name of an earlier incarnation of the state: thus, they
have Germany (Prussia), Russia (Soviet Union), Madagascar (Malagasy), etc.
For details, see Gleditsch, Kristian S. & Michael D. Ward. 1999. "Interstate
System Membership: A Revised List of the Independent States since 1816."
International Interactions 25: 393-413. The list can be found at
\url{http://privatewww.essex.ac.uk/~ksg/statelist.html}.}

\item{GWn}{Gleditsch and Ward's numeric country code, from the Gleditsch and
Ward list of independent states.}

\item{cown}{The Correlates of War numeric country code, 2016 version. This
differs from Gleditsch and Ward's numeric country code in a few cases. See
\url{http://www.correlatesofwar.org/data-sets/state-system-membership} for
the full list.}

\item{in_GW_system}{Whether the state is "in system" (that is, is
independent and sovereign), according to Gleditsch and Ward, for this
particular date. Matches at the end of the year; so, for example South
Vietnam 1975 is \code{FALSE} because, according to Gleditsch and Ward, the
country ended on April 1975 (being absorbed by North Vietnam). It is also
\code{TRUE} for dates beyond 2012 for countries that did not end by then, depsite
the fact that the Gleditsch and Ward list has not been updated since.} }
}

\section{Note}{


The datasets downloaded by the \verb{download_*} family of functions are not
directly available in this package. You will always need to directly
download them in order to use them.
}

\examples{
\dontrun{
fh <- download_fh_electoral()
fh
}
}
\seealso{
Other democracy: 
\code{\link{LIED}},
\code{\link{PIPE}},
\code{\link{REIGN}},
\code{\link{anckar}},
\code{\link{anrr}},
\code{\link{arat_pmm}},
\code{\link{blm}},
\code{\link{bmr}},
\code{\link{bnr}},
\code{\link{bollen_pmm}},
\code{\link{bti}},
\code{\link{doorenspleet}},
\code{\link{download_fh_full}()},
\code{\link{download_fh}()},
\code{\link{download_wgi_voice_and_accountability}()},
\code{\link{eiu}},
\code{\link{extended_uds}},
\code{\link{fh_pmm}},
\code{\link{gwf_all}},
\code{\link{hadenius_pmm}},
\code{\link{kailitz}},
\code{\link{magaloni}},
\code{\link{mainwaring}},
\code{\link{munck_pmm}},
\code{\link{pacl_update}},
\code{\link{pacl}},
\code{\link{peps}},
\code{\link{pitf}},
\code{\link{polityIV}},
\code{\link{polity_pmm}},
\code{\link{polyarchy_dimensions}},
\code{\link{polyarchy}},
\code{\link{prc_gasiorowski}},
\code{\link{svmdi}},
\code{\link{svolik_regime}},
\code{\link{uds_2014}},
\code{\link{ulfelder}},
\code{\link{utip}},
\code{\link{vanhanen}},
\code{\link{vdem_simple}},
\code{\link{wahman_teorell_hadenius}}

Other Freedom House: 
\code{\link{download_fh_full}()},
\code{\link{download_fh}()},
\code{\link{fh_pmm}}

Other ordinal democracy indexes: 
\code{\link{download_fh_full}()},
\code{\link{download_fh}()},
\code{\link{fh_pmm}},
\code{\link{polityIV}},
\code{\link{polity_pmm}}
}
\concept{Freedom House}
\concept{democracy}
\concept{ordinal democracy indexes}
