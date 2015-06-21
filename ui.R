library(shiny)
library(ggvis)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("ToothGrowth: Better presentation of data"),
  
  # Sidebar layout
  sidebarLayout(
    
    # Sidebar panel
    sidebarPanel(
      h3('Choose a supplement'),
      p('Orange Juice=OJ; Victamin C=VC '),
      selectInput('supp', 'Supplement',c("OJ","VC"),"OJ"),
      h3('Controls'),
      sliderInput('general.span', 'General Model', 0.5, 1, value=0.5),
      sliderInput("size", "Point Size", 10, 200, value = 50),
      sliderInput('opacity', "Point Opacity", 0, 1, value = 0.5),
      p('The controls can be used to change the size and opacity of dots 
        ')
    ),
    
    # Main panel
    mainPanel(
      h3('Let us have a better look at the ToothGrowth dataset.'),
      uiOutput("ggvis_ui"),
      ggvisOutput("ggvis"),
      p('The response is the length of odontoblasts (teeth) in each of 10 guinea pigs at each of three dose levels of Vitamin C (0.5, 1, and 2 mg) with each of two delivery methods (orange juice or ascorbic acid)
        ')
    )
  ))
)