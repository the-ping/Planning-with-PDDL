(define (problem waiting-32) ;; Replace XX with task number
    (:domain waiting)
    (:objects 
        UF - location
        UB - location
        MB - location
        MF - location
        LB - location
        LF - location
        
        Plate - plate
        BPlate - brokenplate
        Customer - customer
        Broom - broom
        Food - food
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
        (at Broom UB)
        (at BPlate MB)
        (at BPlate MF)
        (at Food UF)
    )
    
    (:goal (and
        (at Agent BUFF)
        (served Customer)
        (forall (?z - location ?d - dirt) (not (at ?d ?z)))
    ))
)
