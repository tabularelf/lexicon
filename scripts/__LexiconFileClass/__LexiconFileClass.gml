// feather ignore all
/// @ignore
function __LexiconFileClass(_filepath) constructor {
	filepath = _filepath;
	ext = string_lower(string_delete(filename_ext(_filepath), 1, 1));
	hash = -1;
	isLoading = false;
}