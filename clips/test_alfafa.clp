(load "forage_alfafa.clp")

(assert (forage "alfafa"))
(assert (p-value "very-low"))
(assert (k-value "very-low"))
(assert (first-planting 1))
(assert (ph 5.9))
(run)
(exit)

