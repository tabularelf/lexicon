/// @func lexicon_replace_chr_set(chr)
/// @param {String} chr
/// feather ignore all
function lexicon_replace_chr_set(_chr) {
	// Ensure that it's loaded first!
	__lexicon_init();
	
	__LEXICON_STRUCT.replaceChr = _chr;
}