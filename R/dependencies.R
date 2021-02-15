spark_dependencies <- function(spark_version, scala_version, ...) {
  #if (spark_version > "2.4") 
  spark_version <- "3.0"

  #https://repo1.maven.org/maven2/ml/dmlc/xgboost4j_2.12/1.3.1/xgboost4j_2.12-1.3.1.jar
  # path to latest
  sparklyr::spark_dependency(
    jars = c(
      system.file(
        sprintf("java/sparkxgb-%s-%s.jar", spark_version, scala_version),
        package = "sparkxgb"
      )
    ),
    packages = "ml.dmlc:xgboost4j_2.12:1.3.1",
    repositories = "https://central.maven.porg/maven2/"
  )
}

#' @import sparklyr
.onLoad <- function(libname, pkgname) {
  sparklyr::register_extension(pkgname)
}
