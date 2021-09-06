/// @func lexicon_set_language
/// @param language
/// @param [force_flush]
function lexicon_set_language(_language, _forceFlush) {
	var _struct = LEXICON_STRUCT.language[$ _language];
	
	if (_struct != undefined) {
		LEXICON_STRUCT.locale = _struct.locale;	
		LEXICON_STRUCT.language = _struct.language;	
	}
	
	// Load entries
	__lexicon_load_entries();
	
	_forceFlush = is_undefined(_forceFlush) ? true : _forceFlush;
	if (_forceFlush) lexicon_flush_cache();
}