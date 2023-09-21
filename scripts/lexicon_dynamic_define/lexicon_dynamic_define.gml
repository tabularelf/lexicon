function lexicon_dynamic_define(_name, _func, _updateCache = true) {
	static _global = __lexicon_init();
	if (variable_struct_exists(_global.dynamicMap, _name)) {
		__lexicon_throw(_name + " is already declared as a callback!");	
	}
	_global.dynamicMap[$ _name] = [_func, _updateCache];
}