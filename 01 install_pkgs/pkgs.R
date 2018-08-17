

# https://www.rdocumentation.org/packages/tools/versions/3.5.1/topics/package_dependencies
# https://www.r-bloggers.com/installing-packages-without-internet/

dir <- "U:/99 workspace/dwn_pkgs_R"

getDependencies <- function(packs){
  dependencyNames <- unlist(
    tools::package_dependencies(packages = packs, db = available.packages(), 
                                which = c("Depends", "Imports"),
                                recursive = TRUE))
  packageNames <- union(packs, dependencyNames)
  packageNames
}

# Calculate dependencies
packages <- getDependencies(c("tidyverse", "mangoTraining"))

# Download package files
setwd(dir)
download.packages(pkgs = packages, destdir = getwd(), type = "source")

# Install packages
setwd(dir)
install.packages(list.files(pattern="*.tar.gz"), repos=NULL, type= 'source')