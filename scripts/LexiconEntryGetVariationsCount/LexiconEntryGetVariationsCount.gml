// feather ignore all
/// @param {String} key
/// @return {Real}
function LexiconEntryGetVariationsCount(_entry){
	var _variations = __LexiconGetVariations(_entry);
	return is_array(_variations) ? array_length(_variations) : 0;
}