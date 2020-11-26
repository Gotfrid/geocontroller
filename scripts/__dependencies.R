# define dependencies and detect missing ones
message("CHECK DEPENDENCIES")
pkgs <- installed.packages()[, "Package"]
deps <- c("curl", "glue", "sf", "leaflet")
if (length(deps[!deps %in% pkgs]) > 0) {
    install.packages(deps[!deps %in% pkgs])
}

# load libraries
message("LOADING LIBRARIES")
suppressMessages({
    library(curl)
    library(glue)
    library(sf)
    library(leaflet)
})