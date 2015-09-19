library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
     
     # Application title
     titlePanel("State-by-State Comparisons using 1970 Census Data"),
     
     # Sidebar with a slider input for the number of bins
     sidebarLayout(
          sidebarPanel(
               selectInput("division","Which Region?",
                           choices = c("All"=0,
                                       "New England"=1,
                                       "Middle Atlantic"=2, 
                                       "South Atlantic"=3, 
                                       "East South Central"=4, 
                                       "West South Central"=5, 
                                       "East North Central"=6, 
                                       "West North Central"=7, 
                                       "Mountain"=8,
                                       "Pacific"=9)
               ),
               
               selectInput("color","Color Palette?",
                           choices = c("Red"="red",
                                       "Blue"="blue",
                                       "Green"="green",
                                       "Gray"="gray")
               ),
               
               radioButtons("display","Variable to Display",
                            c("Density"            = "density",
                              "Population"         = "population",
                              "Income Per Capita"  = "income",
                              "Life Expectancy"    = "life_expectancy",
                              "Murder Rate"        = "murder",
                              "HS Graduation Rate" = "hs_grad_rate",
                              "Literacy Rate"      = "literacy")
               ),
               
               submitButton("Update View")
               
          ),
          #Show a plot of the generated distribution
          mainPanel(
               tabsetPanel(
                    tabPanel(p("Display"),
                             tableOutput("debug"),
                             h2("Map"),
                             plotOutput("mainMap"),
                             h2("Distribution"),
                             plotOutput("hist")
                    ),
                    tabPanel(p("About"),
                             h2("How to Use this App"),
                             p("Using this app is simple. Just select which variable you'd like to display by selecting that radio button and click 'Update View'"),
                             p("You can also change the colors used in the displays and change the region you'd like to zoom in on by using the dropdown menus above the radio buttons"),
                             h2("About the Data Source"),
                             p("This app uses data from the US Census Bureau's 1970 Census"),
                             p("The data are available through the CRAN Datasets package, with documentation available",
                               a("here.", href="https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/state.html")),
                             h2("About this App"),
                             p("This app was created as part of Coursera's Data Science Specialization, for the Data Products course."),
                             p("Source code is available at", a("Github.",href="https://github.com/dannhek/CourseraDatSci_DataProd_Proj")),
                             p("A presentation describing the features of this app is available at", a("Rpubs.", href="http://rpubs.com/tattooed_economist/110141"))
                    )
               )
          )
          
     )
))
