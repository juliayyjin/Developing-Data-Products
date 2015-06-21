# load packages
library(shiny)
library(ggvis)
library(datasets)
data<-data.frame(ToothGrowth)

# interactive server code
shinyServer(
  function(input, output) {
    
    input_general.span <- reactive(input$general.span)
    input_size <- reactive(input$size)
    input_opacity <- reactive(input$opacity)
    input_supp<-reactive(input$supp)
    selectedData <- subset(data,supp=input_supp)
    selectedData%>%     
      ggvis(~dose, ~len) %>%
      layer_smooths(span = input_general.span, se = TRUE) %>%
      layer_points(size := input_size, opacity := input_opacity, fill = ~input$supp) %>%
      add_axis("x", title = "Dose") %>%
      add_axis("y", title = "Tooth Length") %>%
      bind_shiny("ggvis", "ggvis_ui"
      )
})