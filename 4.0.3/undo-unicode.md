# Undo Unicode
This is a relatively simple plug-in that corrects characters that may have been subtly replaced by other text editors, to revert to their standard ASCII-compatiable variant (aka 32-128 UTF8 number space). Ensuring that the text is kept as-is based on the writers intent. 

?> While many of these symbols will look about the same to the naked eye, their underlying UTF8 value differs completely. 

|Character name| Default | Replaced with |
|---|---|---|
|Ellipsis|`…`|`...`|
|En dash|`–`|`-`|
|En dash|`–`|`-`|
|Em dash|`—`|`-`|
|Horizontal bar|`―`|`-`|
|Start Single Quote |`‘`| `'`|
|End Single Quote |`’`| `'`|
|Start Double Quote|`“`| `"`|
|Emd Double Quote|`”`| `"`|
|Low Double Quote|`„`| `"`|
|High Double Quote|`‟`| `"`|
|Greek question mark|`;`| `;`|