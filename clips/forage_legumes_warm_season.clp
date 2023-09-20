(deffunction about()
    (return "
    Leguminosas de estacao quente\
            As leguminosas de estação quente destinam-se, geralmente, à reserva de proteína ou para produção de sementes. O amendoim forrageiro tem sido utilizado com bons resultados em pastejo direto em algumas regiões dos Estados do RS e de SC. Cultivos estremes de leguminosas de estação quente também têm sido utilizados para a recuperação de áreas degradadas, com manejo sob pastejos seletivos.\
            Incluem-se, entre as espécies anuais, o feijão miúdo e o labe-labe. Como espécies perenes incluem-se o guandu, o desmódio, o siratro, a soja perene, o lotononis, a leucena, o amendoim forrageiro e o estilozantes. \
    ")

)

(deffunction n-message()
    (return "
    Reposicao de nitrogenio:\
            Deve-se inocular as sementes com o rizóbio específico, se disponível. Para as espécies de estação quente (tropicais) nem sempre há disponibilidade de rizóbio específico, mas por vezes são naturalmente inoculadas por raças nativas. Deve-se utilizar a adubação nitrogenada somente se for constatada a ineficiência da inoculação. Nesse caso, aplicar 20 kg de N/ha, após cada duas utilizações da pastagem.\
    ")
)

(defrule warm-legumes
    ?f-forage <- (forage "warm-legumes")

    =>

    (printout t (about))
    (printout t (n-message))
    (assert (header-done))
)


(defrule forage-warm-legumes-p
    ?f-header-done <- (header-done)

    ?f-forage <- (forage "warm-legumes")
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


(defrule forage-warm-legumes-k
    ?f-forage <- (forage "warm-legumes")
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


(defrule warm-legumes-n
    ?f-header-done <- (header-done)

    ?f-forage <- (forage "warm-legumes")

    =>

    (printout t "
    Nitrogênio:\
            Deve-se inocular as sementes com o rizóbio específico, se disponível. Para as espécies de estação quente (tropicais) nem sempre há disponibilidade de rizóbio específico, mas por vezes são naturalmente inoculadas por raças nativas. Deve-se utilizar a adubação nitrogenada somente se for constatada a ineficiência da inoculação. Nesse caso, aplicar 20 kg de N/ha, após cada duas utilizações da pastagem.
\
   ")

)
