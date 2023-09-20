(deffunction about-int-w()
    (return "
    CONSORCIAÇÕES DE GRAMÍNEAS E DE LEGUMINOSAS DE ESTAÇÃO QUENTE \
        As consorciações de gramíneas e de leguminosas de estação quente podem ser implantadas em preparo convencional ou em sistemas de cultivo com preparo reduzido. A combinação das espécies a serem utilizadas depende do sistema produtivo. As consorciações podem ser formadas por espécies anuais, bienais ou perenes. O manejo da pastagem afeta diretamente sua produtividade e longevidade. São importantes para o manejo o período e a época de descanso, a ressemeadura, a lotação (carga animal), a umidade do solo e a altura de pastejo. Incluem-se, neste grupo, o milheto, o sorgo forrageiro e o teosinto, como gramíneas anuais e a pensacola, o capim-de-rhodes, o capim elefante, o capim colonião, a pangola, a grama bermuda (tifton, coastcross), a setária, as braquiárias, o capim quicuio e a hemártria, como gramíneas perenes. Como leguminosas anuais, incluem-se o feijão miúdo e o labelabe, e como leguminosas perenes o guandu, o desmódio, a leucena, o amendoim forrageiro e a soja perene. \
        \ 
        "
    )

)

(deffunction n-message-int-w()
    (return "
    Reposicao de nitrogenio:\
            Deve-se inocular as sementes com o rizóbio específico, se disponível. Para as espécies de estação quente (tropicais) nem sempre há disponibilidade de rizóbio específico, mas por vezes são naturalmente inoculadas por raças nativas.  Deve-se utilizar a adubação nitrogenada somente se for constatada a ineficiência da inoculação. Nesse caso, aplicar 20 kg de N/ha por ocasião do perfilhamento da gramínea e 20 kg/ha após cada duas utilizações da pastagem.\
\
    ")
)


(defrule intercrop-warm
    ?f-forage <- (forage "intercrop-warm")

    =>

    (printout t (about-int-w))
    (printout t (n-message-int-w))
    (assert (header-done))
)


(defrule intercrop-warm-p
    ?f-header-done <- (header-done)

    ?f-forage <- (forage "intercrop-warm")
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


(defrule intercrop-warn-k
    ?f-forage <- (forage "intercrop-warn")
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

(defrule intercrop-warm-an-pr
    ?f-forage <- (forage "intercrop-warm")
    ?f-perene <- (perene ?pr)
    
    =>

    (if (= ?pr 1)
    then
        (printout t "Fazer a adubacao na epoca da semeadura\
        ")
    else
        (printout t "Fazer a adubacao no inicio do outono\
        ")
    )
)
