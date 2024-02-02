(module
  (import "env" "assert_true"   (func $assert_true   (param i32)))
  (import "env" "assert_false"  (func $assert_false  (param i32)))
  (import "env" "assert_eq_i32" (func $assert_eq_i32 (param i32 i32)))
  (import "env" "assert_eq_i64" (func $assert_eq_i64 (param i64 i64)))
  (import "env" "assert_eq_f32" (func $assert_eq_f32 (param f32 f32)))
  (import "env" "assert_eq_f64" (func $assert_eq_f64 (param f64 f64)))
  (start $main)
  (func $main (export "main")
    (call $assert_true  (i32.eqz   (i32.const 0)))
    (call $assert_false (i32.eqz   (i32.const 1)))
    (call $assert_true  (i32.eq    (i32.const  1) (i32.const  1)))
    (call $assert_false (i32.eq    (i32.const  1) (i32.const -1)))
    (call $assert_false (i32.ne    (i32.const  1) (i32.const  1)))
    (call $assert_true  (i32.ne    (i32.const  1) (i32.const -1)))
    (call $assert_true  (i32.lt_s  (i32.const -1) (i32.const  1)))
    (call $assert_false (i32.lt_s  (i32.const  1) (i32.const -1)))
    (call $assert_false (i32.lt_u  (i32.const -1) (i32.const  1)))
    (call $assert_true  (i32.lt_u  (i32.const  1) (i32.const -1)))
    (call $assert_false (i32.gt_s  (i32.const -1) (i32.const  1)))
    (call $assert_true  (i32.gt_s  (i32.const  1) (i32.const -1)))
    (call $assert_true  (i32.gt_u  (i32.const -1) (i32.const  1)))
    (call $assert_false (i32.gt_u  (i32.const  1) (i32.const -1)))
    (call $assert_true  (i32.le_s  (i32.const -1) (i32.const  1)))
    (call $assert_false (i32.le_s  (i32.const  1) (i32.const -1)))
    (call $assert_false (i32.le_u  (i32.const -1) (i32.const  1)))
    (call $assert_true  (i32.le_u  (i32.const  1) (i32.const -1)))
    (call $assert_false (i32.ge_s  (i32.const -1) (i32.const  1)))
    (call $assert_true  (i32.ge_s  (i32.const  1) (i32.const -1)))
    (call $assert_true  (i32.ge_u  (i32.const -1) (i32.const  1)))
    (call $assert_false (i32.ge_u  (i32.const  1) (i32.const -1)))

    (call $assert_true  (i64.eqz   (i64.const 0)))
    (call $assert_false (i64.eqz   (i64.const 1)))
    (call $assert_true  (i64.eq    (i64.const  1) (i64.const  1)))
    (call $assert_false (i64.eq    (i64.const  1) (i64.const -1)))
    (call $assert_false (i64.ne    (i64.const  1) (i64.const  1)))
    (call $assert_true  (i64.ne    (i64.const  1) (i64.const -1)))
    (call $assert_true  (i64.lt_s  (i64.const -1) (i64.const  1)))
    (call $assert_false (i64.lt_s  (i64.const  1) (i64.const -1)))
    (call $assert_false (i64.lt_u  (i64.const -1) (i64.const  1)))
    (call $assert_true  (i64.lt_u  (i64.const  1) (i64.const -1)))
    (call $assert_false (i64.gt_s  (i64.const -1) (i64.const  1)))
    (call $assert_true  (i64.gt_s  (i64.const  1) (i64.const -1)))
    (call $assert_true  (i64.gt_u  (i64.const -1) (i64.const  1)))
    (call $assert_false (i64.gt_u  (i64.const  1) (i64.const -1)))
    (call $assert_true  (i64.le_s  (i64.const -1) (i64.const  1)))
    (call $assert_false (i64.le_s  (i64.const  1) (i64.const -1)))
    (call $assert_false (i64.le_u  (i64.const -1) (i64.const  1)))
    (call $assert_true  (i64.le_u  (i64.const  1) (i64.const -1)))
    (call $assert_false (i64.ge_s  (i64.const -1) (i64.const  1)))
    (call $assert_true  (i64.ge_s  (i64.const  1) (i64.const -1)))
    (call $assert_true  (i64.ge_u  (i64.const -1) (i64.const  1)))
    (call $assert_false (i64.ge_u  (i64.const  1) (i64.const -1)))

    (call $assert_true  (f32.eq (f32.const 1.0) (f32.const 1.0)))
    (call $assert_false (f32.eq (f32.const 1.0) (f32.const 1.5)))
    (call $assert_false (f32.ne (f32.const 1.0) (f32.const 1.0)))
    (call $assert_true  (f32.ne (f32.const 1.0) (f32.const 1.5)))
    (call $assert_true  (f32.lt (f32.const 1.0) (f32.const 1.5)))
    (call $assert_false (f32.lt (f32.const 1.5) (f32.const 1.0)))
    (call $assert_false (f32.gt (f32.const 1.0) (f32.const 1.5)))
    (call $assert_true  (f32.gt (f32.const 1.5) (f32.const 1.0)))
    (call $assert_true  (f32.le (f32.const 1.0) (f32.const 1.5)))
    (call $assert_false (f32.le (f32.const 1.5) (f32.const 1.0)))
    (call $assert_false (f32.ge (f32.const 1.0) (f32.const 1.5)))
    (call $assert_true  (f32.ge (f32.const 1.5) (f32.const 1.0)))

    (call $assert_true  (f64.eq (f64.const 1.0) (f64.const 1.0)))
    (call $assert_false (f64.eq (f64.const 1.0) (f64.const 1.5)))
    (call $assert_false (f64.ne (f64.const 1.0) (f64.const 1.0)))
    (call $assert_true  (f64.ne (f64.const 1.0) (f64.const 1.5)))
    (call $assert_true  (f64.lt (f64.const 1.0) (f64.const 1.5)))
    (call $assert_false (f64.lt (f64.const 1.5) (f64.const 1.0)))
    (call $assert_false (f64.gt (f64.const 1.0) (f64.const 1.5)))
    (call $assert_true  (f64.gt (f64.const 1.5) (f64.const 1.0)))
    (call $assert_true  (f64.le (f64.const 1.0) (f64.const 1.5)))
    (call $assert_false (f64.le (f64.const 1.5) (f64.const 1.0)))
    (call $assert_false (f64.ge (f64.const 1.0) (f64.const 1.5)))
    (call $assert_true  (f64.ge (f64.const 1.5) (f64.const 1.0)))

    (call $assert_eq_i32 (i32.clz    (i32.const 0xF0)) (i32.const 24))
    (call $assert_eq_i32 (i32.ctz    (i32.const 0xF0)) (i32.const 4))
    (call $assert_eq_i32 (i32.popcnt (i32.const 0x1F)) (i32.const 5))
    (call $assert_eq_i32 (i32.add    (i32.const  3) (i32.const 2)) (i32.const 5))
    (call $assert_eq_i32 (i32.sub    (i32.const  3) (i32.const 2)) (i32.const 1))
    (call $assert_eq_i32 (i32.mul    (i32.const  3) (i32.const 2)) (i32.const 6))
    (call $assert_eq_i32 (i32.div_s  (i32.const -8) (i32.const 2)) (i32.const -4))
    (call $assert_eq_i32 (i32.div_u  (i32.const -8) (i32.const 2)) (i32.const 0x7FFF_FFFC))
    (call $assert_eq_i32 (i32.rem_s  (i32.const -5) (i32.const 2)) (i32.const -1))
    (call $assert_eq_i32 (i32.rem_u  (i32.const -5) (i32.const 2)) (i32.const 1))
    (call $assert_eq_i32 (i32.and    (i32.const 0x0F0F) (i32.const 0xF00F)) (i32.const 0x000F))
    (call $assert_eq_i32 (i32.or     (i32.const 0x0F0F) (i32.const 0xF00F)) (i32.const 0xFF0F))
    (call $assert_eq_i32 (i32.xor    (i32.const 0x0F0F) (i32.const 0xF00F)) (i32.const 0xFF00))
    (call $assert_eq_i32 (i32.shl    (i32.const -1) (i32.const 8)) (i32.const -256))
    (call $assert_eq_i32 (i32.shr_s  (i32.const -1) (i32.const 8)) (i32.const -1))
    (call $assert_eq_i32 (i32.shr_u  (i32.const -1) (i32.const 8)) (i32.const 0xFF_FFFF))
    (call $assert_eq_i32 (i32.rotl   (i32.const 0x1234_5678) (i32.const 8)) (i32.const 0x3456_7812))
    (call $assert_eq_i32 (i32.rotr   (i32.const 0x1234_5678) (i32.const 8)) (i32.const 0x7812_3456))

    (call $assert_eq_i64 (i64.clz    (i64.const 0xF0)) (i64.const 56))
    (call $assert_eq_i64 (i64.ctz    (i64.const 0xF0)) (i64.const 4))
    (call $assert_eq_i64 (i64.popcnt (i64.const 0x1F)) (i64.const 5))
    (call $assert_eq_i64 (i64.add    (i64.const  3) (i64.const 2)) (i64.const 5))
    (call $assert_eq_i64 (i64.sub    (i64.const  3) (i64.const 2)) (i64.const 1))
    (call $assert_eq_i64 (i64.mul    (i64.const  3) (i64.const 2)) (i64.const 6))
    (call $assert_eq_i64 (i64.div_s  (i64.const -8) (i64.const 2)) (i64.const -4))
    (call $assert_eq_i64 (i64.div_u  (i64.const -8) (i64.const 2)) (i64.const 0x7FFF_FFFF_FFFF_FFFC))
    (call $assert_eq_i64 (i64.rem_s  (i64.const -5) (i64.const 2)) (i64.const -1))
    (call $assert_eq_i64 (i64.rem_u  (i64.const -5) (i64.const 2)) (i64.const 1))
    (call $assert_eq_i64 (i64.and    (i64.const 0x0F0F) (i64.const 0xF00F)) (i64.const 0x000F))
    (call $assert_eq_i64 (i64.or     (i64.const 0x0F0F) (i64.const 0xF00F)) (i64.const 0xFF0F))
    (call $assert_eq_i64 (i64.xor    (i64.const 0x0F0F) (i64.const 0xF00F)) (i64.const 0xFF00))
    (call $assert_eq_i64 (i64.shl    (i64.const -1) (i64.const 8)) (i64.const -256))
    (call $assert_eq_i64 (i64.shr_s  (i64.const -1) (i64.const 8)) (i64.const -1))
    (call $assert_eq_i64 (i64.shr_u  (i64.const -1) (i64.const 8)) (i64.const 0xFF_FFFF_FFFF_FFFF))
    (call $assert_eq_i64 (i64.rotl   (i64.const 0x1234_5678_1234_5678) (i64.const 8)) (i64.const 0x3456_7812_3456_7812))
    (call $assert_eq_i64 (i64.rotr   (i64.const 0x1234_5678_1234_5678) (i64.const 8)) (i64.const 0x7812_3456_7812_3456))

    (call $assert_eq_f32 (f32.abs     (f32.const -1.5)) (f32.const 1.5))
    (call $assert_eq_f32 (f32.neg     (f32.const 1.5)) (f32.const -1.5))
    (call $assert_eq_f32 (f32.ceil    (f32.const 1.5)) (f32.const 2.0))
    (call $assert_eq_f32 (f32.floor   (f32.const 1.5)) (f32.const 1.0))
    (call $assert_eq_f32 (f32.trunc   (f32.const 1.5)) (f32.const 1.0))
    (call $assert_eq_f32 (f32.nearest (f32.const 1.1)) (f32.const 1.0))
    (call $assert_eq_f32 (f32.nearest (f32.const 1.8)) (f32.const 2.0))
    (call $assert_eq_f32 (f32.sqrt    (f32.const 4.0)) (f32.const 2.0))
    (call $assert_eq_f32 (f32.add (f32.const 3.0) (f32.const 2.0)) (f32.const 5.0))
    (call $assert_eq_f32 (f32.sub (f32.const 3.0) (f32.const 2.0)) (f32.const 1.0))
    (call $assert_eq_f32 (f32.mul (f32.const 3.0) (f32.const 2.0)) (f32.const 6.0))
    (call $assert_eq_f32 (f32.div (f32.const 3.0) (f32.const 2.0)) (f32.const 1.5))
    (call $assert_eq_f32 (f32.min (f32.const 3.0) (f32.const 2.0)) (f32.const 2.0))
    (call $assert_eq_f32 (f32.max (f32.const 3.0) (f32.const 2.0)) (f32.const 3.0))
    (call $assert_eq_f32 (f32.copysign (f32.const 3.0) (f32.const 2.0)) (f32.const 3.0))
    (call $assert_eq_f32 (f32.copysign (f32.const 3.0) (f32.const -2.0)) (f32.const -3.0))

    (call $assert_eq_f64 (f64.abs     (f64.const -1.5)) (f64.const 1.5))
    (call $assert_eq_f64 (f64.neg     (f64.const 1.5)) (f64.const -1.5))
    (call $assert_eq_f64 (f64.ceil    (f64.const 1.5)) (f64.const 2.0))
    (call $assert_eq_f64 (f64.floor   (f64.const 1.5)) (f64.const 1.0))
    (call $assert_eq_f64 (f64.trunc   (f64.const 1.5)) (f64.const 1.0))
    (call $assert_eq_f64 (f64.nearest (f64.const 1.1)) (f64.const 1.0))
    (call $assert_eq_f64 (f64.nearest (f64.const 1.8)) (f64.const 2.0))
    (call $assert_eq_f64 (f64.sqrt    (f64.const 4.0)) (f64.const 2.0))
    (call $assert_eq_f64 (f64.add (f64.const 3.0) (f64.const 2.0)) (f64.const 5.0))
    (call $assert_eq_f64 (f64.sub (f64.const 3.0) (f64.const 2.0)) (f64.const 1.0))
    (call $assert_eq_f64 (f64.mul (f64.const 3.0) (f64.const 2.0)) (f64.const 6.0))
    (call $assert_eq_f64 (f64.div (f64.const 3.0) (f64.const 2.0)) (f64.const 1.5))
    (call $assert_eq_f64 (f64.min (f64.const 3.0) (f64.const 2.0)) (f64.const 2.0))
    (call $assert_eq_f64 (f64.max (f64.const 3.0) (f64.const 2.0)) (f64.const 3.0))
    (call $assert_eq_f64 (f64.copysign (f64.const 3.0) (f64.const 2.0)) (f64.const 3.0))
    (call $assert_eq_f64 (f64.copysign (f64.const 3.0) (f64.const -2.0)) (f64.const -3.0))

    (call $assert_eq_i32 (i32.wrap_i64    (i64.const -1)) (i32.const -1))
    (call $assert_eq_i32 (i32.trunc_f32_s (f32.const -1.5)) (i32.const -1))
    (call $assert_eq_i32 (i32.trunc_f32_u (f32.const 1.5)) (i32.const 1))
    (call $assert_eq_i32 (i32.trunc_f64_s (f64.const -1.5)) (i32.const -1))
    (call $assert_eq_i32 (i32.trunc_f64_u (f64.const 1.5)) (i32.const 1))
    (call $assert_eq_i64 (i64.extend_i32_s (i32.const -1)) (i64.const -1))
    (call $assert_eq_i64 (i64.extend_i32_u (i32.const -1)) (i64.const 0xFFFF_FFFF))
    (call $assert_eq_i64 (i64.trunc_f32_s  (f32.const -1.5)) (i64.const -1))
    (call $assert_eq_i64 (i64.trunc_f32_u  (f32.const 1.5)) (i64.const 1))
    (call $assert_eq_i64 (i64.trunc_f64_s  (f64.const -1.5)) (i64.const -1))
    (call $assert_eq_i64 (i64.trunc_f64_u  (f64.const 1.5)) (i64.const 1))
    (call $assert_eq_f32 (f32.convert_i32_s (i32.const -1)) (f32.const -1.0))
    (call $assert_eq_f32 (f32.convert_i32_u (i32.const -1)) (f32.const 4.2949673e+09))
    (call $assert_eq_f32 (f32.convert_i64_s (i64.const -1)) (f32.const -1.0))
    (call $assert_eq_f32 (f32.convert_i64_u (i64.const -1)) (f32.const 1.8446744e+19))
    (call $assert_eq_f32 (f32.demote_f64    (f64.const 1.5)) (f32.const 1.5))
    (call $assert_eq_f64 (f64.convert_i32_s (i32.const -1)) (f64.const -1.0))
    (call $assert_eq_f64 (f64.convert_i32_u (i32.const -1)) (f64.const 4.294967295e+09))
    (call $assert_eq_f64 (f64.convert_i64_s (i64.const -1)) (f64.const -1.0))
    (call $assert_eq_f64 (f64.convert_i64_u (i64.const -1)) (f64.const 1.8446744073709552e+19))
    (call $assert_eq_f64 (f64.promote_f32   (f32.const 1.5)) (f64.const 1.5))
    (call $assert_eq_i32 (i32.reinterpret_f32 (f32.const 1.5)) (i32.const 0x3FC0_0000))
    (call $assert_eq_i64 (i64.reinterpret_f64 (f64.const 1.5)) (i64.const 0x3FF8_0000_0000_0000))
    (call $assert_eq_f32 (f32.reinterpret_i32 (i32.const 0x3FC0_0000)) (f32.const 1.5))
    (call $assert_eq_f64 (f64.reinterpret_i64 (i64.const 0x3FF8_0000_0000_0000)) (f64.const 1.5))

    (call $assert_eq_i32 (i32.extend8_s  (i32.const 0xF0F0)) (i32.const 0xFFFFFFF0))
    (call $assert_eq_i32 (i32.extend16_s (i32.const 0xF0F0)) (i32.const 0xFFFFF0F0))
    (call $assert_eq_i64 (i64.extend8_s  (i64.const 0xF0F0F0F0)) (i64.const 0xFFFFFFFFFFFFFFF0))
    (call $assert_eq_i64 (i64.extend16_s (i64.const 0xF0F0F0F0)) (i64.const 0xFFFFFFFFFFFFF0F0))
    (call $assert_eq_i64 (i64.extend32_s (i64.const 0xF0F0F0F0)) (i64.const 0xFFFFFFFFF0F0F0F0))
  )
)
