(define (domain shuttle2)

    (:requirements :equality :negative-preconditions :typing :adl)

    (:types
        locateable location - object
        car person - locateable
        av mv - car
    )

    (:predicates
        (at ?obj - locateable ?loc - location)
        (in ?per - person ?car - car)
        (link ?loc1 ?loc2 - location)
        (destination ?per - person ?loc - location)
    )

    ; Move manual car from one location to another
    (:action move

        :parameters (?car - mv ?loc1 ?loc2 - location)

        :precondition (and
            (at ?car ?loc1)
            (link ?loc1 ?loc2)
        )

        :effect (and
            (not (at ?car ?loc1))
            (at ?car ?loc2)
        )
    )

    ; One person gets in a manual car
    (:action getin

        :parameters (?per - person ?car - mv ?loc - location)

        :precondition (and
            ; TODO: Car and person at the same location.
        )

        :effect (and
            ; TODO: Person now in the car.
        )
    )

    ; One person gets out of a manual car
    (:action getout

        :parameters (?per - person ?car - mv ?loc - location)

        :precondition (and
            ; TODO: Person in the car at the location.
        )

        :effect (and
            ; TODO: Person now at the location.
        )
    )

)
