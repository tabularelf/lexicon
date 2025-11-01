// feather ignore all
/// @ignore
function __LexiconHotReload() {
	static _list = __LexiconHotReloadList();
	var _i = ds_list_size(_list)-1;
	repeat(_i+1) {
		if (!weak_ref_alive(_list[| _i])) {
			ds_list_delete(_list, _i);
		} else {
			_list[| _i].ref.Refresh();
		}
		--_i;
	}
}