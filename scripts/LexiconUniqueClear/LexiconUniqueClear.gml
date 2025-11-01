function LexiconUniqueClear() {
	static _cache = __LexiconUniqueSystem();
	with(_cache) {
		struct_foreach(_cache, function(_name, _value) {
			with(_value) {
				struct_foreach(_value, function(_name, _value) {
					 delete self[$ _name];
				});
			}
		});
	}
}