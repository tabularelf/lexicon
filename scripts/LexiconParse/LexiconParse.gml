// feather ignore all
/// @param {String} key
/// @param {Any} ...
/// @return {Struct.__LexiconTextElementClass}
function LexiconParse(_key) {
	static _argArray = [];
	
	if (argument_count > 1) {
		try {
			array_resize(_argArray, argument_count);
			var _i = 0;
			repeat(argument_count) {
				_argArray[_i] = is_string(argument[_i]) || __LexiconIsStruct(argument[_i]) ? argument[_i] : string(argument[_i]);
				++_i;
			}
			
			return __LexiconInner(undefined, _key, _argArray);
		} finally {
			array_resize(_argArray, 0);	
		}
	}
	
	return __LexiconInner(undefined, _key);
}