/// @func lexicon_language_set
/// @param language
/// @param [force_flush]
function lexicon_language_set(_language, _forceFlush) {
	var _struct = __LEXICON_STRUCT.language[$ _language];
	
	if (_struct != undefined) {
		__LEXICON_STRUCT.locale = _struct.locale;	
		__LEXICON_STRUCT.language = _struct.language;
		
		// Load entries
		__lexicon_load_entries();
	} else {
		__LEXICON_STRUCT.locale = "unknown";
		__LEXICON_STRUCT.language =  "unknown";
	}
	
	_forceFlush = is_undefined(_forceFlush) ? true : _forceFlush;
	if (_forceFlush) lexicon_flush_cache();
}