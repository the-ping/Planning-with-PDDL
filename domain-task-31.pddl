(define (domain waiting)
    (:requirements :adl )
    
    (:types
        
        brokenplate food - dirt
        waiter 
        plate broom - holdable 
        customer
        location
        
    )
    
    (:constants 
        ;; You should not need to add any additional constants
        Agent - waiter
        BUFF - location
    )
    
    (:predicates
        (at ?o - object ?l - location)
        (adj ?l1 -location ?l2 - location)
        (hold ?s - holdable) ;is waiter holding sth
        (hasfood ?p - plate) ;does this plate have food
        (served ?c - customer)
    )
   
    (:action PUTDOWN
        :parameters (?s - holdable ?l - location)
        :precondition (and
            (hold ?s)
            (at Agent ?l)
            
        )
        :effect (and
            (not (hold ?s))
            (at ?s ?l)
        )
    )
    
    (:action PICK-UP
        :parameters (?s - holdable ?l - location)
        :precondition (and
            (not (exists (?z - holdable) (hold ?z)))
            (at Agent ?l)
            (at ?s ?l)
        )
        :effect (and
            (hold ?s)
        )
    )
   
    (:action SWEEP
        :parameters (?l2 - location ?z - dirt) ;sweep here
        :precondition (and
            (exists (?b - broom) (hold ?b))
            (at ?z ?l2) ;bp or food dropped here
            (exists (?l1 - location) (and 
                                        (at Agent ?l1)
                                        (not (= ?l1 ?l2))
                                        (or (adj ?l1 ?l2) (adj ?l2 ?l1))))
        )
        :effect (and
            (not (at ?z ?l2))
        )
    )
    
    (:action MOVE
        :parameters (?l1 - location ?l2 - location) ;waiter moves from l1 to l2
        :precondition (and 
            (at Agent ?l1) 
            (not (= ?l1 ?l2)) 
            (or (adj ?l1 ?l2) (adj ?l2 ?l1))
            (not (exists (?bp - brokenplate) (at ?bp ?l2))) ;given that theres no broken plate in the way
        )
        :effect (and 
            (not (at Agent ?l1)) 
            (at Agent ?l2)
        )
    )
    
    
    (:action FILL
        :parameters (?p - plate) ;waiter fills up plate at BUFF only
        :precondition (and
            (hold ?p)
            (not (hasfood ?p))
            (at Agent BUFF)
        )
        :effect (and
            (hasfood ?p)
        )
    )
    
    (:action HAND-OVER-PLATE
        :parameters (?p - plate ?c - customer ?l - location) ;waiter handsplate to customer, theyre served
        :precondition (and
            (hold ?p)
            (hasfood ?p)
            (at Agent ?l)
            (at ?c ?l)
            (not (served ?c))
        )
        :effect (and
            (served ?c)
            (not (hold ?p))
        )
    )
    
)
