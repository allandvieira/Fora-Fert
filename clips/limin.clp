(defrule forage-alfafa-liming
    ?f-forage <- (forage "alfafa")
    ?f-ph <- (ph ?ph)
    
    =>

    (if (< ?ph 6.0)
    then
        (printout t "\
    Recomendacao de calagem: \
            O calcario deve ser incorporado na camada de 0 a 20 cm. 
            Quantidade: 1 SMP para pH_agua 6.5\
            Modo de aplicacao: Incorporado (Obs.: quando a disponibilidade de P e K forem menores do que o teor critico, fazer a adubacao de correcao incorporando fertilizantes apos a calagem)\

        ")
    else
        (printout t "\
    Nao necessita correcao de Calagem\
        ")
    )
)


(defrule f-perene-lim
    ?f-perene <- (perene)
    ?f-first-planting  <- (first-planting  ?first-planting)
    ?f-ph <- (ph ?ph)
    ?f-forage <- (forage ?forage)
    
    =>

    (if (eq ?forage "alfafa")
    then
    else
    (if (= ?first-planting 1)
    then
        (if (< ?ph 5.5)
        then
            (printout t "\
    Recomendacao de calagem: \
            O calcario deve ser incorporado na camada de 0 a 20 cm. 
            Quantidade: 1 SMP para pH_agua 6.0\
            Modo de aplicacao: Incorporado 
        ")

        )
    else
        
        (printout t "\
    Nao necessita calagem\
        ")

    ))
)


