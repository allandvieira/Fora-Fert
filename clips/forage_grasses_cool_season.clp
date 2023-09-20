(deffunction about()
    (return "
    Gramineas de estacao Fria:\
        Entre as espécies anuais, incluem-se as aveias branca e preta, o azevém (diploide e tretaplóide), o centeio, o capim lanudo, o triticale, a cevada forrageira e o trigo forrageiro. Entre as espécies perenes incluemse a festuca, a faláris, o dáctilo, a aveia perene e a cevadilha.\
        As gramíneas perenes são incluídas em sistemas pastoris utilizados continuamente por vários anos (longo prazo). Entre as espécies perenes, incluem-se o capim colonião (tanzânia, mombaça, aruana, massai), o capim pangola, o capim quicuio, a grama bermuda (tifton, coastcross, jiggs), a setária, as braquiárias, a hemártria, a grama missioneira, a pensacola, o capim-de-rhodes e o capim elefante.\
 \
"
    )

)

(deffunction n-recommendation()
    (return
        "
    Reposicao de nitrogenio:\
    
        \
        "
    )
    
)

(deffunction s-recommendation()
    (return "
    Reposicao de Enxofre: \
        \
    ")
    
)

(deffunction b-recommendation()
    (return "
    Reposicao de Boro: \
        \
    ")
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RULES:


(defrule cool-grasses
    ?f-forage <- (forage "cool-grasses")

    =>

    (printout t (about))
    (printout t (n-recommendation))
    (printout t (s-recommendation))
    (printout t (b-recommendation))
    (assert (header-done))
)


(defrule forage-cool-grasses-p
    ?f-forage <- (forage "cool-grasses")
    ?f-p-value <- (p-value ?p-value)
    ?f-first-planting <- (first-planting ?first-pl)
    ?f-header-done <- (header-done)

    =>

    (bind ?message "")
    (bind ?p-repl 0)


    (if (= ?first-pl 1)
    then
        (if (eq ?p-value "very-low")
        then
            (bind ?p-repl 195)
        else

            (if (eq ?p-value "low")
            then
                (bind ?p-repl 135)
            else

                (if (eq ?p-value "medium")
                then
                    (bind ?p-repl 125)
                else

                    (if (eq ?p-value "high")
                    then
                        (bind ?p-repl 85)
                    )
                )
            )
        )
    else
        (if (eq ?p-value "very-low")
        then
            (bind ?p-repl 170)
        else

            (if (eq ?p-value "low")
            then
                (bind ?p-repl 150)
            else

                (if (eq ?p-value "medium")
                then
                    (bind ?p-repl 120)
                else

                    (if (eq ?p-value "high")
                    then
                        (bind ?p-repl 120)
                    )
                )
            )
        )
    )

    (if (= ?p-repl 0)
    then
        (printout t "\ Nao necessita de reposicao de Fosforo." crlf)

    else
        (printout t "
    Reposicao de Fosforo:\
            " ?p-repl " kg de P2O5/ha.\
            \ 
        ")

    )
)


(defrule forage-cool-grasses-k
    ?f-forage <- (forage "cool-grasses")
    ?f-k-value <- (k-value ?k-value)
    ?f-fist-planting <- (first-planting ?first-pl)
    ?f-header-done <- (header-done)

    =>

    (bind ?message "")
    (bind ?k-repl 0)


    (if (= ?first-pl 1)
    then

        (if (eq ?k-value "very-low")
        then
            (bind ?k-repl 330)
        else

            (if (eq ?k-value "low")
            then
                (bind ?k-repl 290)
            else

                (if (eq ?k-value "medium")
                then
                    (bind ?k-repl 280)
                else

                    (if (eq ?k-value "high")
                    then
                        (bind ?k-repl 250)
                    )
                )
            )
        )

    else
        (if (eq ?k-value "very-low")
        then

            (bind ?k-repl 400)

        else

            (if (eq ?k-value "low")
            then
                (bind ?k-repl 380)
            else

                (if (eq ?k-value "medium")
                then
                    (bind ?k-repl 360)
                else

                    (if (eq ?k-value "high")
                    then
                        (bind ?k-repl 360)
                    )
                )
            )
        )
    )
        

    (if (= ?k-repl 0)
    then
        (printout t "\ Nao necessita de reposicao de Potassio." crlf)

    else
        (printout t "
    Reposicao de Potassio\
            " ?k-repl " kg de K2O/ha.\
            \ 
        ")

    )
    (assert (pk-done))
)

(defrule forage-cool-grasses-liming
    ?f-forage <- (forage "cool-grasses")
    ?f-ph <- (ph ?ph)
    ?f-pk <- (pk-done)
    
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
