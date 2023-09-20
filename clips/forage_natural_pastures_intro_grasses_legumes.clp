(deffunction about()
    (return "
    PASTAGENS NATURAIS COM INTRODUÇÃO DE GRAMÍNEAS E LEGUMINOSAS \
            O aumento da capacidade de produção de pastagens naturais pode ser obtido com a introdução em sobre-semeadura, cultivo mínimo ou plantio direto, de espécies de inverno acompanhada da melhoria da fertilidade do solo pela calagem e pela adubação. Sempre que possível, deve-se incluir espécie(s) leguminosa(s), visando a melhor qualidade da forragem e à economia de nitrogênio.\
            Em relação às espécies de estação fria, podem ser introduzidas gramíneas, leguminosas ou consórcios.  As principais consorciações em sobre-semeadura incluem o azevém+trevo branco+comichão, o azevém+trevo vesiculoso, a aveia+azevém+trevo vesiculoso e o azevém+trevos (branco, vermelho, subterrâneo). \
            A adubação sugerida a seguir visa o fornecimento de nutrientes para a(s) espécie(s) de inverno introduzidas e, no verão, têm-se a produção da pastagem natural. Assim, a adubação de verão, para suprir as necessidades da pastagem natural, deve seguir as recomendações apresentadas no Item 6.2.9.\

        \ 
        "
    )

)

(deffunction n-message()
    (return "
    Reposicao de nitrogenio:\
            No caso de introdução de apenas leguminosas, fazer a inoculação das sementes com rizóbio específico. Aplicar nitrogênio somente se for constatada a ineficiência da inoculação. 
No caso de introdução de gramíneas e leguminosas consorciadas, aplicar nitrogênio na dose de 20 kg de N/ha por ocasião do perfilhamento da gramínea e 20 kg/ha após cada duas utilizações da pastagem. 
Se forem introduzidas apenas gramíneas, adotar as recomendações de nitrogênio conforme a tabela abaixo.\
\
    ")
)



(defrule natural-pastures-grasses-grasses
    ?f-forage <- (forage "natural-pastures-grasses")

    =>

    (printout t (about))
    (printout t (n-message))
    (assert (header-done))
)


(defrule natural-pastures-grasses-p
    ?f-header-done <- (header-done)

    ?f-forage <- (forage "natural-pastures-grasses")
    ?f-p-value <- (p-value ?p-value)
    ?f-first-planting <- (first-planting ?first-pl)

    =>

    (bind ?message "")
    (bind ?p-repl 0)


    (if (= ?first-pl 1)
    then
        (if (eq ?p-value "very-low")
        then
            (bind ?p-repl 160)
        else

            (if (eq ?p-value "low")
            then
                (bind ?p-repl 100)
            else

                (if (eq ?p-value "medium")
                then
                    (bind ?p-repl 90)
                else

                    (if (eq ?p-value "high")
                    then
                        (bind ?p-repl 50)
                    )
                )
            )
        )
    else
        (if (eq ?p-value "very-low")
        then
            (bind ?p-repl 100)
        else

            (if (eq ?p-value "low")
            then
                (bind ?p-repl 80)
            else

                (if (eq ?p-value "medium")
                then
                    (bind ?p-repl 50)
                else

                    (if (eq ?p-value "high")
                    then
                        (bind ?p-repl 50)
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


(defrule natural-pastures-grasses-k
    ?f-forage <- (forage "natural-pastures-grasses")
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
            (bind ?k-repl 130)
        else

            (if (eq ?k-value "low")
            then
                (bind ?k-repl 90)
            else

                (if (eq ?k-value "medium")
                then
                    (bind ?k-repl 80)
                else

                    (if (eq ?k-value "high")
                    then
                        (bind ?k-repl 50)
                    )
                )
            )
        )

    else
        (if (eq ?k-value "very-low")
        then

            (bind ?k-repl 90)

        else

            (if (eq ?k-value "low")
            then
                (bind ?k-repl 70)
            else

                (if (eq ?k-value "medium")
                then
                    (bind ?k-repl 50)
                else

                    (if (eq ?k-value "high")
                    then
                        (bind ?k-repl 50)
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

(defrule natural-pastures-grasses-an-pn

    ?f-forage <- (forage "natural-pastures-grasses")
    ?f-perene <- (perene ?pr)
    
    =>

    (if (= (pr 1))
    then
        (printout t "Aplicar a dose total de P e K por ocasiao da semeadura\
        ")
    else
        (printout t "A reposicao de P e K deve ser feita no inicio do outono\
        ")
    )
)
