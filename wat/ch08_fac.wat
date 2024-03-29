(module
  (start $main)
  (func $main (export "main")
    (call $assert_eq_i64 (call $fac (i64.const 25)) (i64.const 7034535277573963776))
  )
  (func $assert_eq_i64 (param i64 i64)
    (if
      (i64.ne (local.get 0) (local.get 1))
      (then unreachable)
    )
  )
  ;; Iterative factorial without locals.
  (func $pick0 (param i64) (result i64 i64)
    (local.get 0) (local.get 0)
  )
  (func $pick1 (param i64 i64) (result i64 i64 i64)
    (local.get 0) (local.get 1) (local.get 0)
  )
  (func $fac (param i64) (result i64)
    (i64.const 1) (local.get 0)
    (loop $l (param i64 i64) (result i64)
      (call $pick1) (call $pick1) (i64.mul)
      (call $pick1) (i64.const 1) (i64.sub)
      (call $pick0) (i64.const 0) (i64.gt_u)
      (br_if $l)
      (drop) (return)
    )
  )
)