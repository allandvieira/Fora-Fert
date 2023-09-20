(defrule forage_alfaca
    ?f-forage <- (forage "alfafa")
    ?f-p-value <- (p-value ?p-value)
    ?f-k-value <- (k-value ?k-value)


    =>


    (bind ?p-message "Recomendacao de Fosforo: (kg de P2O5/ha) "
    (cond
        ((= ?phosph "very_low") => (bind ?p-recon "195"))
        ((= ?phosph "low") => (bind ?p-recon "135"))
        ((= ?phosph "medium") => (bind ?p-recon "125"))
        ((= ?phosph "high") => (bind ?p-recon "85"))
    ))

    (cond
        ((= ?potass "very_low") (bind ?k-recon "330"))
        ((= ?potass "low") (bind ?k-recon "290"))
        ((= ?potass "medium") (bind ?k-recon "280"))
        ((= ?potass "high") (bind ?k-recon "250"))
    )

    ;(retract ?recommendation-message)
    ;(assert (recommendation-message ("Reposicao de Fosforo: " ?p-value ". Reposicao de Potassio: " ?k-value crlf)))
)
