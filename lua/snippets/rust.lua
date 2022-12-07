return {
    s("tests",fmt([[
#[cfg(test)]
mod {} {{
    use super::*;
    #[test]
    fn {}() {{
        let result = 2 + 2;
        assert_eq!(result, 4);
    }}
}}
    ]],{
      i(1,"tests"),
      i(2,"test")
    })),
    s("struct derive(Debug) allow(dead_code)",fmt([[
#[allow(dead_code)]
#[derive(Debug)]
struct {} {{
  {}
}} 
    ]],{
      i(1,"name"),
      i(2,"field")
    })),
}
