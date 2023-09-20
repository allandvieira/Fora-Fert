(defrule forage_alfaca
    (forage "alfafa")

    =>

    ?f <- (p_value ?phosph)
    (test (cond
        ((= ?phosph "very_low") => 195)
        ((= ?phosph "low") => 135)
        ((= ?phosph "medium") => 125)
        ((= ?phosph "high") => 85)
        ((= ?phosph "very_high") => 0)
    ))

    ?f <- (k_value ?potass)
    (test(cond
        ((= ?potass "very_low") 330)
        ((= ?potass "low") 290)
        ((= ?potass "medium") 280)
        ((= ?potass "high") 250)
        ((= ?potass "very_high") 0)
    ))

    (bind ?recommendationMessage "Reposicao de Fósforo: " ?phosphorusValue ?phosphorusUnit "Reposicao de Potássio: " ?potassiumValue ?potassiumUnit)
)

