#!/usr/bin/env Rscript

library(purrr)

spec <- sparklyr::spark_default_compilation_spec() %>%
  map(function(x) {
    # update for scala for spark 3
    x$jar_dep <- list.files("internal/xgboost4j_2.12", full.names = TRUE) %>% 
      map_chr(normalizePath)
    x
  }) %>%
  keep(~ .x$spark_version >= "3.0.0")

sparklyr::compile_package_jars(spec = spec)
