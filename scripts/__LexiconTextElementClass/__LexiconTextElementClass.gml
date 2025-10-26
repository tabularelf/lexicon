// feather ignore all
/// @ignore
/// @param {Struct.__LexiconEntryClass} entry
/// @param {String} key
/// @param {Array<Any>, undefined} args
function __LexiconTextElementClass(_entry, _key, _args = undefined) constructor {
	static _global = __LexiconSystem();
	static _globalDynamic = _global.__globalDynamic;
	__entry = _entry;
	__entryCache = "";
	__entryDynamic = undefined;
	__args = undefined;
	__argsOriginal = variable_clone(_args, 0);
	__argsDynamic = undefined;
	__isDynamic = false;
	__dynamicEntries = undefined;
	__dynamicEntriesLength = 0;
	__key = _key;
	__language = __entry.__language;
	__entryDynamicLength = 0;
	__staticDynamicGenerated = false;
	__stringsLeftToTemplate = 0;
	__entriesLeftToCheck = 0;
	__frame = -1;
	__hasExecuted = false;
	__variablesToCheck = 0;
	__dynamicsToCall = 0;
	__initialised = false;
	__bypassFrameCooldown = false;

	__Regenerate(_entry, _key, _args);

	/// @return {Function}
	static GetCallback = function() {
		var _inst = method(self, function() {
			static _argArray = [];

			if (argument_count > 0) {
				try {
					array_resize(_argArray, argument_count);
					var _i = 0;
					repeat (argument_count) {
						_argArray[_i] = argument[_i];
						++_i;
					}
        	
        	
					return method_call(Get, _argArray);
				} finally {
					array_resize(_argArray, 0);
				}
			}	

			return Get();			
		});

		_inst.Get = _inst;
		_inst.Update = method(self, Update);
		_inst.GetKey = method(self, GetKey);
		_inst.SetKey = method(self, SetKey);
		_inst.ToStatic = method(self, ToStatic);

		return _inst;
	};

	/// @param {Real} value
	static SetBypassFrameCooldown = function(_value) {
		__bypassFrameCooldown = _value;
		return self;
	};

	/// @param {String} key
	static SetKey = function(_value) {
		_value = is_string(_value) ? _value : string(_value);
		__entry = LexiconPlugInGetEntry(_value);
		__LanguageUpdate();
		return self;
	}

	/// @param {Any} ...
	/// @return {Struct.__LexiconTextElementClass}
	static Update = function() {
		static _argArray = [];
		// No updates
		if (argument_count == 0) return;

		try {
			array_resize(_argArray, argument_count+1);
			var _i = 0;
			repeat(argument_count) {
				_argArray[@ _i+1] = argument[_i];
				++_i;
			}
			//_argArray[@ 0] = __entry.__text;
			// Check arguments
			var _argLen = array_length(_argArray);
			__args ??= [];
			if (!is_array(__argsOriginal)) || (!array_equals(__argsOriginal, _argArray)) {
				__argsOriginal ??= array_create(_argLen);
				array_copy(__argsOriginal, 0, _argArray, 0, _argLen);
				array_resize(__argsOriginal, _argLen);
				__Regenerate();
			}
		} finally {
			array_resize(_argArray, 0);
		}

		return self;
	};

	static GetChildElements = function() {
		var _result = undefined;
		if (is_array(__dynamicEntries)) {
			_result = array_filter(__dynamicEntries, function(_elm) {
				return LexiconIsTextElement(_elm.structRef);
			});

			array_map_ext(_result, function(_elm) {
				return _elm.structRef;
			});
		}

		return _result;
	};

	/// @param {Any} ...
	/// @return {String} 
	static Get = function() {
		static _argArray = [];
		if (__language != __entry.__language) {
			__LanguageUpdate();
		} 

		__initialised = true;

		var _text = __entryCache;

		if ((__hasExecuted) && (__dynamicsToCall <= 0) && (__variablesToCheck <= 0) && (__entriesLeftToCheck <= 0)) {
			// Self optimising
			__isDynamic = false;
			delete __entryDynamic;
			if (is_array(__dynamicEntries)) delete __dynamicEntries;
			if (__stringsLeftToTemplate > 0) {
				Get = __FastGet;
        
				if (argument_count > 0) {
					try {
						array_resize(_argArray, argument_count);
						var _i = 0;
						repeat (argument_count) {
							_argArray[_i] = argument[_i];
							++_i;
						}
        		
						return string_ext(_text, _argArray);
					} finally {
						array_resize(_argArray, 0);
					}
				}
			} else {
				Get = __FastestGet;
			}
			return _text;
		}

		var _frame = LexiconPlugInGetFrame();

		if (!__bypassFrameCooldown) && (__frame == _frame) {
			return _text;
		}

		__hasExecuted = true;

		if (argument_count > 0) {
			try {
				array_resize(_argArray, argument_count);
				var _i = 0;
				repeat (argument_count) {
					_argArray[_i] = argument[_i];
					++_i;
				}
        
				if (__isDynamic) && ((__dynamicsToCall > 0) || (__variablesToCheck > 0) || (__entriesLeftToCheck > 0)) {
					_text = __GetDynamic(_argArray);
				}
        
				_text = string_ext(__isDynamic ? _text : (__entry.__text ?? __key), _argArray);
				return _text;
			} finally {
				array_resize(_argArray, 0);
			}
		}

		if (__isDynamic) {
			_text = __GetDynamic();
		}

		__frame = _frame;
		
		return _text;
	};

	/// @return {Bool}
	static IsStatic = function() {
		return __isDynamic == false;
	}

	static ToStatic = function() {
		if (!__initialised) {
			Get();
		}

		if (__stringsLeftToTemplate > 0) {
			Get = __FastGet;
		} else {
			Get = __FastestGet;
		}

		__isDynamic = false;

		return self;
	};

	static Refresh = function() {
		Get = __Get;
		__Regenerate();
		return self;
	};

	static ResetFrame = function() {
		__frame = -1;
		return self;
	};

	/// @return {String}
	static GetKey = function() {
		return __key;
	};

	/// @return {String}
	static toString = function() {
		return Get();
	};

	static __Get = Get;

	static __Regenerate = function(_entry = __entry, _key = __key, _args = __argsOriginal) {
		static _dynamics = __LexiconSystem().__globalDynamic;
		static _structScan = [_dynamics, LexiconGlobalStructGet()];
		static _entries = __LexiconSystem().__entries;
		__entryDynamic = undefined;
		__dynamicEntries = undefined;
		__isDynamic = false;
		__dynamicEntriesLength = 0;
		__entryCache = __entry.__text ?? _key;
		__hasExecuted = false;
		__variablesToCheck = 0;
		__entriesLeftToCheck = 0;
		__stringsLeftToTemplate = 0;
		__dynamicsToCall = 0;
		__initialised = false;

		if (is_undefined(__entry.__text)) {
			return;
		}

		if (__entry.__isStatic) {
			return;
		}

		var _t;
		if (__LEXICON_VERBOSE) {
			_t = get_timer();
		}

		var _len = is_array(_args) ? array_length(_args) : 0;
		if (_len > 1) {
			if (!is_array(__args)) {
				__args = array_create(_len-1);
			} else {
				array_resize(__args, _len-1);
			}
			array_copy(__args, 0, _args, 1, _len);
		}

		// From here on out, reset the frame
		__frame = -1;

		var _text = __entryCache;
		var _buffStr = buffer_create(string_byte_length(_text), buffer_fixed, 1);
		buffer_write(_buffStr, buffer_text, _text);
		buffer_seek(_buffStr, buffer_seek_start, 0);
		try {
			var _parser = new __LexiconTextParser(_key,_buffStr, __args);
			_parser.__ParseStr();
			__stringsLeftToTemplate = _parser.__stringTemplates;
			__dynamicEntries = _parser.__dynamicEntries;
			__variablesToCheck = _parser.__variablesToCheck;
			__dynamicsToCall = _parser.__dynamicsToCall;
			__entriesLeftToCheck = _parser.__entriesToCheck;
			if (is_array(__dynamicEntries)) {
				__dynamicEntriesLength = array_length(__dynamicEntries);
				__isDynamic = true;
			}
			if (is_array(_parser.__finalText)) {
				if (array_length(_parser.__finalText) >= 1) {
					__entryDynamic = _parser.__finalText;
					__entryCache = string_join_ext("", __entryDynamic, 0, array_length(__entryDynamic));
				} else {
					// Worse case scenario something went wrong
					// we treat it as if there is no dynamic variables or callbacks.
					__dynamicEntriesLength = 0;
					__variablesToCheck = 0;
					__dynamicsToCall = 0;
					__entriesLeftToCheck = 0;
					__isDynamic = false;

					delete __dynamicEntries;
				}
			}
			
			delete _parser;
		
			if (__LEXICON_VERBOSE) {
				__LexiconTrace($"Time taken to parse \"{__key}\": {(get_timer() -_t) / 1000}ms.");
			}
		} finally {
			buffer_delete(_buffStr);
		}
	};

	static __GetDynamic = function() {
		static _entryDynamicCopy = [];
		static __recursiveLevel = 0;
		static _tempArgs = [];

		if (debug_mode) {
			var _entryDynamicCopyDebug = _entryDynamicCopy;
		}
		

		var _globalVars = LexiconGlobalStructGet();
		var _recursiveEntryDynamicCopy = undefined;
		try {
			if (__recursiveLevel >= 1) {
				_recursiveEntryDynamicCopy = array_create(array_length(_entryDynamicCopy));
				array_copy(_recursiveEntryDynamicCopy, 0, _entryDynamicCopy, 0, array_length(_entryDynamicCopy));
				array_resize(_entryDynamicCopy, 0);
			}
               
			__recursiveLevel++;
			var _i = 0;
			var _dynamicUpdate = false;
			var _nameEntry = undefined;
			repeat (__dynamicEntriesLength) {
				_nameEntry = __dynamicEntries[_i];
				var _structResult;
				if (_nameEntry.type == __LEXICON_TYPE.NORMAL) {
					_structResult = struct_get_from_hash(is_undefined(_nameEntry.structRef) ? __args[_nameEntry.pos] : _nameEntry.structRef, _nameEntry.hash);
				} else if (_nameEntry.type == __LEXICON_TYPE.GLOBAL) {
					_structResult = struct_get_from_hash(is_undefined(_nameEntry.structRef) ? _globalVars : _nameEntry.structRef, _nameEntry.hash);				
				}

				if ((_nameEntry.type == __LEXICON_TYPE.NORMAL) || (_nameEntry.type == __LEXICON_TYPE.GLOBAL)) && (_nameEntry.weakValue != _structResult) {
					//_nameEntry.weakValue = _structResult;
					_dynamicUpdate = true;
					break;
				} else if (_nameEntry.type == __LEXICON_TYPE.DYNAMIC) || (_nameEntry.type == __LEXICON_TYPE.VARIABLE_MODIFIER){
					if ((!_nameEntry.isStatic) || (!_nameEntry.isExecuted)) {
						_dynamicUpdate = true;
						break;
					}		
				} else if (_nameEntry.type == __LEXICON_TYPE.ENTRY) {
					if (!_nameEntry.structRef.IsStatic()) && (_nameEntry.weakValue != _nameEntry.structRef.Get()) {
						_dynamicUpdate = true;
						break;
					}		
				}
				++_i;
			}
				
			if (_dynamicUpdate) {
				array_copy(_entryDynamicCopy, 0, __entryDynamic, 0, array_length(__entryDynamic));
				var _len = array_length(__entryDynamic);
				var _dynamicNamesPos = 0;
				while (_dynamicNamesPos < __dynamicEntriesLength) {
					var _nameEntry = __dynamicEntries[_dynamicNamesPos];
					var _pos = _nameEntry.textPos;
					//var _sampleText = _entryDynamicCopy[_pos];
					switch(_nameEntry.type) {
						case __LEXICON_TYPE.DYNAMIC:
						case __LEXICON_TYPE.VARIABLE_MODIFIER:
							if (!_nameEntry.isStatic) || (!_nameEntry.isExecuted) {
								var _result = _pos >= _len ? "" : _entryDynamicCopy[_pos];
								if (is_array(_nameEntry.dynamicArgs)) {
									var _j = 0;
									repeat(array_length(_nameEntry.dynamicArgs)) {
										var _argPos = _nameEntry.dynamicArgs[_j].argPos;
										var _ref = _nameEntry.dynamicArgs[_j].ref;
										_nameEntry.args[_argPos] = _ref.weakValue;
										if (!_ref.isRemoved) && (((_ref.isStatic) && (_ref.isExecuted)) || 
											(!_ref.isStatic && _nameEntry.isStatic && _nameEntry.isExecuted)) {
											var _dynamicPos = array_get_index(__dynamicEntries, _nameEntry.dynamicArgs[_j].ref);
											if (_dynamicPos != -1) {
												_ref.isRemoved = true;
												array_delete(__dynamicEntries, _dynamicPos, 1);
												_dynamicNamesPos--;
												__dynamicEntriesLength--;
											}
                                            
											if (!_ref.isStatic && _nameEntry.isStatic) {
												if (_ref.type == __LEXICON_TYPE.DYNAMIC) || (_ref.type == __LEXICON_TYPE.VARIABLE_MODIFIER) {
													__dynamicsToCall--;
												} else if (_ref.type == __LEXICON_TYPE.ENTRY) {
													delete _ref.structRef;
													__entriesLeftToCheck--;
												} else {
													__variablesToCheck--;
												}
											}
                                             
											__LexiconDynamicParamOptimiser(_ref, _nameEntry);
										}
										++_j;
									}
								}
                             	
								_result = is_array(_nameEntry.args) ? method_call(_nameEntry.callback, _nameEntry.args) : _nameEntry.callback();
								_result = is_string(_result) ? _result : string(_result);
								if (_nameEntry.writeResult) {
									_entryDynamicCopy[_pos] = _result;
								}
								_nameEntry.cacheResult = _result;
								_nameEntry.isExecuted = true;
					
								if (_nameEntry.isStatic) {
									__dynamicsToCall--;
								}
							} else {
								_entryDynamicCopy[_pos] = _nameEntry.cacheResult;
							}

						break;
						case __LEXICON_TYPE.GLOBAL:
							var _structRef = is_undefined(_nameEntry.structRef) ? _globalVars : _nameEntry.structRef;
							var _valueResult = struct_get_from_hash(_structRef, _nameEntry.hash);
							_valueResult = is_string(_valueResult) ? _valueResult : string(_valueResult);
							if (_nameEntry.weakValue != _valueResult)  {
								_nameEntry.cacheResult = _valueResult;
								_nameEntry.weakValue = _valueResult;
							}

							if (_nameEntry.writeResult) {
								_entryDynamicCopy[_pos] = _nameEntry.cacheResult;
							}
						break;
						case __LEXICON_TYPE.NORMAL:
							var _structRef = is_undefined(_nameEntry.structRef) ? __args[_nameEntry.pos] : _nameEntry.structRef;
							var _valueResult = struct_get_from_hash(_structRef, _nameEntry.hash);
							_valueResult = is_string(_valueResult) ? _valueResult : string(_valueResult);
							if (_nameEntry.weakValue !=  _valueResult) {  
								_nameEntry.cacheResult = _valueResult;
								_nameEntry.weakValue = _valueResult;
							}

							if (_nameEntry.writeResult) {
								_entryDynamicCopy[_pos] = _nameEntry.cacheResult;
							}
						break;
						case __LEXICON_TYPE.ENTRY:
							var _structRef = _nameEntry.structRef;
							if (!_structRef.IsStatic()) {
								var _valueResult = _structRef.Get();
								_nameEntry.cacheResult = _valueResult;
								_nameEntry.weakValue = _valueResult;
								
								if (_structRef.IsStatic()) {
									__entriesLeftToCheck--;
								}
							}

							if (_nameEntry.writeResult) {
								_entryDynamicCopy[_pos] = _nameEntry.cacheResult;
							}
						break;
					}
                    
					++_dynamicNamesPos;
				}
               	__staticDynamicGenerated = true;
				__entryCache = string_join_ext("", _entryDynamicCopy, 0, array_length(_entryDynamicCopy));
			} 
			
			return __entryCache;
		} finally {
			if (__recursiveLevel > 1) {
				array_copy(_entryDynamicCopy, 0, _recursiveEntryDynamicCopy, 0, array_length(_recursiveEntryDynamicCopy));
			
			} else {
				array_resize(_entryDynamicCopy, 0);
			}
			__recursiveLevel--;
			array_resize(_tempArgs, 0);
		}
	};

	static __FastestGet = function() {
		if (__language != __entry.__language) {
			Get = __Get;
			__LanguageUpdate();
			
			return Get();
		}
          
		return __entryCache;
	};

	static __FastGet = function() {
		static _argArray = [];
		if (__language != __entry.__language) {
			Get = __Get;
			__LanguageUpdate();

			if (argument_count > 0) {
				try {
					array_resize(_argArray, argument_count);
					var _i = 0;
					repeat (argument_count) {
						_argArray[_i] = argument[_i];
						++_i;
					}
					
					return method_call(Get, _argArray);
				} finally {
					array_resize(_argArray, 0);
				}
			}
		};

		if (argument_count > 0) {
			try {
				array_resize(_argArray, argument_count);
				var _i = 0;
				repeat (argument_count) {
					_argArray[_i] = argument[_i];
					++_i;
				}
        

				return string_ext(__entryCache, _argArray);
			} finally {
				array_resize(_argArray, 0);
			}
		}
          
		return __entryCache;
	};

	static __LanguageUpdate = function() {
		__language = __entry.__language;
		__Regenerate();
	};
}
