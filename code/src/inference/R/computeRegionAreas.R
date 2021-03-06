#'@title Computes the area of each region
#'
#'@param regsFileName The name of the .csv file defining the regions. It has two columns: \code{ tile, region}. The
#'  first column contains the IDs of each tile in the grid while the second contains the number of a region. This file
#'  is defined by the user and it can be created with any text editor.
#'
#'@param gridFileName The name of the file with the grid parameters. This file could be the one generated by the
#'  simulation software or can be created with any text editor. The grid file generated by the simulation software has
#'  the following columns: \code{Origin X, Origin Y, X Tile Dim, Y Tile Dim, No Tiles X, No Tiles Y}. We are interested
#'  only in the number of rows and columns and the tile size on OX and OY axes. Therefore, the file provided as input to
#'  this function should have at least the following 4 columns: \code{No Tiles X , No Tiles Y, X Tile Dim, Y Tile Dim}.
#'
#'@return A data.table object
#'
#'
#'@import data.table
#'@export
computeRegionAreas<-function(regsFileName, gridFileName) {
    if (!file.exists(gridFileName))
        stop(paste0(gridFileName, " does not exists!"))
    
    gridParams <- readGridParams(gridFileName)    
    
    if (!file.exists(regsFileName))
        stop(paste0(regsFileName, " does not exists!"))
    
    regions <- fread(
        regsFileName,
        sep = ',',
        header = TRUE,
        stringsAsFactors = FALSE
    )
    
    regionAreas.dt <- regions[
            , tileArea_km2 := gridParams$tileX*gridParams$tileY *1e-6][
                , list(regionArea_km2 = sum(tileArea_km2)), by = 'region']
    
    return (regionAreas.dt)
}