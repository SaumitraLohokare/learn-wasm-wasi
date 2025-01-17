;; wat2wasm 05-memory.wat

(module

    ;; Create a new memory called $mem1 of size 1 Page (64Kb)
    (memory $mem1 1)

    ;; In $mem1, at offset 0, Store the string "Hello, World!"
    (data $mem1 (i32.const 0) "Hello, World!")

    ;; In $mem1, at offset 13, Store a 4 byte number (42)
    (data $mem1 (i32.const 13) "\2A\00\00\00")

    ;; NOTE: 
    ;; 42 == 0x2A

    ;; NOTE:
    ;; WASM uses little-endian format.

    (func $loadMemory (result i32)
    
        ;; Load an i32 from memory location 13
        i32.const 13
        i32.load
    
    )

    (func $storeMemory (param $num i32)
    
        ;; Store $num as i32 at memory location 17
        i32.const 17
        local.get $num
        i32.store
    
    )

    ;; NOTE: Multi Memory
    ;; WASM has support for multiple memories.
    ;; Eg:
    ;;     (memory $mem1 2)
    ;;     (memory $mem2 1)
    ;;
    ;;     (data $mem1 (i32.const 0) "Hello!")
    ;;     (data $mem2 (i32.const 0) "Hey!")
    ;;
    ;;     i32.load (memory $mem1)
    ;;     i32.store (memory $mem2)
    ;;
    ;; To enable multi-memory support include the `--enable-multi-memory` flag
    ;; Eg: wat2wasm 05-memory.wat --enable-multi-memory

)