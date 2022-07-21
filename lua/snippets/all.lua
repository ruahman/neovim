return {
  parse("expand","-- this is what was expanded!"),
  parse("lf", "local $1 = function($2)\n $0\nend"),
  s("test", t "foobar"),
  s("test2", { t({"foobar2",""}), i(1, "test2"), t "end" }),
  s("todo", {
    c(1, {
      t "TODO",
      t "NEXT",
      t "DONE",
      t "CANCEL",
    })
  }),
  s("curtime",f(function() 
    return os.date "%D - %H:%M" 
  end))
}

