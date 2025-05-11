library(shiny)
# Flashcard data structure
questions <- list(
  "Contract Law" = list(
    "Basic" = list(
      question = "What is consideration in contract law?",
      answer   = "Consideration is something of value exchanged to form a binding contract."
    ),
    "Intermediate" = list(
      question = "Distinguish between an offer and an invitation to treat.",
      answer   = "An offer shows intent to be bound; an invitation to treat invites offers from others."
    ),
    "Advanced" = list(
      question = "Evaluate the role of promissory estoppel in modern contract enforcement.",
      answer   = "Promissory estoppel prevents a party from going back on a promise relied upon by another, even without consideration."
    )
  ),
  "Tort Law" = list(
    "Basic" = list(
      question = "What is negligence?",
      answer   = "Negligence is a breach of a legal duty of care causing damage to another."
    ),
    "Intermediate" = list(
      question = "Explain duty of care in Donoghue v Stevenson.",
      answer   = "It established that manufacturers owe a duty of care to ultimate consumers."
    ),
    "Advanced" = list(
      question = "Critically analyze the principle of remoteness of damage.",
      answer   = "Remoteness limits liability to harm that was reasonably foreseeable at the time of breach."
    )
  )
)

library(shiny)

# If not already loaded in a global.R file, paste the `questions` list here

shinyServer(function(input, output, session) {
  # Update difficulty options dynamically when topic changes
  observeEvent(input$topic, {
    updateSelectInput(session, "level",
                      choices = names(questions[[input$topic]]),
                      selected = names(questions[[input$topic]])[1])
  })
  
  # Reactively get selected question and answer
  selected_card <- eventReactive(input$next_btn, {
    req(input$topic, input$level)
    questions[[input$topic]][[input$level]]
  })
  
  output$question <- renderText({
    selected_card()$question
  })
  
  output$answer <- renderText({
    selected_card()$answer
  })
})
