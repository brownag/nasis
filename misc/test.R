library(nasis)
dsn <- system.file("extdata", "fetchNASIS_pedons.sqlite", package = "soilDBdata")
d <- nasis(dsn)
d$site
