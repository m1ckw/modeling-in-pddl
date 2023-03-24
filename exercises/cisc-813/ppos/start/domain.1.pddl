
(define (domain secredoku)

    (:requirements :strips :typing)
    (:types loc num)

    (:constants
        num1 num2 num3 num4 - num
        l11 l12 l21 l22 - loc
    )

    (:predicates
        (solved ?l - loc)
        (assigned ?l - loc ?n - num)
    )

    ; Check if the assigned value of a location is a particular number
    (:action check
        ; TODO: :parameters and :observe
    )

    ; Sove the location if we know its value
    (:action solve
        :parameters (?loc - loc ?n - num)
        ; TODO: :precondition and :effect
    )

)
