// feather ignore all
function LexiconPlugInSetDynamic(_name, _callback, _static = false) {
	static _dynamics = __LexiconSystem().__globalDynamic;
	_dynamics[$ _name]	= {
		callback: is_method(_callback) ? _callback : method(undefined, _callback),
		isStatic: _static,
	};
}