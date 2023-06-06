/// @func lexicon_replace_chr_get
/// feather ignore all
function lexicon_replace_chr_get() {
	// Ensure that it's loaded first!
	__lexicon_init();
	
	return __LEXICON_STRUCT.replaceChr;
}