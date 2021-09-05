/// @func lexicon_set_locale
/// @arg string
/// @param [force_flush]
function lexicon_set_locale(_locale, _forceFlush) {
	_forceFlush = is_undefined(_forceFlush) ? true : _forceFlush;
	if (_forceFlush) lexicon_flush_cache();
	LEXICON_STRUCT.lang_type = _locale;	
}
