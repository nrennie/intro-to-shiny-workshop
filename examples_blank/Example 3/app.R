library(shiny)
library(palmerpenguins)

# Penguin types
species_choices <- unique(penguins$species)

# UI ----------------------------------------------------------------------

ui <- fluidPage(
  titlePanel("Penguins!"),
  sidebarLayout(
    
    # Sidebar with user inputs
    sidebarPanel(
      # Select variable for plot
      selectInput(
        inputId = "species",
        label = "Choose a species:",
        choices = species_choices
      )
    ),
    
    # Display a plot of the generated distribution
    mainPanel()
  )
)


# Server ------------------------------------------------------------------

server <- function(input, output) {
  
}


# Run app -----------------------------------------------------------------

shiny::shinyApp(ui, server)

