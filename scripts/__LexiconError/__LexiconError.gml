// feather ignore all
/// @ignore
function __LexiconError() {
	var _str = "";
	var _i = 0;
	repeat(argument_count) {
		_str += is_string(argument[_i]) ? argument[_i] : string(argument[_i]);
		++_i;
	}

	show_error($"Lexicon Error v{__LEXICON_VERSION} \n\n{_str}", true);
}