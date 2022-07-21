return {
  s(
    "modtest",
    fmt(
      [[
        #[cfg(test)]
        mod test {{
        {}  
          {}
        }}
      ]],
      {
        c(1, { t "    use super::*;", t "" }),
        i(0)
      }
    )
  )
}
