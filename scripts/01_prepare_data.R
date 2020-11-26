# list all downloaded shp files
shp_files <- list.files(
    path = "data", pattern = "\\.shp$",
    recursive = T, full.names = T
)

# get only places as points
# omit places_a which is polygons
places_points <- shp_files[grepl(pattern = "places_free", x = shp_files)] 

# load this into R
# TODO do it in more eddicient way
all_places_points <- st_sfc(crs = 4326)
for (i in seq_along(places_points)) {
    tmp_places_points <- sf::read_sf(places_points[i])
    tmp_places_points <- subset(
        x = tmp_places_points,
        subset = !fclass %in% c("farm", "locality", "suburb")
    )
    all_places_points <- rbind(all_places_points, tmp_places_points)
}

# save result file as RDS - very efficient R way to store data
saveRDS(
    object = all_places_points,
    file = "data/all_places_points.rds"
)