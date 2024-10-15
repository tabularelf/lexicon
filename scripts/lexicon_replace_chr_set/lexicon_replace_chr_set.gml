/// @func lexicon_replace_chr_set(string)
/// @param {String} chr

/// feather ignore all
function lexicon_replace_chr_set(_chr) {
	// Ensure that it's loaded first!
	__lexicon_init();
    
    if (!__LEXICON_ALLOW_LEGACY_ACCESSOR) {
        __lexicon_throw("__LEXICON_ALLOW_LEGACY_ACCESSOR is disabled!\nPlease set it to `true` under `lexicon_settings`");
    }
	
	__LEXICON_STRUCT.replaceChr = _chr;
}