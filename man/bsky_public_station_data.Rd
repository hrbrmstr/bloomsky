% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bloomsky.r
\name{bsky_public_station_data}
\alias{bsky_public_station_data}
\title{Retrieve current reading from a single (public) BloomSky station}
\usage{
bsky_public_station_data(station_hash)
}
\arguments{
\item{station_hash}{hashed station id}
}
\value{
\code{data_frame} of the current reading with a nested list column of short-term forecast
}
\description{
So far, it looks like \code{temp} is in Celsius, \code{pressure} is in millibars
}
\examples{
wx_dat <- bsky_station_data("gqBxp6apnJSnmpym")
}
