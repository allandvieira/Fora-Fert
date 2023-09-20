(load "forage_natural_pastures.clp")

(assert (forage "natural-pastures"))
(assert (p-value "very-low"))
(assert (k-value "very-low"))
(assert (first-planting 1))

(assert (ph 5.9))

(run)
(exit)



