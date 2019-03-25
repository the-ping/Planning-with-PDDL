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
        
        Plate - plate
        Customer - customer
    )
    
    (:init
        (adj BUFF UF)
        (adj UF UB)
        (adj UB MB)
        (adj LB MB) 
        (adj LB LF)
        (adj LF MF)
        (adj MF UF)
        
        (at Agent BUFF)
        (at Plate BUFF)
        (at Customer LB)
        ;(holdplate Agent Plate)
    )
    
    (:goal (and 
        (served Customer)
        ;(hasfood Plate)
        ;(holdplate Agent Plate)
        ;(at Agent LF)
    ))
)
