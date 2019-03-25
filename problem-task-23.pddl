(define (problem waiting-XX) ;; Replace XX with task number
    (:domain waiting)
    (:objects 
        UF - location
        TU - location
        UB - location
        MB - location
        MF - location
        LB - location
        LF - location
        
        Plate1 - plate
        Plate2 - plate
        Customer1 - customer
        Customer2 - customer
    )
    
    (:init
        (adj BUFF UF)
        (adj UF UB)
        (adj UB MB)
        (adj LB MB) 
        (adj LB LF)
        (adj LF MF)
        (adj MF UF)
        
        (at Agent MF)
        (at Plate1 MB)
        (at Plate2 LB)
        (at Customer1 UB)
        (at Customer2 LF)
    )
    
    (:goal (and 
        (served Customer1)
        (served Customer2)
        (at Agent BUFF)
        ;(hasfood Plate)
        ;(holdplate Agent Plate)
        ;(at Agent LF)
    ))
)
