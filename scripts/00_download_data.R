# 0. Areas to download
download_regions = list(
    CentrFD = "central-fed-district-latest-free",
    Crimea = "crimean-fed-district-latest-free",
    FEFD = "far-eastern-fed-district-latest-free",
    NCFD = "north-caucasus-fed-district-latest-free",
    NWFD = "northwestern-fed-district-latest-free",
    SibFD = "siberian-fed-district-latest-free",
    SouthFD = "south-fed-district-latest-free",
    UFD = "ural-fed-district-latest-free",
    VFD = "volga-fed-district-latest-free",
    Kalin = "kaliningrad-latest-free"
)

# 1. Download zip archive with ESRI shapefile from Geofabrik
for (region in download_regions) {
    curl::curl_download(url = glue("http://download.geofabrik.de/russia/{region}.shp.zip"),
                        destfile = glue("./data/{region}.shp.zip"), 
                        quiet = F)
}

# 2. Unzip downloaded file and remove archives
for (region in download_regions) {
    unzip(zipfile = glue("data/{region}.shp.zip"), exdir = glue("data/{region}"))
    unlink(glue("data/{region}.shp.zip"))
}
