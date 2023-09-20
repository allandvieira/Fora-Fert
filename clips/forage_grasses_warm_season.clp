(deffunction about()
    (return "
    Gramineas de estacao quante\
        Nesse grupo incluem-se, como espécies anuais, o milheto, o sorgo forrageiro, o capim sudão, o teosinto e o capim papuã; este último pode infestar lavouras, no caso de ser introduzido em rotação com culturas. \
\
"
    )

)

(defrule warm-grasses
    ?f-forage <- (forage "warm-grasses")

    =>

    (printout t (about))
    (assert (header-done))
)


(defrule forage-warm-grasses-p
    ?f-header-done <- (header-done)

    ?f-forage <- (forage "warm-grasses")
    ?f-p-value <- (p-value ?p-value)
    ?f-first-planting <- (first-planting ?first-pl)

    =>

    (bind ?message "")
    (bind ?p-repl 0)


    (if (= ?first-pl 1)
    then
        (if (eq ?p-value "very-low")
        then
            (bind ?p-repl 190)
        else

            (if (eq ?p-value "low")
            then
                (bind ?p-repl 130)
            else

                (if (eq ?p-value "medium")
                then
                    (bind ?p-repl 120)
                else

                    (if (eq ?p-value "high")
                    then
                        (bind ?p-repl 80)
                    )
                )
            )
        )
    else
        (if (eq ?p-value "very-low")
        then
            (bind ?p-repl 130)
        else

            (if (eq ?p-value "low")
            then
                (bind ?p-repl 110)
            else

                (if (eq ?p-value "medium")
                then
                    (bind ?p-repl 80)
                else

                    (if (eq ?p-value "high")
                    then
                        (bind ?p-repl 80)
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


(defrule forage-warm-grasses-k
    ?f-forage <- (forage "warm-grasses")
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
            (bind ?k-repl 180)
        else

            (if (eq ?k-value "low")
            then
                (bind ?k-repl 140)
            else

                (if (eq ?k-value "medium")
                then
                    (bind ?k-repl 130)
                else

                    (if (eq ?k-value "high")
                    then
                        (bind ?k-repl 100)
                    )
                )
            )
        )

    else
        (if (eq ?k-value "very-low")
        then

            (bind ?k-repl 140)

        else

            (if (eq ?k-value "low")
            then
                (bind ?k-repl 120)
            else

                (if (eq ?k-value "medium")
                then
                    (bind ?k-repl 100)
                else

                    (if (eq ?k-value "high")
                    then
                        (bind ?k-repl 100)
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
