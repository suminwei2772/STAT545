library(readxl)
unemploy_data <- readxl::read_xlsx("Data/indicator_25-54_unemploy.xlsx", sheet="Data")
unemploy_data_filtered <- unemploy_data %>% 
  melt("Total 25-54 unemployment (%)") %>%
  na.omit()
colnames(unemploy_data_filtered) <- c("Country","Year","Unemployment.Rate")
unemploy_data_filtered$Year <- as.numeric(as.vector(unemploy_data_filtered$Year))
write.table(unemploy_data_filtered, "Data/indicator_25-54_unemploy_formatted.txt", quote=FALSE, sep="\t", row.names=FALSE)
