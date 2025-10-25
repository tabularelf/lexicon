// feather ignore all
/// @ignore
function __LexiconFileAsync() {
	static _list = __LexiconFileAsyncList();
	var _id = async_load[? "id"];
	var _status = async_load[? "status"];
	var _i = 0;
	repeat(array_length(_list)) {
		if (_list[_i].id == _id) {
			if (_status) && (!_list[_i].cancelled) {
				var _file = _list[_i];
				array_push(filesList, _file);
			} else {
				buffer_delete(_list[_i].entry.buff);
			}
			array_delete(_list, _i, 1);
			break;
		}
		++_i;
	}
}