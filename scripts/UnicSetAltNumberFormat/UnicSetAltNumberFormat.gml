// Feather disable all

/// Sets whether alternate number formats should be used. Alternate number formats are an
/// affordance for local practice which may not be reflected in the rigid Unicode specification.
/// Use of this feature is optional.
/// 
/// At the time of writing, there is only one alternate format: using units of ten thousand for
/// Chinese and Japanese locales. For example, the English 12,345 is sometimes written as 1,2345 in
/// older documents and many people are more familiar with this way of writing large numbers.
/// Furthermore, Chinese and Japanese languages use a "ten thousand" counter word so writing
/// numbers in units of ten thousands is helpful.
/// 
/// @param state

function UnicSetAltNumberFormat(_state)
{
    static _system = __UnicSystem();
    
    _system.__altNumberFormat = _state;
}