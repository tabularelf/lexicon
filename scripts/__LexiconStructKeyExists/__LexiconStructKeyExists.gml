// feather ignore all
/// @ignore
function __LexiconStructKeyExists(_root, _key) {
	if (is_undefined(_root)) return false;

	if (string_pos(".", _key) > 0) {
		_root = _root[$ string_copy(_key, 1, string_pos(".", _key)-1)];
		_key = string_delete(_key, 1, string_pos(".", _key));

		return __LexiconStructKeyExists(_root, _key);
	}

	return struct_exists(_root, _key);
}