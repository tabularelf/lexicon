/// @func lexicon_replace_chr_get
function lexicon_replace_chr_get() {
	// Feather ignore all
	// Ensure that it's loaded first!
	__lexicon_init();
	
	return __LEXICON_STRUCT.replaceChr;
}