(deffunction about()
    (return "
    Leguminosas de estacao fria:\
            As leguminosas de estação fria são geralmente cultivadas em consorciações; culturas estremes geralmente destinam-se ao pastejo e à produção de sementes ou de feno. \
            Incluem-se como espécies anuais a ervilhaca, o trevo vesiculoso, o trevo subterrâneo e o trevo alexandrino. Como espécies perenes incluem-se o trevo branco, o cornichão, o trevo vermelho e o cornichão maku.\

\
"
    )

)

(defrule cool-legumes
    ?f-forage <- (forage "cool-legumes")

    =>

    (printout t (about))
    (assert (header-done))
)


(defrule forage-cool-legumes-p
    ?f-header-done <- (header-done)

    ?f-forage <- (forage "cool-legumes")
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


(defrule forage-cool-legumes-k
    ?f-forage <- (forage "cool-legumes")
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
