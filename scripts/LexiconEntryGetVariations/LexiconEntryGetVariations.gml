// feather ignore all
/// @param {String} key
/// @return {Array<String> | Undefined}
function LexiconEntryGetVariations(_entry){
	return variable_clone(__LexiconGetVariations(_entry), 0);
}