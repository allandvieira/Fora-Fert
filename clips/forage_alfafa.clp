;
;(defrule forage-alfaca
;    ?f-forage <- (forage "alfafa")
;    ?f-p-value <- (p-value ?p-value)
;    ?f-k-value <- (k-value ?k-value)
;    ?f-first-planting <- (first-planting ?first-planting)
;
;
;    =>
;
;
;    (bind ?p-message "Recomendacao de Fosforo: (kg de P2O5/ha) ")
;    (bind ?p-recon 0)
;    (bind ?k-recon 0)
;
;    (cond
;        ((= ?phosph "very_low") => (bind ?p-recon "195"))
;        ((= ?phosph "low") => (bind ?p-recon "135"))
;        ((= ?phosph "medium") => (bind ?p-recon "125"))
;        ((= ?phosph "high") => (bind ?p-recon "85"))
;    )
;
;    (cond
;        ((= ?potass "very_low") (bind ?k-recon "330"))
;        ((= ?potass "low") (bind ?k-recon "290"))
;        ((= ?potass "medium") (bind ?k-recon "280"))
;        ((= ?potass "high") (bind ?k-recon "250"))
;    )
;    (printout t ?p-message " " ?p-recon crlf)
;
;)
;

(defrule forage-alfaca
    ?f-forage <- (forage "alfafa")

    =>

    (printout t about())
    (printout t n-recommendation())
    (printout t s-recommendation())
)



(defrule forage-alfaca-p
    ?f-forage <- (forage "alfafa")
    ?f-p-value <- (p-value ?p-value)
    ?f-info-incomplete <- (info-state "incomplete")
    =>
)


;    ?f-p-value <- (p-value ?p-value)
;    ?f-k-value <- (k-value ?k-value)

(deffunction about()
    (return "
        Sobre a Alfafa:" crlf
        "A alfafa pode ser implantada sozinha ou em consorcio com outras especies forrageiras. Ela eh altamente sensivel ha acidez do solo, portanto, a calgem deve ser feita com atencao especial, considerando a quantidade e a profundidade de incorporacao do calcario. Eh crucial realizar um plantio denso e prepararr o solo adequadamente para garantir uma populacao de plantas saudaveis, capar de competir com as ervas daninhas." crlf
        "A longevidade da alfafa depende, em grande arte, de manutencao dos niveis apropriados de nutrientes no solo e do manejo adequado. Alem de ser usada para corte, seja para producao de feno ou fornecimento de forragem fresca, a alfafa podee ser uma opcao para pastejo, seja em cultivo exclusivo ou em consorcio com gramineas. No entanto, ao fazer isso, eh importante atender has necessidades das diferentes especies e estar ciente dos possieis riscos de timpanismo no animais."
        crlf crlf
    )
)

(deffunction n-recommendation()
    (return
        
        
    )
    
)

(deffunction s-recommendation()
    
)
