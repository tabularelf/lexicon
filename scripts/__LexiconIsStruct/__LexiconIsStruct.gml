// feather ignore all
/// @ignore
function __LexiconIsStruct(_value) {
	gml_pragma("forceinline");
	return is_struct(_value) || 
		(is_handle(_value) && instance_exists(_value) && !object_exists(_value)) || 
		instanceof(_value) == "struct";
} 