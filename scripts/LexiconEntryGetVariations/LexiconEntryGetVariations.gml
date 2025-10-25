// feather ignore all
/// @return {Array<String> | Undefined}
function LexiconEntryGetVariations(_entry){
	return variable_clone(__LexiconGetVariations(_entry), 0);
}