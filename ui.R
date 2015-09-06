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
               h2("Map"),
               plotOutput("mainMap"),
               h2("Distribution"),
               plotOutput("hist")
          )
          
     )
))
