library(tidyverse)
library(reshape2)
library(DT)
ui <- fluidPage(
	img(src="gapminder_logo.png", width="60%"), 
	# Application title
	titlePanel("Distribution of Unemployment Rates - Age 25-54"),  
	uiOutput("tab"),
	br(),
	br(),
	sidebarPanel("Please select the range of years",
							 sliderInput("yearIn","Year", min=1981, max=2005, value=c(1999,2005), sep = "")),
	
	mainPanel(
		plotOutput("Hist_Unemployment.Rate"), 
		br(), br(),
		downloadButton('download',"Download the results table"),
		DT::dataTableOutput("table_head"))
	
) 






