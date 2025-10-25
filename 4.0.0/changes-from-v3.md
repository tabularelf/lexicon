# Changes from v3

Lexicon 4 is a complete rewrite from the ground up. With major improvements made to GameMaker over the years, Lexicon has been able to benefit greatly from these new features. The motivating factor for Lexicon v4 rewrite comes down to four reasons.

1. Simplicity
2. Modularity
3. Easier language swapping & text updates.
4. *Speed*

Lexicon v3 had began the ground work with dynamic variable fetching, variable fetching and a barebones, although not initially exposed, custom file parsers. But as Lexicon v3 was built on previous compatibility from v2 and v1 respectively, Lexicon was not able to achieve it's absolute best as a localisation system. As apart of this rewrite, Lexicon v4 has been not only been able to achieve all of these goals, but provide with even more control and tools for you to completely customize Lexicon. With all of the new major improvements made to Lexicon, as well as a restructure in how Lexicon previously handled text, and moving the caching to the end users responsibility, Lexicon has been able to achieve all of its goals.

!> As this is a complete rewrite of Lexicon v4, a list of compatibility functions can be found [here](v3-equivalent.md).

The following features have been included in Lexicon to allow the following customization.

- Dynamic callbacks 
- Variable modifiers 
- Custom parsers 
- Extensive plug-in system. 

## Plug-ins

Lexicon has began expanding towards a more modular system in mind, allowing potentially a variety of plug-ins to exist. Lexicon provides the means and ability to intercept at any point, and modify or fetch information in-between set stages of Lexicon.
The following plug-ins that have been implemented currently:

- Hot reloading
- Newline replacement
- Undo Unicode
- Force Entry
- Group

## Breaking changes
- Rewrite from the ground up
- Entire API has changed naming convention from snake_case to PascalCase for consistency with TabularElf's own libraries.
- Each language can have its own set of fallbacks.
- Fallback languages are now always loaded in (per main language, fallback languages and global fallback language).
- Existing features separated into plug-ins.
- Locale-based functions are now merged with Language functions.
- Languages can no longer be changed before the first room is loaded. (Due to plug-in system support.)
- Dynamic callback arguments are no longer converted from strings as needed. They are left as strings outright.

## Removed features

- Several of config macros that are now obsolete.
- Definitions system.
- Internal text element cache system (now given to the end user to manage directly).
- Async function (Lexicon now manages the asynchronous calls for you).