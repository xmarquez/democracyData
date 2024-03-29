% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_documentation.R
\docType{data}
\name{blm}
\alias{blm}
\alias{blm_pmm}
\title{The Bowman, Lehoucq, and Mahoney index of democracy for Central America}
\format{
An object of class \code{tbl_df} (inherits from \code{tbl}, \code{data.frame}) with 505 rows and 7 columns.

An object of class \code{tbl_df} (inherits from \code{tbl}, \code{data.frame}) with 275 rows and 7 columns.
}
\source{
K. Bowman, F. Lehoucq, and J. Mahoney. "Measuring Political Democracy: Case Expertise, Data Adequacy, and Central America". In: \emph{Comparative Political Studies} 38.8 (2005), pp. 939-970. DOI: 10.1177/0010414005277083. Data used to be available at
\url{http://www.blmdemocracy.gatech.edu/}.
}
\usage{
blm

blm_pmm
}
\description{
Contains the trichotomous measure of regime type from K. Bowman, F. Lehoucq, and J. Mahoney. "Measuring Political Democracy: Case Expertise, Data Adequacy, and Central America". In: \emph{Comparative Political Studies} 38.8 (2005), pp. 939-970. DOI: 10.1177/0010414005277083.
\url{http://cps.sagepub.com/content/38/8/939}. Data used to be available at
\url{http://www.blmdemocracy.gatech.edu/}.
}
\section{Variables}{


\describe{

\item{year}{The calendar year.}

\item{blm_country}{The country name, as in the original dataset. Use
\code{country_name} instead. Available only for five Latin American
countries (Costa Rica, El Salvador, Guatemala, Honduras and Nicaragua) from
1900 to 2000.}

\item{blm}{Trichotomous index of democracy. 0 = authoritarian, 0.5 =
semidemocratic, 1 = democratic. Available only for five Latin American
countries (Costa Rica, El Salvador, Guatemala, Honduras and Nicaragua) from
1900 to 2000.} }
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


The \code{blm_pmm} version of this data is taken from D. Pemstein, S. A. Meserve, and J. Melton. \emph{Replication data for: Democratic Compromise: A Latent Variable Analysis of Ten Measures of Regime Type}. 2013. \url{http://hdl.handle.net/1902.1/PMM}. The
original dataset is found in \link{blm}. The \code{blm_pmm} data only goes back to
1946, but is otherwise identical to the \link{blm} data. It is included here for
completeness.
}

\seealso{
Other democracy: 
\code{\link{LIED}},
\code{\link{PIPE}},
\code{\link{REIGN}},
\code{\link{anckar}},
\code{\link{anrr}},
\code{\link{arat_pmm}},
\code{\link{bmr}},
\code{\link{bnr}},
\code{\link{bollen_pmm}},
\code{\link{bti}},
\code{\link{doorenspleet}},
\code{\link{download_fh_electoral}()},
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

Other PMM replication data: 
\code{\link{arat_pmm}},
\code{\link{bollen_pmm}},
\code{\link{fh_pmm}},
\code{\link{hadenius_pmm}},
\code{\link{mainwaring}},
\code{\link{munck_pmm}},
\code{\link{pacl}},
\code{\link{polity_pmm}},
\code{\link{prc_gasiorowski}}

Other regional democracy indexes: 
\code{\link{mainwaring}}

Other trichotomous democracy indexes: 
\code{\link{kailitz}},
\code{\link{mainwaring}},
\code{\link{prc_gasiorowski}},
\code{\link{utip}}
}
\concept{PMM replication data}
\concept{democracy}
\concept{regional democracy indexes}
\concept{trichotomous democracy indexes}
\keyword{datasets}
