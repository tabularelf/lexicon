// feather ignore all
/// @ignore
function __LexiconLanguageClass(_language, _locale) constructor {
	static _global = __LexiconSystem();
	__language = _language;
	__locale = _locale;
	__fallbacks = [];
	__files = [];
	__remapAsset = {};
	__fonts = {};
	__loaded = false;

	/// @return {String}
	static GetLanguage = function() {
		return __language;
	}
	
	/// @return {String}
	static GetLocale = function() {
		return __locale;
	}

	/// @return {Bool}
	static IsLoaded = function() {
		return __loaded;
	}

	/// @param {String} file
	static AddFile = function() {
		for(var _i = 0; _i < argument_count; ++_i) {
			var _filepath = argument[_i];
			if (__LEXICON_IS_REFERRABLE_TO_DATAFILES) {
				if (!string_starts_with(_filepath, _global.__datafilesFilepath)) && (file_exists(_global.__datafilesFilepath + _filepath)) {
					_filepath = _global.__datafilesFilepath + _filepath;
				} 
			}
        	
			_filepath = filename_path(_filepath) + filename_name(_filepath);
			if (__LEXICON_ERROR_ON_INDEX_FILE_ADD) && (string_starts_with(_filepath, program_directory) || string_starts_with(_filepath, working_directory)) {
				if (!file_exists(_filepath)) {
					__LexiconError($"Unable to add file \"{argument[_i]}\". File missing.");
				}
			}
			var _foundFile = false;
			for(var _j = array_length(__files)-1; _j >= 0; --_j) {
				if (__files[_j].filepath == _filepath) {
					_foundFile = true;
					break;
				}
			}
			
			if (_foundFile) continue;

			var _sharedFile = _global.__sharedFiles[$ _filepath];
			if (!is_undefined(_sharedFile)) {
				array_push(__files, _sharedFile);
			} else {
				var _file = new __LexiconFileClass(_filepath);
				array_push(__files, _file);
				_global.__sharedFiles[$ _filepath] = _file;
			}

			if (IsLoaded()) {
				LexiconIndexLoadFile(_filepath, false, self);
			}
		}
		return self;
	};

	/// @param {array} files
	/// @self
	static AddFileExt = function(_args) {
		method_call(AddFile, _args);
		return self;
	};

	/// @param {String} filepath
	static RemoveFile = function(_filepath) {
		for(var _i = array_length(__files)-1; _i >= 0; --_i) {
			if (__files[_i].filepath == _filepath) {
				array_delete(__files, _i, 1);
				return;
			}
		}
	};

	static ClearFiles = function() {
		array_resize(__files, 0);
	};

	static ClearFallbacks = function() {
		array_resize(__fallbacks, 0);
	};

	/// @return {Array<Struct.__LexiconFileClass>}
	static GetFiles = function() {
		return __files;
	};

	/// @return {Real}
	static FilesCount = function() {
		return array_length(__files);
	};

	/// @return {Real}
	static FallbacksCount = function() {
		return array_length(__fallbacks);
	};

	/// @return {Array<String>}
	static GetFallbacks = function() {
		return __fallbacks;
	};

	/// @param {String} fallback
	static AddFallback = function() {
		var _i = 0;
		repeat(argument_count) {
			if (GetLocale() != argument[_i]) && (!HasFallback(argument[_i])) {
				array_push(__fallbacks, argument[_i]);
			}
			++_i;
		}

		return self;
	};

	/// @param {Array<String>} fallbacks
	static AddFallbackExt = function(_args) {
		var _i = 0;
		repeat(array_length(_args)) {
			if (GetLocale() != _args[_i]) && (!HasFallback(_args[_i])) {
				array_push(__fallbacks, _args[_i]);
			}
			++_i;
		}
		return self;
	};

	/// @param {String} category
	/// @param {Asset.GMFont} font
	static SetFont = function(_fontDir, _font) {
		__fonts[$ _fontDir] = _font;
		return self;
	};

	/// @param {String} category
	/// @return {Asset.GMFont | undefined} 
	static GetFont = function(_fontDir) {
		return __fonts[$ _fontDir];
	};

	/// @param {Any} asset_src
	/// @param {Any} asset_dest
	/// @param {Any} ...
	static AddRemapAsset = function(_assetA, _assetB) {
		var _assetAName = is_string(_assetA) ? _assetA : __LexiconGetAssetName(_assetA);
		

		if (!struct_exists(__remapAsset, _assetAName)) {
			SetRemapAsset(_assetA, _assetB);
		}

		if (argument_count > 2) {
			for(var _i = 2; _i < argument_count; _i += 2) {
				_assetAName = is_string(argument[_i]) ? argument[_i] : __LexiconGetAssetName(argument[_i]);
				if (!struct_exists(__remapAsset, _assetAName)) {
					SetRemapAsset(argument[_i], argument[_i+1]);
				}
			}
		}
		return self;
	};

	/// @param {Any} asset_src
	/// @param {Any} asset_dest
	/// @param {Any} ...
	static SetRemapAsset = function(_assetA, _assetB) {
		var _assetAName = is_string(_assetA) ? _assetA : __LexiconGetAssetName(_assetA);
		_assetA = is_string(_assetA) ? (handle_parse(_assetA) ?? asset_get_index(_assetA)) : _assetA;
		_assetB = is_string(_assetB) ? (handle_parse(_assetB) ?? asset_get_index(_assetB)) : _assetB;

		__remapAsset[$ _assetAName] = _assetB;

		if (argument_count > 2) {
			for(var _i = 2; _i < argument_count; _i += 2) {
				_assetA = argument[_i];
				_assetB = argument[_i+1]
				_assetAName = is_string(_assetA) ? _assetA : __LexiconGetAssetName(_assetA);
				_assetA = is_string(_assetA) ? (handle_parse(_assetA) ?? asset_get_index(_assetA)) : _assetA;
				_assetB = is_string(_assetB) ? (handle_parse(_assetB) ?? asset_get_index(_assetB)) : _assetB;
				__remapAsset[$ _assetAName] = _assetB;
			}
		}
		return self;
	};

	/// @param {String} asset
	/// @return {Any}
	static GetRemapAsset = function(_asset) {
		var _assetName = is_string(_asset) ? _asset : __LexiconGetAssetName(_asset);
		return __remapAsset[$ _assetName] ?? (is_string(_asset) ? (handle_parse(_asset) ?? asset_get_index(_asset)) : _asset); 
	};

	/// @param {String} language_or_locale
	/// @return {Bool}
	static HasFallback = function(_lang) {
		return array_get_index(__fallbacks, _lang) != -1;
	};

	/// @return {String}
	static toString = function() {
		return "Lexicon Language Struct: " + GetLanguage() + "-" + GetLocale();
	};
}