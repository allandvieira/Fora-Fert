;;;;;;;(deffunction generate-recommendation (?forage ?soilPLevel)
;;;;;;;    (if (eq ?forage "alfafa")
;;;;;;;        then
;;;;;;;                    ;(bind ?recommendationMessage "Sobre a Alfafa: A alfafa pode ser implantada sozinha ou em consórcio com outras espécies forrageiras. "
;;;;;;;                    ;"Ela é altamente sensível à acidez do solo, portanto, a calagem deve ser feita com atenção especial, considerando a quantidade e a profundidade de incorporação do calcário. "
;;;;;;;                    ;"É crucial realizar um plantio denso e preparar o solo adequadamente para garantir uma população de plantas saudável, capaz de competir com as ervas daninhas. "
;;;;;;;                    ;"A longevidade do alfavé, em grande parte, da manutenção dos níveis apropriados de nutrientes no solo e do manejo adequado. "
;;;;;;;                    ;"Além de ser usada para corte, seja para produção de feno ou fornecimento de forragem fresca, a alfafa pode ser uma opção para pastejo, seja em cultivo exclusivo ou em consórcio com gramíneas. "
;;;;;;;                    ;"No entanto, ao fazer isso, é importante atender às necessidades das diferentes espécies e estar ciente dos possíveis riscos de timpanismo nos animais. "
;;;;;;;                    ;"Nitrogênio: Realizar a inoculação das sementes com o rizóbio específico. Fazer a adubação nitrogenada somente se for constatada a ineficiência da inoculação. "
;;;;;;;                    ;"Nesse caso, aplicar de 20 a 40 kg de N/ha após cada corte, dependendo do desenvolvimento da cultura. "
;;;;;;;                    ;"Reposicao de Fósforo:")
;;;;;;;                    ; TODO("Arrumar para fora desta funcao depois)
;;;;;;;
;;;;;;;        (cond
;;;;;;;            ((eq ?soilPLevel "very_low") 
;;;;;;;                (bind ?recommendationMessage (str-cat ?recommendationMessage " 195 kg de P2O5/ha. ")))
;;;;;;;            ((eq ?soilPLevel "low") 
;;;;;;;                (bind ?recommendationMessage (str-cat ?recommendationMessage " 135 kg de P2O5/ha. ")))
;;;;;;;            ((eq ?soilPLevel "medium") 
;;;;;;;                (bind ?recommendationMessage (str-cat ?recommendationMessage " 125 kg de P2O5/ha. ")))
;;;;;;;            ((eq ?soilPLevel "high") 
;;;;;;;                (bind ?recommendationMessage (str-cat ?recommendationMessage " 85 kg de P2O5/ha. ")))
;;;;;;;        )
;;;;;;;
;;;;;;;        (bind ?recommendationMessage (str-cat ?recommendationMessage "Reposicao de Potássio:"))
;;;;;;;
;;;;;;;        (cond
;;;;;;;            ((eq ?soilPLevel "very_low") 
;;;;;;;                (bind ?recommendationMessage (str-cat ?recommendationMessage " 330 kg de K2O/ha. ")))
;;;;;;;            ((eq ?soilPLevel "low") 
;;;;;;;                (bind ?recommendationMessage (str-cat ?recommendationMessage " 290 kg de K2O/ha. ")))
;;;;;;;            ((eq ?soilPLevel "medium") 
;;;;;;;                (bind ?recommendationMessage (str-cat ?recommendationMessage " 280 kg de K2O/ha. ")))
;;;;;;;            ((eq ?soilPLevel "high") 
;;;;;;;                (bind ?recommendationMessage (str-cat ?recommendationMessage " 250 kg de K2O/ha. ")))
;;;;;;;        )
;;;;;;;    
;;;;;;;
;;;;;;;    ); ALFAFA
;;;;;;;
;;;;;;;    ; Outros tipos de forrage
;;;;;;;    else
;;;;;;;        (bind ?recommendationMessage "Recomendacao para outros.")
;;;;;;;    
;;;;;;;    (assert (recommendation ?recommendationMessage))
;;;;;;;)
;;;;;;;

; break this function in others by kind of forage
; attr values like phosphorusValue = calcAlfafaP().

(deffunction generate-recommendation (?forage ?soilPLevel ?soilKLevel ?firstPlanting)
    (bind ?phosphorusUnit "kg de P2O5/ha. ")
    (bind ?potassiumUnit "kg de K2O/ha. ")

    (if (eq ?forage "alfafa")
        then
        (bind ?phosphorusValue
            (cond
                ((eq ?soilPLevel "very_low") 195)
                ((eq ?soilPLevel "low") 135)
                ((eq ?soilPLevel "medium") 125)
                ((eq ?soilPLevel "high") 85)
                ((eq ?soilPLevel "very_high") 0)
            )
        )

        (bind ?potassiumValue
            (cond
                ((eq ?soilKLevel "very_low") 330)
                ((eq ?soilKLevel "low") 290)
                ((eq ?soilKLevel "medium") 280)
                ((eq ?soilKLevel "high") 250)
                ((eq ?soilKLevel "very_high") 0)
            )
        )

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;;;;;;;;;;;;;; README LATTER ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ; make generic value, attr message after. If first plant, decrease/increase calue in percent. reply this work for others forages
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        (bind ?recommendationMessage "Reposicao de Fósforo: " ?phosphorusValue ?phosphorusUnit "Reposicao de Potássio: " ?potassiumValue ?potassiumUnit)
    )
    (else
        (if (eq ?forage "GRAMÍNEAS DE ESTAÇÃO FRIA")
            then
            (bind ?phosphorusValue
                (cond
                    ((eq ?soilPLevel "very_low") 170)
                    ((eq ?soilPLevel "low") 110)
                    ((eq ?soilPLevel "medium") 100)
                    ((eq ?soilPLevel "high") 60)
                )
            )

            (bind ?potassiumValue
                (cond
                    ((eq ?soilKLevel "very_low") 140)
                    ((eq ?soilKLevel "low") 100)
                    ((eq ?soilKLevel "medium") 90)
                    ((eq ?soilKLevel "high") 60)
                )
            )

            (bind ?recommendationMessage "Reposicao de Fósforo: " ?phosphorusValue ?phosphorusUnit "Reposicao de Potássio: " ?potassiumValue ?potassiumUnit)
        )
        (else
            (bind ?recommendationMessage "Recomendacao para outros.")
        )
    )

    (if (eq ?first-planting "yes")
        then
        (bind ?recommendationMessage (str-cat ?recommendationMessage ?phosphorusValue ?phosphorusUnit ?potassiumValue ?potassiumUnit))
    )

    (assert (recommendation ?recommendationMessage))
)



(defrule get-recommendation
    (not (recommendation ?message))
    ?f2 <- (forage (forage ?forage))
    =>
    (bind ?recommendationMessage (generate-recommendation ?forage))
    (assert (recommendation ?recommendationMessage))
)

(defrule print-recommendation
    ?f <- (recommendation ?message)
    =>
    (printout t "Recomendacao: " ?message crlf)
    (retract ?f)
)

