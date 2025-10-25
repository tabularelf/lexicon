// feather ignore all
function LexiconIndexAddFile(_filepath, _language) {
	static _global = __LexiconSystem();
	static _dummy = __LexiconLanguageDummy();
	var _lang = is_string(_language) ? LexiconLanguageGet(_language) : _language;

	if (is_undefined(_lang)) {
		__LexiconError($"Language and locale {_language} does not exist.");
		return;
	}

	_lang.AddFile(_filepath);

	if (_lang.IsLoaded()) {
		LexiconIndexLoadFile(_filepath);
	}
}