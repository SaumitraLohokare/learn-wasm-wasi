;; wat2wasm 04-globals.wat

(module

    ;; ==== Creating Globals ====

    ;; NOTE: Globals MUST be given an initial value

    ;; Define an immutable global variable called $PI of type f32
    ;; with initial value 3.14
    (global $PI f32 (f32.const 3.14))

    ;; Define a mutable global variable called $counter of type i32
    ;; with initial value 0
    (global $counter (mut i32) (i32.const 0))


    ;; ==== Using Globals ====

    ;; Function to return the value of $PI
    (func $whatIsPi (result f32)

        ;; Push the value of $PI on the stack
        global.get $PI
        
        ;; You can also write this as `global.get 0`
        ;; because $PI is the first global that was defined
    )

    ;; Function to increment $counter by 1
    (func $incrementCounter 
    
        global.get $counter
        i32.const 1

        i32.add

        ;; Update the value of $counter with the value
        ;; on the top of the stack
        global.set $counter
    
    )
)