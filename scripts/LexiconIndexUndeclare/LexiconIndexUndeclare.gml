// feather ignore all
/// @param {String | Struct.__LexiconLanguageClass} language_or_locale The language to remove.
function LexiconIndexUndeclare(_lang) {
	static _global = __LexiconSystem();
	static _languages = __LexiconSystem().__languages;
	static _ctx = {
		language: undefined,
	};

	static _callback = method(_ctx, function(_name, _value) {
		if (_value.__language == language) {
			_value.__Reset();
		}
	});

	var _language = LexiconIsLanguage(_lang) ? _lang: LexiconLanguageGet(_lang);

	var _index = array_get_index(_languages, _language);
	if (_index == -1) {
		__LexiconError("Language \"{_lang}\" doesn't exist!");	
		return;
	}

	array_delete(_languages, _index, 1);
	
	_ctx.language = _language;
	struct_foreach(_global.__entries, _callback);
	_ctx.language = undefined;

	if (_global.__mainLanguage == _language) {
		_global.__mainLanguage = __LexiconLanguageDummy();
	}

	_language.__loaded = false;

	delete _language;
}