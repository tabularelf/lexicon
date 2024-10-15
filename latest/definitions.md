# Definitions

(See [`lexicon_index_definitions(filename)`](index.md#lexicon_index_definitionsfilename) for what this page is for.)

Often at times you want to allow your community or anyone on your team to add new translations, without having to make a special directory to scan a bunch of files, or hardcoding all files to be declared.

The definitions format is nothing special, as it's based upon JSON. However, it's designed in a way to be both simple while offering advanced functionality.<br>
As the definitions format has grown and evolved overtime, there's been a number of different ways that you can define your definitions file. Here's some of the many examples.


<!-- tabs:start -->

#### **Single Entry**

```json
{
	"English": {
		"locale": "en-US",
		"file": "english.json"
	}
}
```

#### **Multi Entry**

```json
{
	"English": {
		"locale": "en-US",
		"file": "english.json"
	},
	"French": {
		"locale": "fr-FR",
		"file": "french.json"
	}
}
```

#### **CSV Loading**

```json
{
	"English": {
		"locale": "en-US",
		"file": "locale.csv"
	}
}
```

#### **Relative Loading**

**Note**: This will read from the current filepath where `lexicon_index_definitions()` was given.

```json
{
	"English": {
		"locale": "en-US",
		"file": "./english.json"
	}
}
```

#### **Multiple files**

```json
{
	"English": {
		"locale": "en-US",
		"files": ["locale.csv", "english.json"]
	}
}
```

#### **Multiple files (With additional properties)**

```json
{
	"English": {
		"locale": "en-US",
		"files": [{
			"filePath": "locale.csv",
			"arguments": [";", "'"]
		}, 
		{
			"filePath": "english.json",
			"fileType": "json",
			"isAsync": true
		}]
	}
}
```

<!-- tabs:end -->