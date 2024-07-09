-- get rid of highlight after search by moving cursor
return {
	"romainl/vim-cool",
	event = { "BufRead", "BufNewFile" },
}
