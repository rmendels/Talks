% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/track_frame_merge.R
\name{track_frame_merge}
\alias{track_frame_merge}
\title{Combine track data with downloaded environmental track}
\usage{
track_frame_merge(track_lon, track_lat, track_time, sat_data)
}
\arguments{
\item{track_lon}{- longitude of track data}

\item{track_lat}{- latitude of track data}

\item{track_time}{- time of track data}

\item{sat_data}{- return from rxtracto()}
}
\value{
- dataframe with elements
\itemize{
  \item merged_df$mean - mean from download
  \item merged_df$longitude - the longitudes of the track positions
  \item merged_df$latitude - the latitudes of the track positions
  \item merged_df$time - the times of the track positions
  \item merged_df$missing - positions with no satellite data
  }
}
\description{
\code{track_frame_merge} Merges the original track dataframe
with the data from rxtracto()
}
\details{
Details:
}
\section{A section of the Details}{
NA
}

\section{More details}{
NA
}

\examples{
urlbase <- 'https://upwell.pfeg.noaa.gov/erddap'
dataInfo <- rerddap::info('erdMBsstd8day')
parameter <- 'sst'
xcoord <- c(230, 231)
ycoord <- c(40, 41)
tcoord <- c('2006-01-15', '2006-01-20')
zcoord <- c(0., 0.)
xlen <- 0.5
ylen <- 0.5
extract <- rxtracto(dataInfo, parameter = parameter, xcoord = xcoord,
                    ycoord = ycoord, tcoord= tcoord, zcoord = zcoord,
                    xlen = xlen, ylen = ylen)
merged_df <- track_frame_merge(xcoord, ycoord, tcoord, extract)
\donttest{
# phony code just to show donttest
xpos <- c(230, 231)
ypos <- c(40, 41)
tpos <- c('2006-05-05', '2006-05-06')
extract <- xtracto_3D('erdMBsstd8day', xpos, ypos, tpos = tpos, verbose=TRUE)
}
}
\references{
https://upwell.pfeg.noaa.gov/erddap/rest.html
}
\author{
Roy Mendelssohn <roy.mendelssohn@noaa.gov>
}
