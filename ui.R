library(shiny)

# Define questions globally so UI can access it
questions <- list(
  "Contract Law" = list(
    "Basic" = "What is consideration in contract law?",
    "Intermediate" = "Distinguish between an offer and an invitation to treat.",
    "Advanced" = "Evaluate the role of promissory estoppel in modern contract enforcement."
  ),
  "Tort Law" = list(
    "Basic" = "What is negligence?",
    "Intermediate" = "Explain duty of care in Donoghue v Stevenson.",
    "Advanced" = "Critically analyze the principle of remoteness of damage."
  )
)

library(shiny)

shinyUI(fluidPage(
  titlePanel("Law Revision Flashcards"),

  sidebarLayout(
    sidebarPanel(
      selectInput("topic", "Select Topic:",
                  choices = names(questions)),
      selectInput("level", "Select Difficulty:",
                  choices = NULL),  # dynamically filled
      actionButton("next_btn", "Show Flashcard")
    ),

    mainPanel(
      h3("Flashcard"),
      strong("Q:"), verbatimTextOutput("question"),
      br(),
      strong("A:"), verbatimTextOutput("answer"),
      hr(),
      h5("Tip: Use this app to quiz yourself across major legal subjects.")
    )
  )
))


