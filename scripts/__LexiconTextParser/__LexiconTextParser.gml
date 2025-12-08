// feather ignore all
/// @ignore
function __LexiconTextParser(_key, _buffStr, _args) constructor {
	static __LEXICON_UNDEFINED = "$$<@@LEXICON_UNDEFINED@@>$$";
	__key = _key;
	__startPos = 0;
	__endPos = 0;
	__buffStr = _buffStr;
	__len = buffer_get_size(_buffStr);
	__finalText = undefined;
	__finalTextSafe = undefined;
	__stringTemplates = 0;
	__dynamicEntries = undefined;
	__args = _args;
	__argsString = is_array(__args) ? array_filter(__args, function(_elm) {return !is_struct(_elm)}) : undefined;
	if (is_array(__argsString)) array_map_ext(__argsString, function(_elm) {return is_string(_elm) ? _elm : string(_elm)});
	__argsStringLength = is_array(__argsString) ? array_length(__argsString) : 0;
	__lastEntryWasDynamic = false;
	__lastEntryDynamicPos = 0;
	__lastEntryTemplatePos = 0;
	__globalVars = LexiconGlobalStructGet();
	__variablesToCheck = 0;
	__dynamicsToCall = 0;
	__entriesToCheck = 0;
	__lastEntryWasTemplate = false;
	__stringTemplatesLookup = undefined;

	static __DynamicCleanupCallback = function(_elm) {
		if (is_array(_elm.ref.dynamicArgs)) {
			array_foreach(_elm.ref.dynamicArgs, __DynamicCleanupCallback);
		}
		array_delete(__dynamicEntries, array_get_index(__dynamicEntries, _elm.ref), 1);
		delete _elm;
	};

	static _argCleanup = function(_elm, _index) {
		var _elmOld = _elm;
		_elm = string_trim(_elm)
		var _numCheck = string_replace(string_replace(_elm, "{", ""), "}", "")
		if (string_length(_elm) != 0) {
			if (__IsNumber(_numCheck)) && (real(_numCheck) < __argsStringLength) {
				_elm = __argsString[real(_numCheck)];
			} 
		}
		
		if (_elm == "") {
			_elm = __LEXICON_UNDEFINED;
		}
		return _elm;
	};

	static _handleArgs = function(_args, _orgString) {
		static _searchStart = function(_elm) {
			return string_starts_with(_elm, "'") && !(string_ends_with(_elm, "'") || string_last_pos("'", _elm) > 0);
		};

		static _searchEnd = function(_elm) {
			return (string_ends_with(_elm, "'") || string_last_pos("'", _elm) > 0) && !string_starts_with(_elm, "'");
		}

		array_map_ext(_args, _argCleanup);

		if (string_pos("'", _orgString) > 0) {
			var _index = array_find_index(_args, function(_elm) {
				return string_starts_with(_elm, "'") && !string_ends_with(_elm, "'");
			});
        	      
        	      
			if (_index != -1) {
				while(_index != -1) {
					var _otherIndex = array_find_index(_args, _searchEnd);
        	    	
					if (_otherIndex != -1) && (_index != _otherIndex) {
						var _newStr = string_join_ext(", ", _args, _index, _otherIndex);
						array_delete(_args, _index, _otherIndex);
						array_insert(_args, _index, _newStr);
					}
        	
					var _index = array_find_index(_args, _searchStart);
				}
			}
		}
	}

	static __ParseStr = function() {
		static _stackKeys = __LexiconSystem().__stackKeys;
		if (array_length(_stackKeys) > __LEXICON_TEXT_PARSER_MAX_REFERENCE_STACK) {
			var _str = "";
			_str += "\n" + $"\"{_stackKeys[0]}\"" + "<-- initial entry";
			for(var _i = 1; _i < array_length(_stackKeys); ++_i) {
				_str += "\n" + $"{string_repeat(" ", _i)}└─\"{_stackKeys[_i]}\"";
			}
			
			
			__LexiconError($"Recursion level call reached.\nPlease ensure that there isn't any localised entries within your text!\nRecursive entry stack:{_str}");
			return;
		}
		while(buffer_tell(__buffStr) < __len) {
			var _charCode = buffer_read(__buffStr, buffer_u8);
			if (_charCode == ord(" ") || _charCode == ord("\n") || _charCode == ord("\r")) {
				++__endPos;
				continue;
			}
        	
			if (_charCode == ord("{")) {
				// Parse the rest of the string
				_charCode = buffer_peek(__buffStr, buffer_tell(__buffStr), buffer_u8);
				if (_charCode != ord("{") && _charCode != ord("}")) {
					if (__startPos < __endPos) __AddTextBuff(undefined);
					__startPos = __endPos+1;
					__ParseTemplate();
				} else {
					++__endPos;
				} 
			} else {
				++__endPos;
			}
		}
		
		if  (__lastEntryDynamicPos < buffer_get_size(__buffStr)) && (__lastEntryTemplatePos < buffer_get_size(__buffStr)) {
			__AddTextBuff(0);
		}
        
		if (!__lastEntryWasDynamic) && (!__lastEntryWasTemplate) {
			
			var _strArrayLen = array_length(__finalText);
			if (_strArrayLen > 1) {
				__finalText[@ _strArrayLen-2] += __finalText[@ _strArrayLen-1];
				array_resize(__finalText, _strArrayLen-1);
			}
		}
        
		// Finale
		if (__dynamicsToCall > 0) {
			for(var _i = array_length(__dynamicEntries)-1; _i >= 0; --_i) {
				if (is_array(__dynamicEntries[_i].args)) {
					array_map_ext(__dynamicEntries[_i].args, function(_elm) {
						if (_elm == __LEXICON_UNDEFINED) {
							_elm = undefined;
						}
			
						return _elm;
					});
        
					while(array_last(__dynamicEntries[_i].args) == undefined) {
						array_pop(__dynamicEntries[_i].args);
					}
				}
			}
		}
	}

	static __ParseTemplateInner = function(_startPos = __startPos, _endPos = _endPos, _passedDynamicsArgs = undefined) {
		static _dynamics = __LexiconSystem().__globalDynamic;
		static _dynamicModifiers = __LexiconSystem().__globalDynamicModifiers;
		static _stackKeys = __LexiconSystem().__stackKeys;
		var _lastChar = (buffer_tell(__buffStr) == __len) ? "" : "}";

		var _entry = __GetStr(_startPos, _endPos);
		var _oldEntry = _entry;
		if (!__IsNumber(_entry)) {
			// Possibly Dynamic

			var _foundDynamic = false;
			var _args = undefined;
			var _argsStr = "";

			if (string_pos(",", _entry)) {
				_args = string_split(_entry, ",");
				_argsStr = array_shift(_args);
				_handleArgs(_args, _entry);
				if (!struct_exists(_dynamics, _argsStr)) {
					// Check if variable modifier*
					if (string_starts_with(_argsStr, "GLOBAL.")) {
						_argsStr = string_delete(_argsStr, 1, string_length("GLOBAL."));
					} else if (string_starts_with(_argsStr, "LOCAL.")) {
						_argsStr = string_delete(_argsStr, 1, string_length("LOCAL."));
					}

					if (struct_exists(__globalVars, _argsStr) || __GetArgumentStructIndexByName(_argsStr) >= 0) && (array_length(_args) > 0) && (struct_exists(_dynamicModifiers, string_trim(_args[0]))) {
						var _argEntry = string_trim(_args[0]);
						var _argStructIndex = __GetArgumentStructIndexByName(_argsStr);//struct_exists(__globalVars, _argsStr);
						var _variable = __AddDynamic(_argsStr, _argStructIndex == -1 ? __LEXICON_TYPE.GLOBAL : __LEXICON_TYPE.NORMAL, array_length(__finalText), _argStructIndex);
						_variable.writeResult = false;
						_passedDynamicsArgs ??= [];
						array_foreach(_passedDynamicsArgs, function(_elm) {
							_elm.argPos++;
						});
						array_insert(_passedDynamicsArgs, 0, {
							ref: _variable,
							text: _variable.key,
							argPos: 0,
						});

						
						_foundDynamic = true;
						__AddText("{" + _oldEntry + "}");
						__AddDynamic(_argEntry, __LEXICON_TYPE.VARIABLE_MODIFIER, array_length(__finalText)-1, -1, _args, _passedDynamicsArgs);
						__dynamicsToCall++;
						__variablesToCheck++;
						__lastEntryDynamicPos = buffer_tell(__buffStr);
					} else {
						// Destroy all passed dynamic arguments
						if (is_array(_passedDynamicsArgs)) {
							array_foreach(_passedDynamicsArgs, __DynamicCleanupCallback);
						}
                     	
						// Treat as static
						if (__lastEntryWasDynamic) {
							__AddText("{" + _oldEntry + _lastChar);
						} else {
							__finalText[array_length(__finalText)-1] += "{" + _oldEntry + _lastChar;
							if (__IsWhitespace(buffer_peek(__buffStr, buffer_tell(__buffStr), buffer_u8))) {
								__finalText[array_length(__finalText)-1] += __GetStr(buffer_tell(__buffStr), buffer_tell(__buffStr)+1);
							}
						}
						__lastEntryWasDynamic = false;
						__lastEntryWasTemplate = false;
                     	
						// Buffer
						__AddText("", -1, true);
						if (buffer_tell(__buffStr) < __len) {
							buffer_read(__buffStr, buffer_u8);
						}
						return;
					}
				} else {
					_entry = string_copy(_entry, 1, string_pos(",", _entry)-1);
				}
			}
 
			if (is_array(_args)) {
				// Handle arguments without proper dynamic entries
				var _dynamicCallLevel = 0;
				var _passedDynamicLength = array_length(_passedDynamicsArgs);
				
				var _len = array_length(_args);
				for(var _i = 0; _i < _len; ++_i) {
					var _str = _args[_i];
					if (string_ord_at(_str, 1) == ord("{") && string_ord_at(_str, string_length(_str)) != ord("}")) {
						_dynamicCallLevel++;
					}

					_str = string_delete(
						string_delete(_str, string_length(_str), 1),
						1,
						1
					);
 
					if (_dynamicCallLevel == 0) {
						// Make sure these variables don't exist already
						var _foundMatch = false;
						for(var _j = 0; _j < _passedDynamicLength; ++_j) {
							if (_passedDynamicsArgs[_j].text == _str) {
								_foundMatch = true;
								break;
							}
						}

						if (_foundMatch) continue;


						if (is_array(__args)) {
							var _structLen = array_length(__args);
							for(var _j = 0; _j < _structLen; ++_j) {
								if (is_struct(__args[_j])) && (struct_exists(__args[_j], _str)) {
									var _dynamic = __AddDynamic(_str, __LEXICON_TYPE.NORMAL, -1, -1);
									array_push(_passedDynamicsArgs, {
										ref: _dynamic,
										text: _dynamic.key,
										argPos: _i,
									});
            						  
									_dynamic.writeResult = false;
									__variablesToCheck++;
								}
							}
						} else if (struct_exists(__globalVars, _str)) {
							var _dynamic = __AddDynamic(_str, __LEXICON_TYPE.GLOBAL, -1, -1);
							array_push(_passedDynamicsArgs, {
								ref: _dynamic,
								text: _dynamic.key,
								argPos: -1,
							});
            				  
							_dynamic.writeResult = false;
							__variablesToCheck++;
						} 
					}
				}
			}

			if (struct_exists(_dynamics, _entry)) {
				_foundDynamic = true;
				__AddText("{" + _oldEntry + "}");
				__AddDynamic(_entry, __LEXICON_TYPE.DYNAMIC, array_length(__finalText)-1, -1, _args, _passedDynamicsArgs);
				__dynamicsToCall++;
			} else if (is_array(__args) || __LexiconStructKeyExists(__globalVars, 
				(string_starts_with(_entry, "GLOBAL.") ? string_delete(_entry, 1, string_length("GLOBAL.")) : _entry)
				)) {
				if (is_array(__args)) { 
					if (string_starts_with(_entry, "LOCAL.")) {
						_entry = string_delete(_entry, 1, string_length("LOCAL."));
					}
					var _len = array_length(__args);
					for(var _i = 0; _i < _len; ++_i) {
						if (is_struct(__args[_i])) {
							if (__LexiconStructKeyExists(__args[_i], _entry)) {
								var _structRef = undefined;
								if (string_pos(".", _entry) > 0) {
									_structRef = __LexiconStructKeyGetRoot(__args[_i], _entry);
								}
								__AddText("{" + _oldEntry + _lastChar);
								__AddDynamic(_entry, __LEXICON_TYPE.NORMAL, array_length(__finalText)-1, _i, undefined, undefined, _structRef);
								__variablesToCheck++;
								_foundDynamic = true;
								break;
							}
						}
					}
				}
            
				if (!_foundDynamic) {
					if (string_starts_with(_entry, "GLOBAL.")) {
						_entry = string_delete(_entry, 1, string_length("GLOBAL."));
					}

					if (__LexiconStructKeyExists(__globalVars, _entry)) {
						var _structRef = undefined;
						if (string_pos(".", _entry) > 0) {
							_structRef = __LexiconStructKeyGetRoot(__globalVars, _entry);
						}
						__AddText("{" + _oldEntry + _lastChar);
						__AddDynamic(_entry, __LEXICON_TYPE.GLOBAL, array_length(__finalText)-1, -1, undefined, undefined, _structRef);
						__variablesToCheck++;
						_foundDynamic = true;
					}
				}
			} 
             
			if (!_foundDynamic) {
				var _strArrayLen = array_length(__finalText);
				 if (!__LEXICON_ALLOW_ENTRY_REFERENCING_IN_TEXT) {
					__lastEntryWasDynamic = false;
					__AddText("{" + _oldEntry + _lastChar);
				 } else { 
					if (__LEXICON_ENFORCE_TEXT_ENTRY_EXPLICIT_ACCESSOR) && (!string_starts_with(_entry, "TEXT.")) {
						__lastEntryWasDynamic = false;
						__AddText("{" + _oldEntry + _lastChar);
					} else {
						if (string_starts_with(_entry, "TEXT.")) {
							_entry = string_delete(_entry, 1, string_length("TEXT."));
						}
                     	
						if (LexiconPlugInExistsEntry(_entry)) {
							var _keyEntry = LexiconPlugInGetEntry(__key);
							if (is_undefined(_keyEntry)) {
								var _lang = _keyEntry.GetLanguage().GetLocale();
							} else {
								var _lang = __LexiconLanguageDummy().GetLocale();								
							}

							array_push(_stackKeys, $" '{__key}' from locale '{_lang}' ");
							var _textElement = is_array(__args) ? LexiconExt(_entry, __args) : Lexicon(_entry);
							array_pop(_stackKeys);
							__AddText("{" + _oldEntry + _lastChar);
							__AddDynamic(_entry, __LEXICON_TYPE.ENTRY, array_length(__finalText)-1, -1, undefined, undefined, _textElement);
							__entriesToCheck++;
							__lastEntryDynamicPos = buffer_tell(__buffStr);
						} else {
							__lastEntryWasDynamic = false;
							__AddText("{" + _oldEntry + _lastChar);
						}
					}
				} 
			} else {  
				__lastEntryDynamicPos = buffer_tell(__buffStr);
			}         

			__lastEntryWasTemplate = false;
		} else {   
			// Is a number, handle with care!
			var _strArrayLen = array_length(__finalText);
			var _result;
			if (__argsStringLength == 0) {
				_result = "{" + _entry + "}";
				++__stringTemplates;
			} else {
				if (real(_entry) < __argsStringLength) {
					_result = __argsString[real(_entry)];
				} else {
					__stringTemplatesLookup ??= {};
					++__stringTemplates;
					if (__LEXICON_ADJUST_UNUSED_STRING_TEMPLATES) {
						__stringTemplatesLookup[$ _entry] ??= string(__stringTemplates++); 
						_result = "{" + __stringTemplatesLookup[$ _entry] + "}";
					} else {
						if (!struct_exists(__stringTemplatesLookup, _entry)) {
							// Filling in a blank
							__stringTemplatesLookup[$ _entry] = true;
						}
						_result = "{" + _entry + "}";
					}
				}
			}
			__AddText(_result);
			_strArrayLen++;
			if (_strArrayLen > 1) && (!__lastEntryWasDynamic) && (!is_array(_passedDynamicsArgs)) {
				__finalText[@ _strArrayLen-2] += __finalText[@ _strArrayLen-1];
				array_resize(__finalText, _strArrayLen-1);
				__lastEntryWasDynamic = false;
			} 
			
			__lastEntryTemplatePos = buffer_tell(__buffStr);
			__lastEntryWasTemplate = true;
		}	         
	};

	static __ParseTemplateArguments = function(_args = undefined) {
		var _charCode = 0x0;
		var _newArgs = undefined;
		var _newPos = buffer_tell(__buffStr);
		
		while(_charCode != ord("}")) {
			if (buffer_tell(__buffStr) >= __len) {
				break;
			}

			_charCode = buffer_read(__buffStr, buffer_u8);

			if (_charCode ==  ord("'")) {
				//var _firstEscapePos = buffer_tell(__buffStr);
				//var _lastEscapePos = _firstEscapePos;
				var _inArguments = 0;
                
				while(true) {
					_charCode = buffer_read(__buffStr, buffer_u8);
					if (_charCode == ord(",")) {
						if (_inArguments == 0) {
							break;
						}
 					}
                
					if (_charCode == ord("{")) {
						_inArguments++;
					}
                
					if (_charCode == ord("'")) {
						_lastEscapePos = buffer_tell(__buffStr);
					}
                
					if (_charCode == ord("}")) {
						_inArguments--;
                
						if (_inArguments <= -1) {
							break;
						}
					}
				}
                
				//if (_firstEscapePos != _lastEscapePos) {
				//	buffer_seek(__buffStr, buffer_seek_relative, 1);
				//}
			} else if (_charCode == ord("{")) {
				_newArgs ??= [];
				__ParseTemplateArguments(_newArgs);
			}
		}

		if (buffer_tell(__buffStr) < __len) {
			__ParseTemplateInner(_newPos, buffer_tell(__buffStr)-1, _newArgs);
                
			if (__lastEntryWasDynamic) {
				var _dynamic = array_last(__dynamicEntries);
				array_push(_args, {
					ref: _dynamic,
					text: _dynamic.key,
					argPos: 0,
				});
        	      
				
				_dynamic.writeResult = false;
			}

			if (array_length(__finalText) > array_length(__finalTextSafe)) {
				array_pop(__finalText);
			}
		}
	}

	static __ParseTemplate = function() {
		var _args = undefined;
		var _argCount = 0;
		var _completeClose = false;
		if (buffer_tell(__buffStr) >= __len) {
			__AddText(__GetStr(__startPos-1, buffer_tell(__buffStr)));
			return;
		}
		
		while((buffer_tell(__buffStr) < __len)) {
			var _charCode = buffer_read(__buffStr, buffer_u8);

			if (_charCode == ord("{")) {
				_args ??= [];
				__ParseTemplateArguments(_args);

				continue;
			}

			if (_charCode == ord("}")) {
				_completeClose = true;
				//var _entry = __GetStr(__startPos, __endPos);
				__ParseTemplateInner(__startPos, buffer_tell(__buffStr)-1, _args);
				__endPos = buffer_tell(__buffStr) + 1;
				__startPos = __endPos-1;
				break;
			} 
		}

		if (buffer_tell(__buffStr) >= __len) {
			__startPos--;

			if (!_completeClose) {
				__endPos = buffer_tell(__buffStr);
				if (is_array(_args)) {
					array_foreach(_args, __DynamicCleanupCallback);
				}
			}
		}
	}

	static __GetStr = function(_startPos = __startPos, _endPos = __endPos) {
		return __LexiconBufferStrCopy(__buffStr, _startPos, _endPos);
	}
	
	static __AddText = function(_str, _pos = -1, _forced = false, _ensureSafety = false, _directInsert = false) {
		__finalText ??= [];
		__finalTextSafe ??= [];
		if (_str == "") && (!_forced) return;
		if (_pos == -1) {
			array_push(__finalText, _str);	
		} else if (_directInsert) {
			array_insert(__finalText, _pos, _str);
		} else {
			__finalText[_pos] += _str;
		}

		if (_ensureSafety) {
			__finalTextSafe[_pos == -1 ? array_length(__finalText)-1 : _pos] = true;
		}
	}

	static __AddTextBuff = function(_offset = -1, _ensureSafety = false) {
		__endPos = buffer_tell(__buffStr)+_offset;
		__AddText(__LexiconBufferStrCopy(__buffStr, __startPos, __endPos), undefined, false, _ensureSafety);
	}

	static __AddDynamic = function(_name, _type, _textPos, _pos = -1, _args = undefined, _dynamicsArgs = undefined, _structRef = undefined) {
		static _globalDynamics = __LexiconSystem().__globalDynamic;
		static _dynamicModifiers = __LexiconSystem().__globalDynamicModifiers;
		static _ctx = {
			ref: undefined,
			cleansed: false,
		};

		static _callback = method(_ctx, function(_elm) {
			with({key: _elm, ref: ref}) {
				var _index = array_find_index(ref, function(_elm) {
					if (array_get_index(ref, "{" + (is_struct(_elm) ? _elm.ref.key : _elm) + "}") >= 0) {
						// Normal, do not cleanse
						return false;
					}
            	
					if (is_struct(_elm)) {
						if (string_ord_at(key, 1) == ord("{")) && (string_count("}", key) == 0) {
							return true;
						}
					}

					if (string_ord_at(key, 1) != ord("{")) && (string_count("}", key) == 1) {
						return true;
					}

					// End of argument, could ignore
					if (string_ord_at(key, string_length(key)) == ord("}")) && (string_count("}", key) > 0) {
						return false;
					}
            	
					return false;
				});
			} 

			// Normal, leave it
			if (_index == -1) {
				return _elm;
			}
		
			// Found, cleanse it now!
			cleansed = true;
			return undefined;
		});

		__dynamicEntries ??= [];
		__lastEntryWasDynamic = true;

		if (is_array(_args) && is_array(_dynamicsArgs)) {
			var _markedArgs = [];

			// Cleansing of dynamic arguments
			var _argsLength = array_length(_dynamicsArgs);
			_ctx.cleansed = false;
			for(var _i = 0; _i < _argsLength; ++_i) {
				if (is_array(_dynamicsArgs[_i].ref.dynamicArgs)) {
					_ctx.ref = _dynamicsArgs[_i].ref.dynamicArgs;
					array_map_ext(_args, _callback);
				}
			}

			for(var _i = 0; _i < _argsLength; ++_i) {
				if (is_array(_dynamicsArgs[_i].ref.args)) {
					_ctx.ref = _dynamicsArgs[_i].ref.args;
					array_map_ext(_args, _callback);
				}
			}
			_ctx.ref = undefined;


			if (_ctx.cleansed) {
				for(var _i = array_length(_args)-1; _i >= 0; --_i) {
					if (is_undefined(_args[_i])) {
						array_delete(_args, _i, 1);
					}
				}
			}

			_argsLength = array_length(_args);

			// Matching dynamic arguments and their argument position.
			for(var _i = array_length(_dynamicsArgs)-1; _i >= 0; --_i) {
				var _key = "{" + _dynamicsArgs[_i].ref.key + "}";
				var _alreadyMarked = true;
				var _offset = 0;
				while(_alreadyMarked) {
					var _foundMarked = false;
					var _index = array_get_index(_args, _key, _offset);
					if (_index == -1) {
						// Handle edge cases
						for(var _j = array_length(_args)-1; _j >= 0; --_j) {
							var _arg = _args[_j];
							if (!is_string(_arg)) continue;
							
							if (string_pos(_dynamicsArgs[_i].ref.key, _arg) > 0) {
								if (string_ord_at(_arg, 1) == ord("{")) {
									_index = _j;
									break;
								} else if (string_starts_with(_arg, _dynamicsArgs[_i].ref.key)) && (string_ord_at(_arg, string_length(_arg)) == ord("}") && string_ord_at(_arg, string_length(_arg)-1) == ord("}")) {
									_index = _j;
									break;
								}
							}
						}
					}

					if (_index != -1) {
						for(var _k = array_length(_markedArgs)-1; _k >= 0; --_k) {
							if (_markedArgs[_k].value == _key && _markedArgs[_k].index == _index) {
								_offset++;
								_foundMarked = true;
								break;
							}
						}
					} 

					if (_offset > _argsLength) {
						// Definitely not found
						break;
					}

					if (!_foundMarked) {
						_alreadyMarked = false;
						if (_index != -1) {
							_dynamicsArgs[_i].argPos = _index;
						}
					}

					if (!_alreadyMarked) {
						array_push(_markedArgs, {
							value: _key,
							index: _index,
						});
					}
				}
			}
		
		}

		// Post args cleanup
		if (is_array(_args)) {
			array_map_ext(_args, function(_elm) {
				if (string_ord_at(_elm, 1) == ord("'") && string_ord_at(_elm, string_length(_elm)) == ord("'")) {
					_elm = string_copy(_elm, 2, string_length(_elm)-2);
				}

				return _elm;
			});
		}
		var _hashKey = "";
		if (_type == __LEXICON_TYPE.NORMAL || _type == __LEXICON_TYPE.GLOBAL) {
			if (string_pos(".", _name) > 0) {
				_hashKey = string_delete(_name, 1, string_last_pos(".", _name));
			} else {
				_hashKey = _name;
			}
		} 
		var _dynamic = {
			structRef: _structRef,
			writeResult: true,
			cacheResult: _type == __LEXICON_TYPE.CONSTANT ? _name : "",
			key: _name, 
			type: _type, 
			pos: _pos,
			textPos: _textPos,
			hash: _type == __LEXICON_TYPE.NORMAL || _type == __LEXICON_TYPE.GLOBAL ? variable_get_hash(_hashKey) : -1,
			weakValue: undefined,
			isExecuted: (_type == __LEXICON_TYPE.CONSTANT ? true : false),
			isRemoved: false,
			args: _args,
			dynamicArgs: _dynamicsArgs,
			isStatic: _type == __LEXICON_TYPE.DYNAMIC ? _globalDynamics[$ _name].isStatic : (_type == __LEXICON_TYPE.CONSTANT ? true : false),
			callback: _type == __LEXICON_TYPE.DYNAMIC ? _globalDynamics[$ _name].callback : (_type == __LEXICON_TYPE.VARIABLE_MODIFIER ? _dynamicModifiers[$ _name].callback : undefined)
		};

		array_push(__dynamicEntries, _dynamic);

		return _dynamic;
	}

	static __IsNumber = function(_str) {
		static _buffNum = buffer_create(1024, buffer_grow, 1);
		var _len = string_byte_length(_str); 
		if (_len == 0) return false;
		buffer_poke(_buffNum, 0, buffer_text, _str);
		buffer_seek(_buffNum, buffer_seek_start, 0);
		while(buffer_tell(_buffNum) < _len) {
			var _charCode = buffer_read(_buffNum, buffer_u8);
			if !(_charCode >= 0x30 && _charCode <= 0x39) {
				return false;
			}
		}
		return true;
	}

	static __IsWhitespace = function(_charCode) {
		return _charCode == ord("\n") || _charCode == ord("\r") || _charCode == ord(" ") || _charCode == ord("	");
	}

	static __GetArgumentStructIndexByName = function(_name) {
		var _len = array_length(__args);
		for(var _i = 0; _i < _len; ++_i) {
			if (is_struct(__args[_i])) && (struct_exists(__args[_i], _name)) {
				return _i;
			}
		}

		return -1;
	};
}

function __LexiconBufferStrCopy(_buff, _start, _end) {
	static _buffStrCopy = buffer_create(1024, buffer_grow, 1);
	if (_start > _end) return "";
	buffer_copy(_buff, _start, _end, _buffStrCopy, 0);
	buffer_poke(_buffStrCopy, _end-_start, buffer_u8, 0); // NULL byte
	buffer_seek(_buffStrCopy, buffer_seek_start, 0);
	return buffer_read(_buffStrCopy, buffer_text);
}