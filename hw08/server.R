# http://www.gapminder.org/data/
# Data: Aged 25-54 unemployment rate (%)
library(DT)
library(tidyverse)
library(readxl)
library(reshape2)
library(RColorBrewer)

unemploy_data_filtered <- read.delim("Data/indicator_25-54_unemploy_formatted.txt", header=TRUE)
cols <- colorRampPalette(brewer.pal(9, "Set1"))
ngroups <- length(unique(unemploy_data_filtered$Country))

server <- function(input, output) {
	## histogram
  filtered_UNE <- reactive({   
    unemploy_data_filtered %>%
      filter(Year >= input$yearIn[1],
             Year <= input$yearIn[2]) %>%
      
      ggplot() + aes(x = Unemployment.Rate) + 
      geom_histogram(aes(fill=Country),binwidth = 0.3) +
  		ggtitle("Distribution of Unemployment Rate (%)") +
  		scale_fill_manual(values = cols(ngroups))
  })
  output$Hist_Unemployment.Rate <- renderPlot({
    filtered_UNE() 
  })
  
  ## filtered data
  thedata <- reactive(unemploy_data_filtered2 <- unemploy_data_filtered %>%
  											filter(Year >= input$yearIn[1],
  														 Year <= input$yearIn[2]))
  
  output$table_head <- DT::renderDataTable({
  	thedata()
  })
	
  ## button to download data
  output$download <- downloadHandler(
  	filename = function(){"results.csv"}, 
  	content = function(fname){
  		write.csv2(thedata(), fname, quote=FALSE, row.names=FALSE)
  	})
  
  ## insert url link from which the data was downloaded
  url <- a("Gapminder World demographic databases",href="https://www.gapminder.org/data/")
  output$tab <- renderUI({
  	tagList("Link to dataset used for this app:", url)
})
}
