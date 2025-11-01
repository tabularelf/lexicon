// feather ignore all
/// @param {Bool} async
function LexiconLanguageReload(_async = false){
	__LexiconUpdateLanguage(LexiconLanguageGetCurrent(), _async);
}