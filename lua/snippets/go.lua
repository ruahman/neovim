return {
  s(
    "gotest",
    fmt(
      [[
        for {{
          fmt.Println("{}")
        }}
      ]],
      {
        i(1,"foobar")
      }
    )
  ),
  s(
    "goagain",
    fmt(
      [[
      if {} {{
        fmt.Println({})
      }} 
      ]],
      {
        i(1,"testing"),
        i(2,"demo")
      }
    )
  )
}
