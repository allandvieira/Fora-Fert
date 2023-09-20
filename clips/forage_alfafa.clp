(deffunction about()
    (return "
    Sobre a Alfafa:\
        A alfafa pode ser implantada sozinha ou em consorcio com outras especies forrageiras. Ela eh altamente sensivel ha acidez do solo, portanto, a calgem deve ser feita com atencao especial, considerando a quantidade e a profundidade de incorporacao do calcario. Eh crucial realizar um plantio denso e prepararr o solo adequadamente para garantir uma populacao de plantas saudaveis, capar de competir com as ervas daninhas.\
        A longevidade da alfafa depende, em grande arte, de manutencao dos niveis apropriados de nutrientes no solo e do manejo adequado. Alem de ser usada para corte, seja para producao de feno ou fornecimento de forragem fresca, a alfafa podee ser uma opcao para pastejo, seja em cultivo exclusivo ou em consorcio com gramineas. No entanto, ao fazer isso, eh importante atender has necessidades das diferentes especies e estar ciente dos possieis riscos de timpanismo no animais.\
        \ 
        "
    )

)

(deffunction n-recommendation()
    (return
        "
    Reposicao de nitrogenio:\
        Realizar a inoculação das sementes com o rizóbio específico. Fazer a adubação nitrogenada somente se for constatada a ineficiência da inoculação. Nesse caso, aplicar de 20 a 40 kg de N/ha após cada corte, dependendo do desenvolvimento da cultura.\
        \
        "
    )
    
)

(deffunction s-recommendation()
    (return "
    Reposicao de Enxofre: \
        A cada dois anos, priorizar a aplicação de fertilizantes fosfatados que contenham S (como o superfosfato simples) ou outra fonte deste nutriente. A aplicação periódica, a cada dois anos, de 60 a 80 kg de S/ha é suficiente para atender a demanda da cultura. A reposição deste nutriente é também plenamente atendida quando são utilizados adubos orgânicos. No caso da alfafa sob exploração intensiva, a utilização de gesso agrícola pode, além de suprir S, favorecer o aprofundamento das raízes, o que é importante em situações de deficiência hídrica.\
        \
    ")
    
)

(deffunction b-recommendation()
    (return "
    Reposicao de Boro: \
         Aplicar via solo, 2,5 kg de B por hectare antes da semeadura, preferencialmente incorporado, repetindo esta dose anualmente, no início da primavera, a lanço em superfície. Por ser uma cultura perene, fontes de B de menor solubilidade podem ser utilizadas.\
        \
    ")
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RULES:


(defrule forage-alfafa
    ?f-forage <- (forage "alfafa")

    =>

    (printout t (about))
    (printout t (n-recommendation))
    (printout t (s-recommendation))
    (printout t (b-recommendation))
    (assert (header-done))
)


(defrule forage-alfaca-p
    ?f-forage <- (forage "alfafa")
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


(defrule forage-alfafa-k
    ?f-forage <- (forage "alfafa")
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

(defrule forage-alfafa-liming
    ?f-forage <- (forage "alfafa")
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
