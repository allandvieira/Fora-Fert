(load "forage_corn_sorghum.clp")

(assert (forage "corn-sorghum"))
;(assert (p-value "very-low"))
;(assert (k-value "very-low"))
(assert (first-planting 1))
;(assert (organic-matter 1.5))
(assert (use-type 1))
(assert (ph 5.9))

(run)
(exit)
