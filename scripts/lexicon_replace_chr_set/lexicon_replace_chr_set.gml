/// @func lexicon_replace_chr_set(string)
/// @arg string
function lexicon_replace_chr_set(_chr) {
	// Feather ignore all
	// Ensure that it's loaded first!
	__lexicon_init();
	
	__LEXICON_STRUCT.replaceChr = _chr;
}