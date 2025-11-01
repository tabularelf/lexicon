// Feather disable all

/// Returns an array of structs with all of the valid character block ranges, based on the provided string characters.
/// These character block ranges are derived from https://www.unicode.org/charts/, and Blocks.txt respectively.
/// 
/// @param {String} string
/// @return {Array<Struct>}
function UnicBlockGetRanges(_str) {
	var _results = [];
	UnicBlockGetRangesExt(_results, _str);
	return _results;
}