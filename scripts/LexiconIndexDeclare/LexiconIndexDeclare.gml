// feather ignore all
function LexiconIndexDeclare(_lang, _locale, _fallbacks = undefined) {
	static __languages = __LexiconSystem().__languages;
	static _plugInCallbacks = __LexiconSystem().__plugInCallbacks;

	LexiconPlugInForceLoad();

	if (!is_string(_lang)) {
		__LexiconError($"Cannot declare language! Got typeof \"{_lang}\", expected \"string\"!");
		return;
	}

	if (!is_string(_locale)) {
		__LexiconError($"Cannot declare language from locale! Got typeof \"{_locale}\", expected \"string\"!");
		return;
	}

	var _langEntry = __LexiconGetLocale(_locale);
	if (!is_undefined(_langEntry)) {
		if (__LEXICON_VERBOSE) __LexiconTrace($"Language {_langEntry} already exists!");
		return _langEntry;
	}

	var _inst = new __LexiconLanguageClass(_lang, _locale);
	array_push(__languages, _inst);	

	if (is_array(_fallbacks)) {
		_inst.AddFallbackExt(_fallbacks);
	} else if (is_string(_fallbacks)) {
		_inst.AddFallback(_fallbacks);
	}

	__LexiconCallbackFire(LexiconCallbackType.LANGUAGE_CREATED, _inst);

	return _inst;
}