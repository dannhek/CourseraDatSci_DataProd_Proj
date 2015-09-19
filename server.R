library(shiny)
library(ggplot2)
library(maps)
library(plyr)
library(RColorBrewer)
data(state)
state<-as.data.frame(cbind( state.abb,
                            state.area,
                            state.center,
                            state.division,
                            state.name,
                            state.region,
                            state.x77))
names(state)<-c("abbreviation","area","center","division","state","region",
                "population","income","illiteracy","life_expectancy","murder",
                "hs_grad_rate","frost","area")
state$abbreviation <- as.factor(as.character(state$abbreviation))
state$division     <- as.numeric(as.character(state$division))
state$region       <- as.factor(as.character(state$region))
state$state        <- as.character(state$state)

state$income           <- as.numeric(state$income)
state$population       <- as.numeric(state$population)
state$illiteracy       <- as.numeric(state$illiteracy)    
state$life_expectancy  <- as.numeric(state$life_expectancy)
state$murder           <- as.numeric(state$murder)        
state$hs_grad_rate     <- as.numeric(state$hs_grad_rate)   
state$frost            <- as.numeric(state$frost)        
state$area             <- as.numeric(state$area)          

state$literacy         <- 100-state$illiteracy
state$density          <- state$population/state$area


map_data <- map_data("state")
map_data$region    <- gsub("\\b([a-z])([a-z]+)", "\\U\\1\\L\\2" ,map_data$region,perl=TRUE)
names(map_data)[5] <- "state"



#variables of interest from UI:
##division
##color
##display

shinyServer(function(input, output) {
     output$display   <- renderText(input$display)
     output$color     <- renderText(input$color)
     output$division  <- renderText(input$division)
     
     
     sub.states<-reactive({
          #Always subset the Columns
          sub<-subset(states,TRUE,c("long","lat","group","state","division",input$display))
          names(sub)<-c("long","lat","group","state","division","variable")
          #Subset Rows only if Needed
          if (input$division!=0) {
               sub<-subset(sub,division==input$division,TRUE)
          }
          as.data.frame(sub)
     })
     colors<-reactive({
          list(palette = switch(input$color,
                                "red"  = "Reds",
                                "blue" = "Blues",
                                "green"= "Greens",
                                "gray" = "Greys"),
               single  = switch(input$color,
                                "red"  = "#DE2D26",
                                "blue" = "#3182BD",
                                "green"= "#31A354",
                                "gray" = "#636363")
          )
     })
     varname<-reactive({
          switch(input$display,
                 "density"    = "Density (Pop/Sq. Miles)",
                 "population" = "Population (1,000s)",
                 "income"     = "Income Per Capita",
                 "life_expectancy" = "Life Expectancy at Birth (Years)",
                 "murder"     = "Murders per 100,000",
                 "hs_grad_rate"="High School Graduation Rate (Percent)",
                 "literacy"   = "Literacy Rate (Percent)")
     })
     
     output$mainMap <- renderPlot({
          g <- ggplot(data=sub.states()) + 
               geom_polygon(aes(x=long, y=lat, group=group,fill=variable),colour="white") +
               scale_fill_distiller(palette = colors()$palette,name=varname()) +
               theme(legend.position="top")
          g
          
     })
     output$hist   <- renderPlot({
          df<- aggregate(variable~state,data=sub.states(),FUN=max)
          g <- ggplot(data=sub.states(), aes(x=variable)) + 
               geom_histogram(colour="white",fill=colors()$single) +
               xlab(varname()) +
               scale_y_continuous(breaks=NULL)
          g
     })
})

#Main Page 