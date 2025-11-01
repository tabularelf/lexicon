function __LexiconUniqueGenerate(_entry) {
	static _argArray = [];
	var _inst = entries[$ _entry];
	if (is_undefined(_inst)) {
		if (argument_count > 1) {
			array_resize(_argArray, argument_count-1);
			var _i = 1;
			repeat(argument_count-1) {
				_argArray[_i-1] = argument[_i];
				++_i;
			}
			_inst = LexiconExt(_entry, _argArray);
		} else {
			_inst = Lexicon(_entry);
		}

		entries[$ _entry] = _inst;
	}
	
	return _inst.Get(); 
}