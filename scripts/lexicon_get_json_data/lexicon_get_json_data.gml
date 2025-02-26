/// @feather ignore all
/// @func lexicon_get_json_data()
/// @return {Any}
function lexicon_get_json_data() {
    static _global = __lexicon_init();
    return _global.jsonData;
}