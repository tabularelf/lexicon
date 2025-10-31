// feather ignore all
/// @param {String | Struct.__LexiconLanguageClass} language_or_locale The language to remove.
function LexiconIndexUndeclare(_lang) {
	static _languages = __LexiconSystem().__languages;
	var _language = LexiconIsLanguage(_lang) ? _lang: LexiconLanguageGet(_lang);

	var _index = array_get_index(_languages, _language);
	if (_index != -1) {
		array_delete(_languages, _index, 1);
		delete _language;
	}
}