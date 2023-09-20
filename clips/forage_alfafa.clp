(defrule forage_alfaca
    (forage "alfafa")

    =>

    ?f <- (p_value ?phosph)
    (test (cond
        ((= ?phosph "very_low") => (bind ?p-recon "195"))
        ((= ?phosph "low") => (bind ?p-recon "135"))
        ((= ?phosph "medium") => (bind ?p-recon "125"))
        ((= ?phosph "high") => (bind ?p-recon "85"))
    ))

    ?f <- (k_value ?potass)
    (test (cond
        ((= ?potass "very_low") (bind ?k-recon "330"))
        ((= ?potass "low") (bind ?k-recon "290"))
        ((= ?potass "medium") (bind ?k-recon "280"))
        ((= ?potass "high") (bind ?k-recon "250"))
    ))
    


)

