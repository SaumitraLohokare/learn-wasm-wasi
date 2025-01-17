;; wat2wasm 07-loop.wat

(module

    (func $factorial (param $n i32) (result i32)
        (local $sum i32)

        ;; if n <= 0
        local.get $n
        i32.const 0
        i32.le_s

        ;; then return 0
        if 
            i32.const 0
            return
        end

        (loop $loop_1
        
            ;; $sum = $sum + $n
            local.get $n
            local.get $sum
            i32.add
            local.set $sum

            ;; $n = $n - 1
            local.get $n
            i32.const 1
            i32.sub
            local.tee $n    ;; `tee` does `set` followed by `get`

            ;; loop again if n != 0
            i32.const 0
            i32.gt_s
            br_if $loop_1

            ;; NOTE: Loop does not automatically re-run it's body.
            ;; `br-if` must be used to branch back to the start of the loop.
            ;; This is also how you would implement a `continue` instruction
            ;; like in C.
        
        ) 
        ;; NOTE: You can also write `loop` using `end` instead of using brackets

        local.get $sum
    )
)