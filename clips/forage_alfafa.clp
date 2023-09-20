(defrule forage_alfaca
    (bind ?phosphorusValue
        (cond
            ((eq ?soilPLevel "very_low") 195)
            ((eq ?soilPLevel "low") 135)
            ((eq ?soilPLevel "medium") 125)
            ((eq ?soilPLevel "high") 85)
            ((eq ?soilPLevel "very_high") 0)
        )
    )

    (bind ?potassiumValue
        (cond
            ((eq ?soilKLevel "very_low") 330)
            ((eq ?soilKLevel "low") 290)
            ((eq ?soilKLevel "medium") 280)
            ((eq ?soilKLevel "high") 250)
            ((eq ?soilKLevel "very_high") 0)
        )
    )

    (bind ?recommendationMessage "Reposicao de Fósforo: " ?phosphorusValue ?phosphorusUnit "Reposicao de Potássio: " ?potassiumValue ?potassiumUnit)
)

