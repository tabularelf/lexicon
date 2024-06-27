/// @ignore
function ___fileTypes() {
	static _types = {
		json: {
			parser: __lexicon_parse_json,
			adder: lexicon_index_add_json
		},
		csv: {
			parser: __lexicon_parse_csv,
			adder: lexicon_index_add_csv
		}
	};
	return _types;
}