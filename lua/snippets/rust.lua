return {
	s(
		"tests",
		fmt(
			[[
#[cfg(test)]
mod tests {{
    use super::*;
    #[test]
    fn test_{}() {{
        {}
    }}
}}
    ]],
			{
				i(1, "method"),
				i(0),
			}
		)
	),
}
