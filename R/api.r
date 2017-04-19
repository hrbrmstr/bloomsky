mk_time <- function(ts, tz, ofs, dst) {
  as.POSIXct(ts, origin="1970-01-01 00:00:00", tz=tz) + (ofs*3600)
}

#' Retrieve last, current station reading
#'
#' @md
#' @note You need `BLOOMSKY_API_KEY` set in your R environment. You can retrieve that by
#'     going to [http://dashboard.bloomsky.com/](http://dashboard.bloomsky.com/)
#'     and copying the value from "Your API Key" into a value in your local `.Renviron`.
#' @param bsky_api_key the API key for BloomSky
#' @export
#' @examples
#' bsky_get_reading()
bsky_get_reading <- function(bsky_api_key = Sys.getenv("BLOOMSKY_API_KEY")) {

   httr::GET("https://api.bloomsky.com/api/skydata/",
             httr::add_headers("Authorization"=bsky_api_key)) -> res

   httr::stop_for_status(res)

   res <- httr::content(res, as="text")
   res <- jsonlite::fromJSON(res, flatten=TRUE)

   res <- setNames(res, tolower(gsub("Data.", "", colnames(res), fixed=TRUE)))

   res <- mutate(res, registertime = mk_time(registertime, "UTC", utc, dst))
   res <- mutate(res, ts = mk_time(ts, "UTC", utc, dst))
   res <- mutate(res, imagets = mk_time(imagets, "UTC", utc, dst))
   res

}


