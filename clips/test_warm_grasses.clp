(load "forage_grasses_warm_season.clp")

(assert (forage "warm-grasses"))
(assert (p-value "very-low"))
(assert (k-value "very-low"))
(assert (first-planting 1))
(assert (ph 5.9))

(run)
(exit)
