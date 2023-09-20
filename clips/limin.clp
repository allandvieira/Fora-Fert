(defrule forage-alfafa-liming
    ?f-get-lim <- (getlim)

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
    ?f-get-lim <- (getlim)

    ?f-perene <- (perene ?is-perene)
    ?f-first-planting  <- (first-planting  ?is-first-planting)
    ?f-ph <- (ph ?ph)
    ?f-forage <- (forage ?forage)
    
    =>

    ; NAO alfafa
    (if (eq ?forage "alfafa")
    then
    else

    (if (and(= ?is-first-planting 1) (= ?is-perene 1))
    then
        (if (< ?ph 5.5)
        then
            (printout t "\
    Recomendacao de calagem: \
            O calcario deve ser incorporado na camada de 0 a 20 cm. 
            Quantidade: 1 SMP para pH_agua 6.0\
            Modo de aplicacao: Incorporado 
        ")

        else
            (printout t "\
    Nao necessita calagem\
                ")
        )
    ))
)

; segundo a tabela, se a forrageira for perene, mas nao for o primeiro plantio, seguir as recomendacoes para forrageiras anuais
(defrule f-perene-not-first-planting-trate-as-anual
    ?f-perene <- (perene ?is-perene)
    ?f-first-planting  <- (first-planting  ?is-first-planting)

    =>

    (if (= ?is-perene 1)
    then
        (if (= ?is-first-planting 0)
        then
            (modify ?f-perene (perene 0))
        )
    )
)

(defrule f-anual-or-not-first-planting-lim
    ?f-get-lim <- (getlim)

    ?f-perene <- (perene ?is-perene)
    ?f-first-planting  <- (first-planting  ?is-first-planting)
    ?f-ph <- (ph ?ph)
    ?f-forage <- (forage ?forage)
    ?f-v <- (base-saturation ?v-sat)
    ?f-al <- (aluminium-saturation ?al-sat)

    =>

    ; NAO alfafa
    (if (eq ?forage "alfafa")
    then
    else

    (if (= ?is-perene 0)
    then
        (if (= ?is-first-planting 1)
        then
            (if(< ?ph 5.5)
            then
                (printout t "
    Recomendacao de calagem:
            O calcario deve ser incorporado na camada de 0 a 20 cm.\
            Quantidade: 1 SMP para pH_agua 6.0\
            Modo de aplicacao: Incorporado (Obs.: quando a disponibilidade de P e K forem menores do que o teor critico, fazer a adubacao de correcao incorporando fertilizantes apos a calagem)\
            \
                ")
            else
                (printout t "
    Nao necessita de ccalagem.\
                ")
            )
        else
            (if (< ?ph 5.5)
            then
                (if (and (>= ?v-sat 65) (< ?al-sat 10) )
                then
                    (printout t "Nao aplicar calagem, pois saturacao por base >= 65% e saturacao por aluminio na CTC < 10%\
                    ")
                else
                    (printout t "
    Recomendacao de calagem:
            O calcario deve ser incorporado na camada de 0 a 10 cm.\
            Quantidade: 1/4 SMP para pH_agua 6.0\
            Modo de aplicacao: Superficial (limitada a 5 t/ha (PRNT 100%)
            \
                    ")
                )
            else
                (printout t "
    Nao necessita de ccalagem.\
                ")
            )
        )
    ))
)


