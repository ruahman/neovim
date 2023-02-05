return {
    s("test",fmt([[
    package {}

    import "testing"

    func Test{}(t *testing.T){{
      {}
    }}
    ]],{
      i(1,"Package"),
      i(2,"Name"),
      i(0)
    }))
}
