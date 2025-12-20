// feather ignore all
/// @ignore
/// @param {Any} ...
function __LexiconGoogleSheetsTrace() {
	var _str = "";
	var _i = 0;
	repeat(argument_count) {
		_str += is_string(argument[_i]) ? argument[_i] : string(argument[_i]);
		++_i;
	}

	show_debug_message($"Lexicon.GoogleSheets: {_str}");
}