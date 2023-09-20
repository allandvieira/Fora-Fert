(deffunction about-int()
    (return "
    CONSORCIAÇÕES DE GRAMÍNEAS E DE LEGUMINOSAS DE ESTAÇÃO FRIA: \
        As consorciações de gramíneas e de leguminosas de estação fria podem ser implantadas em preparo convencional ou em sistemas de cultivo com preparo reduzido ou plantio direto, em sobre-semeadura e em pastagem natural. A combinação das espécies a serem implantadas depende do sistema produtivo. As consorciações podem ser formadas por espécies anuais, bienais ou perenes. O manejo afeta diretamente a produtividade e a longevidade da pastagem. São importantes no manejo o período e a época de diferimento, a ressemeadura, a lotação (carga animal), a umidade do solo e a altura de pastejo. Dentre outras, podem ser utilizadas a aveia, o azevém, o centeio, o capim lanudo e o triticale como gramíneas anuais e a festuca, o dáctilo, a aveia perene e a cevadilha perene como gramíneas perenes. Como leguminosas anuais, incluem-se a ervilhaca, o cornichão El Rincon, o trevo vesiculoso e o trevo subterrâneo; como leguminosas perenes, incluem-se o trevo branco, o cornichão São Gabriel e o trevo vermelho. \
        \ 
        "
    )

)

(deffunction n-message-inter-cool()
    (return "
    Reposicao de nitrogenio:\
            Inocular as sementes das leguminosas com rizóbio específico. Fazer adubação nitrogenada somente se for constatada a ineficiência da inoculação. Nesse caso, aplicar 20 kg de N/ha por ocasião do perfilhamento da gramínea e 20 kg de N/ha após cada duas utilizações da pastagem.\
\
    ")
)



(defrule intercrop-cool
    ?f-forage <- (forage "intercrop-cool")

    =>

    (printout t (about-int))
    (printout t (n-message-inter-cool))
    (assert (header-done))
)


(defrule intercrop-cool-p
    ?f-header-done <- (header-done)

    ?f-forage <- (forage "intercrop-cool")
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


(defrule intercrop-cool-k
    ?f-forage <- (forage "intercrop-cool")
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

(defrule intercrop-cool-an-pr
    ?f-forage <- (forage "alfafa")
    ?f-perene <- (perene ?is-perene)
    
    =>

    (if (= ?is-perene 1)
    then
        (printout t "Fazer a adubacao na epoca da semeadura\
        ")
    else
        (printout t "Fazer a adubacao no inicio do outono\
        ")
    )
)
