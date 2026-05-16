// feather ignore all
/// @param {ID.buffer} buffer
/// @param {String} extension
/// @param {String | Struct.__LexiconLanguageClass} language_or_locale
function LexiconIndexLoadBuffer(_buff, _ext, _lang = LexiconLanguageGetCurrent()) {
	var _parser = __LexiconGetParser(_ext);
	if (_parser == undefined) {
		return;
	}

	try {
		_parser.parser(_buff, "", is_string(_lang) ? LexiconLanguageGet(_lang) : _lang);
	} catch(_ex) {
		if (__LEXICON_ERROR_ON_LOAD_FAILURE_ON_RELEASE) && (GM_build_type == "exe")  {
			__LexiconError($"Buffer failed to load.\n\n{_ex.longMessage}");
			return;
		}
		__LexiconTrace($"Buffer failed to load.\n\n{_ex.longMessage}");
	}
}