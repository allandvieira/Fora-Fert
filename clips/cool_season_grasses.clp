(defrule cool_season_grasses
    (if (eq ?forage "GRAMÍNEAS DE ESTAÇÃO FRIA")
        then
        (bind ?phosphorusValue
            (cond
                ((eq ?soilPLevel "very_low") 170)
                ((eq ?soilPLevel "low") 110)
                ((eq ?soilPLevel "medium") 100)
                ((eq ?soilPLevel "high") 60)
            )
        )

        (bind ?potassiumValue
            (cond
                ((eq ?soilKLevel "very_low") 140)
                ((eq ?soilKLevel "low") 100)
                ((eq ?soilKLevel "medium") 90)
                ((eq ?soilKLevel "high") 60)
            )
        )

        (bind ?recommendationMessage "Reposicao de Fósforo: " ?phosphorusValue ?phosphorusUnit "Reposicao de Potássio: " ?potassiumValue ?potassiumUnit)

        (bind ?recommendationMessage "Reposicao de Fósforo: " ?phosphorusValue ?phosphorusUnit "Reposicao de Potássio: " ?potassiumValue ?potassiumUnit)
    )
)

