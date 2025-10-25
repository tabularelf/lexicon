/// @return {Struct.__LexiconTextElementClass
function __LexiconUnique(_hash) {
	static _cache = __LexiconUniqueSystem().__LexiconCache;
	if (is_undefined(struct_get_from_hash(_cache, _hash))) {
		// Because GameMaker doesn't let us retrieve the hash name
		// We need to instead manually fetch it with a dummy struct
		var _inst = {
			hash: _hash,
			entries: {},
		};
		_inst.callback = method(_inst, __LexiconUniqueGenerate);
		struct_set_from_hash(_cache, _hash, _inst);
	}	

	return struct_get_from_hash(_cache, _hash);
}