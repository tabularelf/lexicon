function lexicon_callback_define(_name, _updateCache, _func) {
	static _global = __lexicon_init();
	if (variable_struct_exists(_global.dynamicMap, _name)) {
		__lexicon_throw(_name + " is already declared as a global!");	
	}
	_global.dynamicMap[$ _name] = [_func, _updateCache];
}