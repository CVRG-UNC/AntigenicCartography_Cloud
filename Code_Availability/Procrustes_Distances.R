#Load RacMacs
library(Racmacs)

#Load Maps for Procrustes comparison
Map1 <- readRDS("path/to/Map1.rds")
Map2 <- readRDS("path/to/Map2.rds")

#Run Procrustes comparison (run multiple optimizations as replicates)
Map1_vs_Map2 <- procrustesMap(
  map                            = Map1,
  comparison_map                 = Map2,
  optimization_number            = 1,
  comparison_optimization_number = 1
)
view(Map1_vs_Map2)

#Plot with x/y scaling (change X-Y values as needed)
plot(Map1_vs_Map2, xlim = c(-4, 4), ylim = c(-4, 4))

#Map dimension testing
dimensionTestMap(
  map,
  dimensions_to_test = 1:5,
  test_proportion = 0.1,
  minimum_column_basis = "none",
  fixed_column_bases = rep(NA, numSera(map)),
  number_of_optimizations = 1000,
  replicates_per_dimension = 100,
  options = list()
)

#Plot Map Distances vs. Table Distances
plot_map_table_distance(
  map,
  optimization_number = 1,
  xlim,
  ylim,
  line_of_equality = TRUE
)

#Return CSV file of Map distances
MapDis <- mapDistances(map, optimization_number = 1)
write.csv(MapDis, file = "map*.csv")

#Return CSV file of Table distances
TableDis <- tableDistances(map, optimization_number = 1)
write.csv(TableDis, file = "map*.csv")