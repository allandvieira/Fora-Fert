(load "forage_intercropping_cool_season.clp")

(assert (forage "intercrop-cool"))
(assert (p-value "very-low"))
(assert (k-value "very-low"))
(assert (first-planting 1))

(assert (ph 5.9))

(run)
(exit)


