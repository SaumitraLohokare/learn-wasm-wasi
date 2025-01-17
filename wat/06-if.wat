;; wat2wasm 06-if.wat

(module

    (memory 1)
    (data (i32.const 0) "Even")
    (data (i32.const 4) "Odd")

    ;; Function to return "Even" or "Odd" strings depending on param $n
    (func $OddOrEven (param $n i32) (result i32) (result i32)
        ;;                           ^            ^
        ;;                           String addr  String len
    
        local.get $n
        i32.const 2

        i32.rem_u

        i32.eqz

        ;; An if statement
        (if 
            (result i32 i32) ;; This is type annotation that says that this if statement
                             ;; should place two i32's on the stack after it's execution
            (then

                i32.const 0 ;; String addr
                i32.const 4 ;; String len

            )
            (else

                i32.const 4 ;; String addr
                i32.const 3 ;; String len

            )
        )

        ;; Alternative way to write if

        ;; if (result i32 i32)
        ;;
        ;;     i32.const 0
        ;;     i32.const 4
        ;;
        ;; else
        ;;
        ;;     i32.const 4
        ;;     i32.const 3
        ;;
        ;; end
    )
)