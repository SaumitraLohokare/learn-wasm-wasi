;; wat2wasm 03-locals.wat

(module

    (func $foo ;; param and result is optional
        (local $res i32)
        ;; Defines a local called $res of type i32
        ;; All locals used in a function must be declared before the body of the function

        ;; Set the value of $res to 0
        ;; NOTE: This is optional as all locals start with 
        ;;       a default value of 0.
        i32.const 0
        local.set $res
        
        ;; Put the value of $res on the stack
        local.get $res
        i32.const 42

        ;; Add $res and 42
        i32.add

        ;; Set the value of $res to the result of the addition
        local.set $res
    )

)