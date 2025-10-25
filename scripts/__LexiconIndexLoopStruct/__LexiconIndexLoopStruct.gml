function __LexiconIndexLoopStruct(_name,_element, _language) {
	var _i = 0;
	var _names = struct_get_names(_element);
	repeat(struct_names_count(_element)) {
		var _value = _element[$ _names[_i]];
		var _key = _name + + "." + _names[_i];
		if (is_struct(_value)) {
			__LexiconIndexLoopStruct(_key, _value, _language);
		} else if (is_array(_value)) {
			LexiconPlugInAddEntry(_key, undefined, _language);
			__LexiconIndexLoopArray(_key, _value, _language);
		} else {
			LexiconPlugInAddEntry(_key, _value, _language);
		}	
   
		++_i;
	}
}