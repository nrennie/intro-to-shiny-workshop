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
    mainPanel(
      plotOutput("penguinsPlot")
    )
  )
)


# Server ------------------------------------------------------------------

server <- function(input, output) {
  
  filter_data <- reactive({
    penguins[penguins$species == input$species, ]
  })
  
  output$penguinsPlot <- renderPlot({
    plot(filter_data()$bill_length_mm, filter_data()$bill_depth_mm,
         main = glue::glue("Bill length and depth of {input$species} penguins"))
  })
  
}


# Run app -----------------------------------------------------------------

shiny::shinyApp(ui, server)

