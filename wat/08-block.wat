;; wat2wasm 08-block.wat

(module

    (func $factorial (param $n i32) (result i32)
        (local $sum i32)

        (block $block_1
            ;; if n <= 0
            local.get $n
            i32.const 0
            i32.le_s

            ;; Then jump to end
            br_if $block_1
            ;; NOTE: `br_if` works differently for `block` and `loop`
            ;; `block` => Jumps to the end of the block
            ;; `loop` => Jumps to the start of the loop

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
            )
        )
        ;; NOTE: You can calso write `block` with `end` instead of using brackets

        local.get $sum
    )
)