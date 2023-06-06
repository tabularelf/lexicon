/// @ignore
/// feather ignore all
function __lexicon_file_handle_load(_file, _string) {
		var _args;
		_args[0] = _string;
		
		if (_file.args != undefined) {
			array_copy(_args, 1, _file.args, 0, array_length(_file.args));	
		}
		
		script_execute_ext(_file.fileType, _args);
		_file.isLoaded = true;
}