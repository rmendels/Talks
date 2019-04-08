#' Map satellite data along track
#'
#' \code{track_plot} plots satellite data along the track
#' @export
#' @param track_df - dataframe combining track and satellite data
#'                   outout of `track_frame_merge()`
#' @param param - character string with the name of the parameter
#' @param title - character string with title for map
#' @param myColor - valid R color palette,  default cmocean$algae
#' @return - ggplot graphic
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
#' track_plot(track_df, "Chla", title = "Mean Chla along track")
#
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
#'

track_plot <- function(track_df, param, title = "mean of satellite data",
                       myColor = cmocean$algae) {
  ymin <- min(track_df$latitude, na.rm = TRUE) - 1.
  ymax <- max(track_df$latitude, na.rm = TRUE) + 1.
  xmin <- min(track_df$longitude, na.rm = TRUE) - 1.
  xmax <- max(track_df$longitude, na.rm = TRUE) + 1.
  ylim <- c(ymin, ymax)
  xlim <- c(xmin, xmax)
  # get outline data for map
  w <- maps::map("world", xlim = xlim, ylim = ylim,
           fill = TRUE, plot = FALSE)
  w <- ggplot2::map_data(w, ylim = ylim, xlim = xlim)
  # plot using ggplot
  myColor <- cmocean$algae
  z <- ggplot2::ggplot(track_df, ggplot2::aes(x = longitude, y = latitude)) +
    ggplot2::geom_point(ggplot2::aes(colour = mean, shape = factor(missing)), size = 2.) +
    ggplot2::scale_shape_manual(values = c(19, 1))
  z + ggplot2::geom_polygon(data = w, ggplot2::aes(x = long, y = lat, group = group),
                            fill = "grey80") +
    ggplot2::theme_bw() +
    ggplot2::scale_colour_gradientn(colours = myColor, limits = c(0., 0.32), param) +
    ggplot2::coord_fixed(1.3, xlim = xlim, ylim = ylim) +
    ggplot2::ggtitle(title)
}
