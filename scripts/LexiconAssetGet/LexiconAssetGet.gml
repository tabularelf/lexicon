// feather ignore all
/// @param {Any} asset
/// @param {Struct.__LexiconLanguageClass, String} language
/// @return {Any}
function LexiconAssetGet(_asset, _lang = LexiconLanguageGetCurrent()){
	_lang = is_string(_lang) ? LexiconLanguageGet(_lang) : _lang;
	return _lang.GetRemapAsset(_asset);
}