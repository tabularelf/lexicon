// feather ignore all
/// @ignore
function __LexiconIndexLoopArray(_name, _element, _language) {
	var _len = array_length(_element);
	for(var _i = LexiconEntryGetVariationsCount(_name); _i < _len; ++_i) {
		var _value = _element[_i];
		var _key = _name + + string(_i);
		if (is_struct(_value)) {
			//__loopStruct(_value, _name + "." + _names[_i], _language);
		} else if (is_array(_value)) {
			
		} else {
			LexiconPlugInAddVariation(_name, _key);
			LexiconPlugInAddEntry(_key, _value, _language);
		}	
	}
};