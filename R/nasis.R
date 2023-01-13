#' @rdname nasis
#' @keywords internal
"_PACKAGE"

#' @description The function `nasis()` provides a wrapper for passing [soilDB::NASIS()]-like `DBIConnection` to [dm::dm_from_con()] to create a `dm` object.
#'
#' @param dsn A `DBIConnection` or path to SQLite database. Default (`NULL`) is equivalent to `soilDB::NASIS()`
#' @param ... Additional arguments to [dm::dm_from_con()]
#'
#' @return A `DBIConnection`
#'
#' @export
#' @importFrom dm dm_from_con
nasis <- function(dsn = NULL, ...) {

  if (is.null(dsn) || is.character(dsn)) {
    if (requireNamespace("soilDB")) {
      dsn <- soilDB::NASIS(dsn = dsn)
    } else {
      stop("{nasis}: package 'soilDB' is required to create a NASIS connection")
    }
  }

  if (!inherits(dsn, 'DBIConnection')) {
    stop("{nasis}: `dsn` should be a DBIConnection or path to SQLite file", call. = FALSE)
  }

  if (!requireNamespace("dbplyr")) {
    stop("{nasis}: package 'dbplyr' is required to use dm::rows_* functions")
  }

  dm::dm_from_con(con = dsn, ...)
}

