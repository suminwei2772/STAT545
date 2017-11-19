This Shiny app is deployed on shinyapps.io: https://suminwei.shinyapps.io/gapminder_unemployment_rate/

The app shows data taken from [Gapminder World demographic databases](https://www.gapminder.org/data/).
Specifically, I downloaded the xlsx file for "Aged 25-54 unemployment rate (%)" as provided by the Interational Labour Organization.

Then, I re-formatted the file using `reshape2` to get the unemployment rate for each country at each year. This reformatted file is the one I used for the Shiny app.

The Shiny app contains several features:

1. Add an image of the BC Liquor Store to the UI.
Hint: Place the image in a folder named www, and use img(src = "imagename.png") to add the image.

2. Contains a link to the source data [Gapminder World demographic databases](https://www.gapminder.org/data/).

3. Use the DT package to turn the current results table into an interactive table. First, I installed the DT package, and used DT::dataTableOutput() and DT::renderDataTable(). This allows the user to to the following:
	* Search for the Country or Year and filter the table according to those searches
	* Choose number of entries to show for the table

4. Allow the user to download the results table as a .csv file. I added this feature using the `downloadButton()` and `downloadHandler()` functions (I made sure the data to be downloaded was an interactive object).

5. This histogram is also interactive. The proportions of each colour for each bar in the graph is determined by the number of entries from each country from the selected year span falling within that specific bin.

6. Sidebar contains a sliding panel to choose the range of years the viewer wants to look at.


