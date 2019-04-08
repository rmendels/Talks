#' swchl Data
#'
#' pre-Download of swchl
#'
#'
#' obtained using the `rerddapXtracto` command
#' tagData <- Marlintag38606
#' xpos <- tagData$lon
#' ypos <- tagData$lat
#' tpos <- tagData$date
#' zpos <- rep(0., length(xpos))
#' urlbase <- 'http://upwell.pfeg.noaa.gov/erddap'
#' swchlInfo <- rerddap::info('erdSWchla8day')
#' swchl <- rerddapXtracto::rxtracto(
#'   swchlInfo,
#'   parameter = 'chlorophyll',
#'   xcoord = xpos,
#'   ycoord = ypos,
#'   tcoord = tpos,
#'   zcoord = zpos,
#'   xlen = .2,
#'   ylen = .2
#' )
"swchl"
