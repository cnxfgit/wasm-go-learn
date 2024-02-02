(module
  (import "env" "assert_true"   (func $assert_true   (param i32)))
  (import "env" "assert_false"  (func $assert_false  (param i32)))
  (import "env" "assert_eq_i32" (func $assert_eq_i32 (param i32 i32)))
  (import "env" "assert_eq_i64" (func $assert_eq_i64 (param i64 i64)))
  (import "env" "assert_eq_f32" (func $assert_eq_f32 (param f32 f32)))
  (import "env" "assert_eq_f64" (func $assert_eq_f64 (param f64 f64)))
  (global $g1 (mut i32) (i32.const 123))
  (global $g2 (mut i64) (i64.const 456))
  (global $g3 (mut f32) (f32.const 1.5))
  (global $g4 (mut f64) (f64.const 2.5))
  (start $main)
  (func $main (export "main")
    (call $assert_eq_i32 (global.get $g1) (i32.const 123))
    (call $assert_eq_i64 (global.get $g2) (i64.const 456))
    (call $assert_eq_f32 (global.get $g3) (f32.const 1.5))
    (call $assert_eq_f64 (global.get $g4) (f64.const 2.5))

    (global.set $g1 (i32.const 100))
    (global.set $g2 (i64.const 200))
    (global.set $g3 (f32.const 3.5))
    (global.set $g4 (f64.const 4.5))
    (call $assert_eq_i32 (global.get $g1) (i32.const 100))
    (call $assert_eq_i64 (global.get $g2) (i64.const 200))
    (call $assert_eq_f32 (global.get $g3) (f32.const 3.5))
    (call $assert_eq_f64 (global.get $g4) (f64.const 4.5))
  )
)
