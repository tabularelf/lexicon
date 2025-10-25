// Feather disable all

/// Returns if the locale code is supported by the library.
/// 
/// @param localeCode

function UnicLocaleExists(_localeCode)
{
    static _database = __UnicDatabaseCLDR();
    
    return variable_struct_exists(_database, _localeCode);
}