// feather ignore all
/// @param {String} key
/// @return {Bool}
function LexiconEntryHasVariations(_entry){
	var _variations = __LexiconGetVariations(_entry);
	return is_undefined(_variations) ? false : array_length(_variations) > 0;
}