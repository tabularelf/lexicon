//# feather use syntax-errors
/// @func lexicon_language_get_index()
/// @return {Real}
function lexicon_language_get_index() {
     static Array = lexicon_languages_get_array();
     var _current = lexicon_language_get();
     var i=0; repeat(array_length(Array ) )
     {
        if (_current == Array[i] ) {return i; }
        i++;
     }
     
     return undefined;
}