State Comparisons
========================================================
author: Dann Hekman
date: 2015-09-06

Data Source
========================================================
Using 1970s census data, this Shiny app gives an interactive comparison of states on several social and economic metrics.

Data come from R's [Datasets](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html) package, and can be accessed on any machine with R using the `data` command.

```r
data(state)
```

Available Features
========================================================
For all available metrics, this shiny app will display both a shaded heatmap of the United States and a histogram of the distribution of that matric.  

Using the drop-down menus, you can change the region of interest and colors of the charts.  

Using the radio buttons, you can change which social or economic variable you are comparing across states.

Available Metrics
========================================================
The following variables are available for comparison:  

 - Density (Population/Area)
 - Population
 - Income Per Capita
 - Life Expectancy at Birth
 - Murder Rate (count per 100,000)
 - High School Graduation Rate (%)
 - Literacy Rate (%)

Getting and Using this App
========================================================
The State Comparisons application can be accessed in two ways:  

1. Shinyapp.io
2. Download from github: https://github.com/dannhek/CourseraDatSci_DataProd_Proj and launch from within RStudio



References
========================================================
 - Further Description of Data: [CRAN](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/state.html)
 - This app was developed as a project within the Coursera Data Science Specialization Data Products course. More information about Coursera, the Data Science Specialization, and its teachers can be found on the [Coursera Website](https://www.coursera.org/specializations/jhudatascience)
 - Developing Shiny Apps: http://shiny.rstudio.com/