(define (problem v4)

    (:domain music-v4)

    (:objects
        z_eighth z_quarter z_half z_whole - length
        y_Gmaj y_Dmaj y_Emin y_Cmaj - chord
        c csh d dsh e f fsh g gsh a ash b - pitch
    )

    (:init

        (= (note-length z_eighth) 0.5)
        (= (note-length z_quarter) 1)
        (= (note-length z_half) 2)
        (= (note-length z_whole) 4)

        (= (melody-count) 0)
        (= (melody-length) 0)

        (= (note-count c) 0)
        (= (note-count csh) 0)
        (= (note-count d) 0)
        (= (note-count dsh) 0)
        (= (note-count e) 0)
        (= (note-count f) 0)
        (= (note-count fsh) 0)
        (= (note-count g) 0)
        (= (note-count gsh) 0)
        (= (note-count a) 0)
        (= (note-count ash) 0)
        (= (note-count b) 0)

        (= (duration-count z_eighth) 0)
        (= (duration-count z_quarter) 0)
        (= (duration-count z_half) 0)
        (= (duration-count z_whole) 0)

        (= (max-duration-count) 4)
        (= (max-note-count) 2)

        (= (chord-count) 0)
        (= (max-chord-count) 8)

        (= (max-cheats-per-chord) 2)
        (= (cheats) 0)

        (note-in g y_Gmaj)
        (note-in b y_Gmaj)
        (note-in d y_Gmaj)

        (note-in d y_Dmaj)
        (note-in fsh y_Dmaj)
        (note-in a y_Dmaj)

        (note-in e y_Emin)
        (note-in g y_Emin)
        (note-in b y_Emin)

        (note-in c y_Cmaj)
        (note-in e y_Cmaj)
        (note-in g y_Cmaj)

        (chord-change silence y_Gmaj)
        (chord-change y_Gmaj y_Dmaj)
        (chord-change y_Dmaj y_Emin)
        (chord-change y_Emin y_Cmaj)

        (not-playing)
        (not-chording)

        (current-chord silence)

    )

    (:goal (and

        (>= (chord-count) 4)

        (<= (melody-count) 20)
        (>= (melody-count) 10)

        (>= (melody-length) 8)
        (<= (melody-length) 16)

    ))

)
