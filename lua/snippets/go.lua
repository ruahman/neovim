return {
    s("pack",fmt([[
    package {}
    ]],{
      i(1,"main")
    })),
    s("import",fmt([[
    import "{}"
    ]],{
      i(1,"fmt")
    })),
    s("imports",fmt([[
    import (
      "{}"
      "{}"
    )
    ]],{
      i(1,"pack1"),
      i(2,"pack2")
    })),
    s("fmt",fmt([[
      fmt.Println({})
    ]],{
      i(1,"\"Hello World\"")
    })),
    s("func",fmt([[
      func {}({}){} {{
        {}
      }}
    ]],{
      i(1,"foo"),
      i(2,"bar"),
      i(3),
      i(4)
    })),
    s("if",fmt([[
      if {} {{

      }}
    ]],{
      i(1,"condition")
    })),
    s("ifelse",fmt([[
    if {} {{
      {}
    }} else {{
      {}
    }}
    ]],{
      i(1),
      i(2),
      i(3),
    })),
    s("switch",fmt([[
    switch {} {{
    case {}:
      {}
    }}
    ]],{
      i(1),
      i(2),
      i(3)
    })),
    s("for-clasic",fmt([[
    for {}; {}; {} {{
      {}
    }}
    ]],{
      i(1),
      i(2),
      i(3),
      i(4)
    }))
}
