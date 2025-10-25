// feather ignore all
function LexiconIndexLoadBuffer(_buff, _ext, _lang = LexiconLanguageGetCurrent()) {
	static _parsers = __LexiconSystem().__parsers;
	var _parser = _parsers[$ string_lower(_ext)];
	if (_parser == undefined) {
		return;
	}

	try {
		_parser.parser(_buff, "", _lang);
	} catch(_ex) {
		if (__LEXICON_ERROR_ON_LOAD_FAILURE_ON_RELEASE) && (GM_build_type == "exe")  {
			__LexiconError($"Buffer failed to load.\n\n{_ex.longMessage}");
			return;
		}
		__LexiconTrace($"Buffer failed to load.\n\n{_ex.longMessage}");
	}
}