// feather ignore all
/// @param {Struct.__LexiconLanguageClass, String} language
/// @param {Any} asset
/// @param {Any} asset
/// @return {Any}
function LexiconAssetSet(_assetA, _assetB, _lang){
	_lang = is_string(_lang) ? LexiconLanguageGet(_lang) : _lang;
	_lang.SetRemapAsset(_assetA, _assetB);
}