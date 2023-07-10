return {
  s(
    "arrow function",
    fmt(
      [[
  const {} = ({}) => {{
    {}
  }}
  ]],
      { i(1, "func_name"), i(2, "params"), i(0) }
    )
  ),
  s(
    "class",
    fmt(
      [[
  class {} {{
    constructor({}) {{
      // snipets rule
      {}
    }}
  }}
  ]],
      { i(1, "ClassName"), i(2, "params"), i(0) }
    )
  ),
}
