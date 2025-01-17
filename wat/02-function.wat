;; wat2wasm 02-function.wat

(module

    ;; A function can take any number of parameters.
    ;; and can return any number of values.

    ;; Creates a function called $add
    ;; Takes in two parameters ($a & $b) of type i32
    ;; Returns an i32
    (func $add (param $a i32) (param $b i32) (result i32)
        local.get $a
        local.get $b
        ;; Push the arguments on the stack

        ;; Remember naming things in WAT is always optional
        ;; If you don't want to name things, you can use 0-based
        ;; indexing to access it
        ;; Eg:
        ;;   local.get $a  => local.get 0
        ;;   local.get $b  => local.get 1

        i32.add
        ;; i32.add takes two values from the top of the stack, 
        ;; adds them and places the result back on the stack

        return 
        ;; This is optional, functions automatically return at the end.
        ;; However, this is useful when you want to return from the function early

        ;; The value at the top of the stack is returned
    )

    ;; A function to swap the values using multi value return
    (func $swap (param $a i32) (param $b i32) (result i32) (result i32)
    
        local.get $b
        local.get $a
    
    )

)