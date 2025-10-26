/// @ignore
function __LexiconDynamicParamOptimiser(_target, _parent) {
	if (is_array(_parent.dynamicArgs)) {
		for(var _i = array_length(_parent.dynamicArgs)-1; _i >= 0; --_i) {
			var _ref = _parent.dynamicArgs[_i].ref;
			if (!_ref.isRemoved) && (_ref.isExecuted) {
				var _dynamicPos = array_get_index(__dynamicEntries, _ref);
				if (_dynamicPos != -1) {
					_ref.isRemoved = true;
					array_delete(__dynamicEntries, _dynamicPos, 1);
					__dynamicEntriesLength--;
				}	

				if (_ref.type == __LEXICON_TYPE.DYNAMIC) || (_ref.type == __LEXICON_TYPE.VARIABLE_MODIFIER) {
					__dynamicsToCall--;
				} else if (_ref.type == __LEXICON_TYPE.ENTRY) {
					delete _ref.structRef;
					__entriesLeftToCheck--;
				} else {
					__variablesToCheck--;
				}
			}

			__LexiconDynamicParamOptimiser(_ref, _target);
		}
	}
}