/// @ignore
/// feather ignore all
function __lexicon_resolve_dynamic(_strKeyStripped, _args) {
	static _global = __lexicon_init();
	static _staticArray = [];
	static _replaceChrStart = _global.replaceChr[0];
	static _replaceChrEnd = _global.replaceChr[1];
	var _callback = _global.dynamicMap[$ _strKeyStripped][0];
	var _index = is_method(_callback) ? method_get_index(_callback) : _callback;
	var _self =	is_method(_callback) ? (method_get_self(_callback) ?? self) : self;
	var _strResult;
	if (_args == undefined) {
		_strResult = _callback();	
	} else {
		var _len = array_length(_args);
		if (is_array(_args) && _len > array_length(_staticArray)) {
			array_resize(_staticArray, _len);
		}
		array_copy(_staticArray, 0, _args, 0, _len);
		
		with(_self) {
			_strResult = script_execute_ext(_index, _staticArray, 0, array_length(_args));
            _strResult = !is_string(_strResult) ? string(_strResult) : _strResult;
		}
	}
	
	return _strResult;
}