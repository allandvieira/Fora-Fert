;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Functions

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



(defrule forage-alfaca-p
    ?f-forage <- (forage "alfafa")
    ?f-p-value <- (p-value ?p-value)

    =>

    (printout t (about))
    (printout t (n-recommendation))
    (printout t (s-recommendation))
    (printout t (b-recommendation))
)


