/// @param {String} key
/// @desc Returns whether the text entry is loaded or not. (This includes for entries that do not exist.)
function LexiconEntryIsLoaded(_key) {
  return LexiconPlugInExistsEntry(_key) && !is_undefined(LexiconPlugInGetEntry(_key).GetText());
}