(module
  (func (i32.const 100)
    (block (i32.const 200)
      (block (i32.const 300)
        (block (i32.const 400)
          (br 3) (br 2) (br 1) (br 0)
          (drop)
        )
        (drop)
      )
      (drop)
    )
    (drop)
  )
)