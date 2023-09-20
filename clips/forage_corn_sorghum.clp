(deffunction about()
    (return "
    Milho e sorgo para silagem\
            O milho e o sorgo forrageiro têm sido utilizados para a produção de forragem conservada na forma de silagem, podendo constituir a base alimentar de sistemas produtivos ou utilizada de forma estratégica em sistemas pastoris. De forma geral, o milho apresenta maior produtividade (em regiões com adaptação) e qualidade superior. Por outro lado, pela capacidade de rebrote, algumas variedades de sorgo podem permitir um segundo corte. Em geral, recomenda-se a utilização de práticas de manejo para estas culturas semelhantes às utilizadas em lavouras para grãos, garantindo assim alta produtividade, alta qualidade de forragem e maior rentabilidade.\
\
    ")

)

(defrule corn-sorghum
    ?f-forage <- (forage "corn-sorghum")

    =>

    (printout t (about))
    (assert (header-done))
)


(defrule forage-corn-sorghum-p
    ?f-header-done <- (header-done)

    ?f-forage <- (forage "corn-sorghum")
    ?f-p-value <- (p-value ?p-value)
    ?f-first-planting <- (first-planting ?first-pl)

    =>

    (bind ?message "")
    (bind ?p-repl 0)


    (if (= ?first-pl 1)
    then
        (if (eq ?p-value "very-low")
        then
            (bind ?p-repl 220)
        else

            (if (eq ?p-value "low")
            then
                (bind ?p-repl 160)
            else

                (if (eq ?p-value "medium")
                then
                    (bind ?p-repl 150)
                else

                    (if (eq ?p-value "high")
                    then
                        (bind ?p-repl 110)
                    )
                )
            )
        )
    else
        (if (eq ?p-value "very-low")
        then
            (bind ?p-repl 160)
        else

            (if (eq ?p-value "low")
            then
                (bind ?p-repl 140)
            else

                (if (eq ?p-value "medium")
                then
                    (bind ?p-repl 110)
                else

                    (if (eq ?p-value "high")
                    then
                        (bind ?p-repl 110)
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


(defrule forage-corn-sorghum-k
    ?f-forage <- (forage "corn-sorghum")
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
            (bind ?k-repl 300)
        else

            (if (eq ?k-value "low")
            then
                (bind ?k-repl 260)
            else

                (if (eq ?k-value "medium")
                then
                    (bind ?k-repl 250)
                else

                    (if (eq ?k-value "high")
                    then
                        (bind ?k-repl 220)
                    )
                )
            )
        )

    else
        (if (eq ?k-value "very-low")
        then

            (bind ?k-repl 260)

        else

            (if (eq ?k-value "low")
            then
                (bind ?k-repl 240)
            else

                (if (eq ?k-value "medium")
                then
                    (bind ?k-repl 220)
                else

                    (if (eq ?k-value "high")
                    then
                        (bind ?k-repl 220)
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

(defrule corn-sorghum-n
    ?f-header-done <- (header-done)

    ?f-forage <- (forage "corn-sorghum")
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
                (bind ?n-repl 150)
            else

                (if (< ?organic-matter 3.6)
                then
                    (bind ?n-repl 140)
                else
                    (if (< ?organic-matter 4.6)
                    then
                        (bind ?n-repl 130)
                    else
                        (if (> ?organic-matter 4.6)
                        then
                            (bind ?n-repl 120)
                        )
                    )
                )
            )
        )
    else
        (if (< ?organic-matter 1.6)
        then
            (bind ?n-repl 170)
        else

            (if (< ?organic-matter 2.6)
            then
                (bind ?n-repl 160)
            else

                (if (< ?organic-matter 3.6)
                then
                    (bind ?n-repl 150)
                else
                    (if (< ?organic-matter 4.6)
                    then
                        (bind ?n-repl 140)
                    else
                        (if (> ?organic-matter 4.6)
                        then
                            (bind ?n-repl 130)
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
