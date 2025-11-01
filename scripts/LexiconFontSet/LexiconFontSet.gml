// feather ignore all
/// @param {String} fontDirectory
/// @param {Asset.GMFont} font
/// @param {String | Struct.__LexiconLanguageClass} language
/// @return {Asset.GMFont}
function LexiconFontSet(_fontDir, _font, _lang) {
	static _global = __LexiconSystem();
	_lang = is_string(_lang) ? LexiconLanguageGet(_lang) : _lang;
	_lang.SetFont(_fontDir, _font);
}