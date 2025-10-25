// feather ignore all
/// @return {Asset.GMFont}
function LexiconFontSet(_lang, _fontDir, _font) {
	static _global = __LexiconSystem();
	_lang = is_string(_lang) ? LexiconLanguageGet(_lang) : _lang;
	_lang.SetFont(_fontDir, _font);
}