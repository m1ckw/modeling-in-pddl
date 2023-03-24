
(define (domain secredoku)

    (:requirements :strips :typing :negative-preconditions)
    (:types loc num direction)

    (:constants
        num0 num1 num2 num3 num4 num5 num6 num7 num8 num9 num10 num11 num12 num13 num14 num15 num16 - num
        l11 l12 l13 l14 l21 l22 l23 l24 l31 l32 l33 l34 l41 l42 l43 l44 - loc
    )

    (:predicates
        (solved ?l - loc)
        (assigned ?l - loc ?n - num)
        (at ?l - loc)
        (link ?l1 ?l2 - loc)
        (check-count ?n) ; Number of checks done
        (teleport-count ?n) ; Number of teleports done
        (succ ?n1 ?n2 - num) ; For counting
        (can-check ?l - loc) ; Flag to enable checking
        (even ?l - loc) ; Location has an even number
    )


    ; Check sensor to see if a location is assigned a number
    ;  Can only be done if at the location and not already solved.
    ;  Also need to have "can-check" flag set.
    (:action check
        :parameters (?loc - loc ?n - num)
        :precondition (and
            (at ?loc)
            (not (solved ?loc))
            (can-check ?loc)
        )
        :observe (assigned ?loc ?n)
    )

    ; Keeps track of the number of checks done. Must be at the
    ;  location, not already can-check, numbers are successors,
    ;  and the check-count is ?n1 but not already num4 (max count).
    (:action setup-check
        :parameters (?loc - loc ?n1 ?n2 - num)
        :precondition (and
            (at ?loc)
            (not (can-check ?loc))
            (succ ?n1 ?n2)
            (check-count ?n1)
            (not (check-count num5)) ; try 5 down to 2 observing when it breaks
        )
        :effect (and
            (check-count ?n2)
            (not (check-count ?n1))
            (can-check ?loc)
        )
    )

    ; Sense if the location is an even number (must be at the location)
    (:action evenodd
        :parameters (?loc - loc)
        :precondition (at ?loc)
        :observe (even ?loc)
    )

    ; Typical move action
    (:action move
        :parameters (?l1 ?l2 - loc)
        :precondition (and
            (at ?l1)
            (link ?l1 ?l2)
        )
        :effect (and
            (at ?l2)
            (not (at ?l1))
        )
    )

    ; Teleport action taking us immediately from one location to
    ;  another. Also keep track of the number of teleports done,
    ;  and cap it at just one.
    (:action teleport
        :parameters (?l1 ?l2 - loc ?n1 ?n2 - num)
        :precondition (and
            (at ?l1)
            (succ ?n1 ?n2)
            (teleport-count ?n1)
            (not (teleport-count num1))
        )
        :effect (and
            (at ?l2)
            (not (at ?l1))
            (not (teleport-count ?n1))
            (teleport-count ?n2)
        )
    )

    ; Solve a location if we know the number there
    (:action solve
        :parameters (?loc - loc ?n - num)
        :precondition (assigned ?loc ?n)
        :effect (solved ?loc)
    )

)
