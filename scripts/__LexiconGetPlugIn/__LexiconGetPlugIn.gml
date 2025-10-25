// feather ignore all
/// @ignore
/// @param {String} name
function __LexiconGetPlugIn(_name) {
	static _plugIns = __LexiconSystem().__plugIns;
	var _pos = array_find_index(_plugins, method({_name}, function(_elm, _index) {
		return _elm.__name == _name;
	}));

	return _pos >= 0 ? _plugIns[_pos] : undefined;
}