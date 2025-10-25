// feather ignore all
/// @ignore
function __LexiconHotReloadGCTS() {
	static _list = __LexiconHotReloadList();
	static _index = 0;

	var _len = ds_list_size(_list);
	if (_len == 0) return;

	var _t = get_timer();
	var _maxTime = _t + min(_len, __LEXICON_HOT_RELOAD_GC_MAX_TIME_MS);
	while(get_timer() < _maxTime) {
		_index = (_index+1) % _len;
		if (!weak_ref_alive(_list[| _index])) {
			delete _list[| _index];
			ds_list_delete(_list, _index);
		}
	}
}