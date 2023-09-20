(deffunction about()
    (return "
    PASTAGENS NATURAIS (NATIVAS OU NATURALIZADAS) \
        As pastagens naturais incluem os “campos nativos” e as pastagens naturalizadas, resultantes da revegetação de áreas previamente utilizadas para outras finalidades (culturas ou mesmo pastagens anuais). A expressão de seu potencial produtivo depende de práticas adequadas de manejo, incluindo a melhoria da fertilidade do solo. Para tanto, é essencial o conhecimento do tipo de pastagem disponível e o potencial de resposta. A caracterização geral dessas formações é difícil devido à ocorrência de um grande número de espécies, muitas vezes representadas por diferentes ecotipos. Do ponto de vista funcional, há uma grande variabilidade na produtividade, tanto no tempo quanto no espaço (Nabinger et al., 2000). No tempo, as variações são determinadas pelas condições meteorológicas. No espaço, a produtividade forrageira está diretamente relacionada às características físicas e químicas e ao relevo dos solos. Os fatores edáficos determinam grandes variações na composição botânica e na produtividade, em função da dominância de algumas espécies, adaptadas às condições predominantes de solo.
Para a decisão de utilização de áreas sob pastagem natural, em Nabinger et al. (2000) é apresentada uma descrição resumida dos campos e agroecossistemas com a utilização de forrageiras das principais regiões fisiográficas dos Estados do Rio Grande do Sul e de Santa Catarina e dos sistemas produtivos utilizados com forrageiras. Os campos com predominância de espécies de melhor qualidade, como as do gênero Paspalum, apresentam boa resposta à melhoria da fertilidade e propiciam produção animal comparável às melhores pastagens cultivadas de verão, com a vantagem de não apresentarem os riscos inerentes à fase de estabelecimento das pastagens. Neste tipo de campo, as respostas à correção do solo e à adubação têm sido economicamente viáveis, desde que as demais práticas de manejo sejam corretamente adotadas.\
        \ 
        "
    )

)

(deffunction n-message()
    (return "
    Reposicao de nitrogenio:\
            O nitrogênio é o principal fator que restringe o potencial produtivo das pastagens naturais. Para essas pastagens, aplicações em cobertura têm apresentado altas respostas produtivas e econômicas, comparáveis às obtidas com pastagens cultivadas de verão. A eficiência de uso de nitrogênio depende da correção das demais deficiências do solo, principalmente dos baixos teores de cálcio, magnésio e fósforo disponível, bem como das condições climáticas e do manejo da pastagem.\
\
    ")
)



(defrule natural-pastures
    ?f-forage <- (forage "natural-pastures")

    =>

    (printout t (about))
    (printout t (n-message))
    (assert (header-done))
)


(defrule natural-pastures-p
    ?f-header-done <- (header-done)

    ?f-forage <- (forage "natural-pastures")
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


(defrule natural-pastures-k
    ?f-forage <- (forage "natural-pastures")
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

(defrule natural-pastures-an-pn

    ?f-forage <- (forage "natural-pastures")
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
