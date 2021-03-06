context("SMP")
library(psychTestR)

app <- AppTester$new("apps/SMP_DE_short")

# Enter id
app$expect_ui_text("Bitte gib Deine ID ein Weiter")
app$set_inputs(p_id = "abcde")
app$click_next()

# Intro
app$expect_ui_text("Bitte geben Sie Ihre Präferenzen für jedes, der folgenden Musikgenres anhand der gegebenen Skalen an. Weiter")
app$click_next()

app$expect_ui_text("Frage 1 von 14 Alternative Gefällt mir überhaupt nicht Gefällt mir größtenteils nicht Gefällt mir eher nicht Weder noch Gefällt mir eher Gefällt mir größtenteils Gefällt mir voll und ganz")
app$click("btn1_text")

app$expect_ui_text("Frage 2 von 14 Blues Gefällt mir überhaupt nicht Gefällt mir größtenteils nicht Gefällt mir eher nicht Weder noch Gefällt mir eher Gefällt mir größtenteils Gefällt mir voll und ganz")
app$click("btn2_text")

app$click("btn3_text")
app$click("btn4_text")
app$click("btn5_text")
app$click("btn6_text")
app$click("btn7_text")
app$click("btn1_text")
app$click("btn2_text")
app$click("btn3_text")
app$click("btn4_text")
app$click("btn5_text")
app$click("btn6_text")
app$click("btn7_text")

app$expect_ui_text("Deine Ergebnisse wurden gespeichert. Du kannst das Browserfenster jetzt schließen.")

results <- app$get_results() %>% as.list()
expect_equal(names(results), c("SMP"))
expect_equal(
  results[["SMP"]],
  list(
    q1 = "btn1_text",
    q3 = "btn2_text",
    q4 = "btn3_text",
    q5 = "btn4_text",
    q6 = "btn5_text",
    q7 = "btn6_text",
    q8 = "btn7_text",
    q10 = "btn1_text",
    q12 = "btn2_text",
    q16 = "btn3_text",
    q18 = "btn4_text",
    q20 = "btn5_text",
    q21 = "btn6_text",
    q22 = "btn7_text",
    "Intense & Rebellious" = 2.66666666666666,
    "Intense" = 2.66666666666666,
    "Reflective & Complex" = 3.25,
    "Sophisticated" = 3.25,
    "Upbeat & Conventional" = 4,
    "Unpretentious" = 4,
    "Energetic & Rhythmic" = 5.75,
    "Mellow" = 5,
    "Contemporary" = 6
  )
)

app$stop()
