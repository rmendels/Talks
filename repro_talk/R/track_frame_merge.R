#' Combine track data with downloaded environmental track
#'
#' \code{track_frame_merge} Merges the original track dataframe
#' with the data from rxtracto()
#' @export
#' @param track_lon - longitude of track data
#' @param track_lat - latitude of track data
#' @param track_time - time of track data
#' @param sat_data - return from rxtracto()
#' @return - dataframe with elements
#' \itemize{
#'   \item merged_df$mean - mean from download
#'   \item merged_df$longitude - the longitudes of the track positions
#'   \item merged_df$latitude - the latitudes of the track positions
#'   \item merged_df$time - the times of the track positions
#'   \item merged_df$missing - positions with no satellite data
#'   }
#' @examples
#' urlbase <- 'https://upwell.pfeg.noaa.gov/erddap'
#' dataInfo <- rerddap::info('erdMBsstd8day')
#' parameter <- 'sst'
#' xcoord <- c(230, 231)
#' ycoord <- c(40, 41)
#' tcoord <- c('2006-01-15', '2006-01-20')
#' zcoord <- c(0., 0.)
#' xlen <- 0.5
#' ylen <- 0.5
#' extract <- rxtracto(dataInfo, parameter = parameter, xcoord = xcoord,
#'                     ycoord = ycoord, tcoord= tcoord, zcoord = zcoord,
#'                     xlen = xlen, ylen = ylen)
#' merged_df <- track_frame_merge(xcoord, ycoord, tcoord, extract)
#' \donttest{
#' # phony code just to show donttest
#' xpos <- c(230, 231)
#' ypos <- c(40, 41)
#' tpos <- c('2006-05-05', '2006-05-06')
#' extract <- xtracto_3D('erdMBsstd8day', xpos, ypos, tpos = tpos, verbose=TRUE)
#' }
#' @details Details:
#' @section A section of the Details
#' @section More details
#' @references https://upwell.pfeg.noaa.gov/erddap/rest.html
#' @author Roy Mendelssohn <roy.mendelssohn@noaa.gov>

track_frame_merge <- function(track_lon, track_lat, track_time, sat_data) {
  sat_missing <- is.na(sat_data[[1]]) * 1
  ind <- which(track_lon > 180)
  track_lon[ind] <- track_lon[ind] - 360
  merged_df <- data.frame(mean = sat_data[[1]], longitude = track_lon,
                          latitude = track_lat,
                          time = track_time,
                          missing = sat_missing)
  merged_df
}
