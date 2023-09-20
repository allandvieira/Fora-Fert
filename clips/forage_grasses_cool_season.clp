(deffunction about-g-cool()
    (return "
    Gramineas de estacao Fria:\
        Entre as espécies anuais, incluem-se as aveias branca e preta, o azevém (diploide e tretaplóide), o centeio, o capim lanudo, o triticale, a cevada forrageira e o trigo forrageiro. Entre as espécies perenes incluemse a festuca, a faláris, o dáctilo, a aveia perene e a cevadilha.\
        As gramíneas perenes são incluídas em sistemas pastoris utilizados continuamente por vários anos (longo prazo). Entre as espécies perenes, incluem-se o capim colonião (tanzânia, mombaça, aruana, massai), o capim pangola, o capim quicuio, a grama bermuda (tifton, coastcross, jiggs), a setária, as braquiárias, a hemártria, a grama missioneira, a pensacola, o capim-de-rhodes e o capim elefante.\
 \
"
    )

)

(defrule cool-grasses
    ?f-forage <- (forage "cool-grasses")


    =>

    (printout t (about-g-cool))
    (assert (header-done))
)


(defrule forage-cool-grasses-p
    ?f-header-done <- (header-done)

    ?f-forage <- (forage "cool-grasses")
    ?f-p-value <- (p-value ?p-value)
    ?f-first-planting <- (first-planting ?first-pl)

    =>

    (bind ?message "")
    (bind ?p-repl 0)


    (if (= ?first-pl 1)
    then
        (if (eq ?p-value "very-low")
        then
            (bind ?p-repl 170)
        else

            (if (eq ?p-value "low")
            then
                (bind ?p-repl 110)
            else

                (if (eq ?p-value "medium")
                then
                    (bind ?p-repl 100)
                else

                    (if (eq ?p-value "high")
                    then
                        (bind ?p-repl 60)
                    )
                )
            )
        )
    else
        (if (eq ?p-value "very-low")
        then
            (bind ?p-repl 110)
        else

            (if (eq ?p-value "low")
            then
                (bind ?p-repl 90)
            else

                (if (eq ?p-value "medium")
                then
                    (bind ?p-repl 60)
                else

                    (if (eq ?p-value "high")
                    then
                        (bind ?p-repl 60)
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
            (bind ?k-repl 140)
        else

            (if (eq ?k-value "low")
            then
                (bind ?k-repl 100)
            else

                (if (eq ?k-value "medium")
                then
                    (bind ?k-repl 90)
                else

                    (if (eq ?k-value "high")
                    then
                        (bind ?k-repl 60)
                    )
                )
            )
        )

    else
        (if (eq ?k-value "very-low")
        then

            (bind ?k-repl 100)

        else

            (if (eq ?k-value "low")
            then
                (bind ?k-repl 80)
            else

                (if (eq ?k-value "medium")
                then
                    (bind ?k-repl 60)
                else

                    (if (eq ?k-value "high")
                    then
                        (bind ?k-repl 60)
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


(defrule cool-grasses-n
    ?f-header-done <- (header-done)

    ?f-forage <- (forage "cool-grasses")
    ?f-organic-matter <- (organic-matter ?organic-matter)
    ?f-use-type <- (use-type ?use-type)

    =>

    (bind ?message "")
    (bind ?n-repl 0)

    (if (= ?use-type 1)
    then
        (if (< ?organic-matter 1.6)
        then
            (bind ?n-repl 160)
        else

            (if (< ?organic-matter 2.6)
            then
                (bind ?n-repl 140)
            else

                (if (< ?organic-matter 3.6)
                then
                    (bind ?n-repl 120)
                else
                    (if (< ?organic-matter 4.6)
                    then
                        (bind ?n-repl 100)
                    else
                        (if (> ?organic-matter 4.6)
                        then
                            (bind ?n-repl 80)
                        )
                    )
                )
            )
        )
    else
        (if (< ?organic-matter 1.6)
        then
            (bind ?n-repl 180)
        else

            (if (< ?organic-matter 2.6)
            then
                (bind ?n-repl 160)
            else

                (if (< ?organic-matter 3.6)
                then
                    (bind ?n-repl 140)
                else
                    (if (< ?organic-matter 4.6)
                    then
                        (bind ?n-repl 120)
                    else
                        (if (> ?organic-matter 4.6)
                        then
                            (bind ?n-repl 100)
                        )
                    )
                )
            )
        )
    )

    (printout t "
    Reposicao de nitrogenio:\
           " ?n-repl " kg de N/ha.\
           \
   ")


)
