## Goal
Zettlr is set up for use in a broad range of academic fields, and I've found it necessary to customize a bunch of the default settings, including the export settings and a large autocorrect and (smaller) snippet library.

My hope is that this helps other chemists and biochemists to get started with Zettlr settings. To use, follow the Zettlr [instructions](https://docs.zettlr.com/en/reference/migrating/) for migrating computers. Only replace these files on a fresh install, before you've modified them! Otherwise, you'll have to figure out how to merge files properly.

***An important note:*** Adding lots of KaTeX equations just to show special characters (i.e. `$\beta$ decay`) can really slow Zettlr's linter, so I've found that adding them as Unicode characters is a better idea. However, *this limits which LaTeX --> PDF engines you can use*. The older pdfTeX does not support unicode characters, but XeTeX and LuaTeX do. 

## Contents
- `autocorrect.json` - an extended list of autocorrects to allow insertion of UniCode greek letters and symbols.
- `custom.css` - Lightens the dark background of the Zettlr dark mode to make chemical structures with transparent backgrounds easier to read.
- `LaTeX-chem.yaml` - A zettlr/pandoc export formula to generate LaTeX files from zettlr with reasonable defaults for a chemical manuscript or notebook. 
- `LuaTeX-Chem-PDF.yaml` - A zettlr/pandoc export formula to generate PDFs from Zettlr files; will work with the UniCode characters inserted by the `autocorrect.json` file.
- `pdfTeX-Chem-PDF.yaml` - a faster PDF export formula, but will not format directly inserted unicode characters (as used by `autocorrects.json`) properly.  
- `snippets`
  - `ce.tpl.md` - allows use of `:ce:` to create a LaTeX chemequation block to properly format chemical formulas and equations.
  - `titleblock.tpl.md` - inserts a titleblock which can be tabbed through. 
- `backup-config.sh` - A bash script to back up zettlr config files (tested on linux). Run script with no commands for usage.

## Usage
To use individual files:
- `.yaml` export files can always be dragged and dropped into `~/.config/Zettlr/defaults`
- Contents of the `snippets` directory can be copied into `~/.config/Zettlr/snippets`
- Please check the contents of your *current* `autocorrect.json` and `custom.css` before overwriting the whole file!! If you have ***any*** prior modifications to either file, you will want to manually merge the files.
- `autocorrect.json` should be pasted into the `autocorrect{...}` block in your `config.json` file.
- Note that custom.css makes specific modifications to the light and dark themes, to make a "light sepia" theme, and a dark theme for which black chemical structures in transparent images (svgs and pngs) are still visible. These may be incompatible with other custom css you have applied.

Using update-config.sh will allow making a backup of your user-modifiable Zettlr config files to a separate directory, which can then be synced to another computer, or changes can be tracked with a git repo. Do not post the whole directory to a public repo, as it contains user-specific info.

## Use on Windows

If using zettlr on Windows, if WSL is installed you can now specify the `-w` flag (it must be *before* the other flags in the sequence for...bash reasons) if on windows to back up from or restore to the Windows zettlr config directory (`C:\Users\<username>\AppData\Roaming\Zettlr\`). 

## Contributions
If you'd like to contribute other YAML files (either journal-specific manuscript export files, or other useful formats) feel free to create a PR.

Modifying the paths to work on WSL or Mac should be easy enough, if you do so and would like to contribute your versions to this repo, that'd be great.
