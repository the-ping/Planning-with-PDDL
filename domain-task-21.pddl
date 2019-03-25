(define (domain waiting)
    (:requirements :adl )
    
    (:types
        waiter plate customer - something
        location
        
        
    )
    
    (:constants 
        ;; You should not need to add any additional constants
        Agent - waiter
        BUFF - location
    )
    
    (:predicates
        (at ?s - something ?l - location)
        (adj ?l1 -location ?l2 - location)
        (holdplate ?p - plate) ;is waiter holding a plate
        (hasfood ?p - plate) ;does this plate have food
        (served ?c - customer)
    )
   
    
    (:action MOVE
        :parameters (?l1 - location ?l2 - location) ;waiter moves from l1 to l2
        :precondition (and 
            (at Agent ?l1) 
            (not (= ?l1 ?l2)) 
            (or (adj ?l1 ?l2) (adj ?l2 ?l1))
        )
        :effect (and 
            (not (at Agent ?l1)) 
            (at Agent ?l2)
        )
    )
    
    
    (:action PICK-UP-PLATE
        :parameters (?p - plate ?l - location) ;waiter picks up plate at this location
        :precondition (and
            (not (holdplate ?p))
            (at Agent ?l)
            (at ?p ?l)
        )
        :effect (and
            (holdplate ?p)
            (not (at ?p ?l))
        )
    )
    
    (:action FILL
        :parameters (?p - plate) ;waiter fills up plate at BUFF only
        :precondition (and
            (holdplate ?p)
            (not (hasfood ?p))
            (at Agent BUFF)
        )
        :effect (and
            (hasfood ?p)
        )
    )
    
    (:action HAND-OVER-PLATE
        :parameters (?p - plate ?c - customer ?l - location) ;waiter fills up plate at BUFF only
        :precondition (and
            (holdplate ?p)
            (hasfood ?p)
            (at Agent ?l)
            (at ?c ?l)
            (not (served ?c))
        )
        :effect (and
            (served ?c)
            (not (holdplate ?p))
        )
    )
    
)
