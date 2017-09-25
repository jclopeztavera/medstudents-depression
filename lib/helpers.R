loader <- function(...) {
    x <- list(...)
    p <- x[sapply(X = x, FUN = is.character)]
    for (i in 1:length(p)) {
        if (!p[[i]] %in% installed.packages()) {
            install.packages(p[[i]])
        }
        if (p[[i]] %in% installed.packages()) {
            library(p[[i]], character.only = TRUE)
        }
    }
}
