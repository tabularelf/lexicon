// feather ignore all
/// @param {String} fontStyle
/// @param {Function | Undefined} searchCallback
/// @param {Bool} searchAllFonts
/// @param {Struct.__LexiconLanguageClass} language
/// @return {String}
function LexiconFontGetName(_fontDir, _searchCallback = undefined, _searchAllFontsIfFailed = false, _lang = LexiconLanguageGetCurrent()) {
	return font_get_name(LexiconFontGet(_fontDir, _searchCallback, _searchAllFontsIfFailed, _lang));
}