// feather ignore all
/// @desc Loads a from disk, as if the language specified has requested it. The file isn't included.
/// @param {String} filepath
/// @param {Bool} async
/// @param {String | Struct.__LexiconLanguageClass} language_or_locale
function LexiconIndexLoadFile(_filepath, _async = false, _lang = LexiconLanguageGetCurrent()) {
	__LexiconLoadFile(new __LexiconFileClass(_filepath), LexiconIsLanguage(_lang) ? _lang : LexiconLanguageGet(_lang), _async);
}