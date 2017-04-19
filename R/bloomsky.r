#' Retrieve current reading from a single (public) BloomSky station
#'
#' So far, it looks like `temp` is in Celsius, `pressure` is in millibars
#'
#' @md
#' @param station_hash hashed station id
#' @return `data_frame` of the current reading with a nested list column of short-term forecast
#' @export
#' @examples
#' wx_dat <- bsky_station_data("gqBxp6apnJSnmpym")
bsky_public_station_data <- function(station_hash) {

  httr::POST(
    url = "http://map.bloomsky.com/data/device/",
    httr::add_headers(
      Origin = "http://map.bloomsky.com",
      Referer = sprintf("http://map.bloomsky.com/weather-stations/%s", station_hash)),
    body = list(type="ONE", hashedID=station_hash), encode = "json"
  ) -> res

  httr::stop_for_status(res)

  res <- httr::content(res, as="text")
  res <- jsonlite::fromJSON(res, flatten=TRUE)

  res[setdiff(names(res), "forecast")] %>%
    flatten_df() %>%
    mutate(timestamp = as.POSIXct(timestamp, origin="1970-01-01", tz="GMT")) -> wx_df

  mutate(wx_df, forecast = list(res$forecast))

}



