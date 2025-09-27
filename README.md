# bin

These scripts come with no warrantee. In other words, I can't promise they all work, so test them before you use them!

Local binaries and scripts for simple tools.

Name using heirarchical naming, all lowercase, underscore separator. Ex. `photo_rename`, `video_to_h264`.

# Scripts

## Script utilities

- **chmox** Quickly makes new scripts executable. `chmox <script>`
- **mksh** Opens a new executable shell script in Vim. `mksh <new_script>`

# Planned

- **photo_rename** Rename and reorganize photos into `/YYYY/YYYY-MM-DD-<optional-description>/YYYY-MM-DD_HH-MM-SS-<##unique_id><optional-description>.ext` .Add a two digit uniqui_id to differentiate between two images taken at the same time. Based on creation date metadata.[9 Degrees Below Photography: EXIF Commands](https://ninedegreesbelow.com/photography/exiftool-commands.html)
  - `exiftool '-filename<CreateDate' -d ~/Photos/<path_to_renamed_photos>/%Y/%Y-%m-%d<optional-description>/%Y-%m-%d-%H-%M-%S-%%-c-<optional-description>.%%le -r <path_to_current_photos>`
  - **DigiKam** `[date:"yyyy-MM-dd_HH-MM-ss"]{unique:2,-,0}`
- **photo_backup** Use Rsync to back up a directory of photos. Optionally compress with tar/gzip?

## Notes

- **note_rename** Renames the note, and all references to the note within `[[wikilinks]]` in the Notes directory.
- **note_search** Fuzzy search all values within `[[wikilinks]]` in the Notes directory. 

## Photography

- **generate_lut** Create a HaldCLUT. See the *How it works* section of [RawTherapee: Film Simulation](https://rawpedia.rawtherapee.com/Film_Simulation) for example code to generate with ImageMagick.

## System utilities

- **backup** Daily, weekly, and monthly backups of home directory. See [Tony Teaches Tech](https://tonyteaches.tech/rsync-backup-tutorial/) 

# Creating new scripts

1. Run `mksh <scriptname>`
2. Add a description, and list any dependancies
3. Use the provided functions and [style guide](#style-guide)
4. Run shellcheck and correect any errors

# Style guide

## Messages

User interaction inspired by pacman and paru messages:

- `::` Blue double colons for general messages
- `::` Red double colons for general messages
- `Warning:` Yellow warnings
- `Error:` Red errors
- `Useage:` Green Useage
- `Useage:` User input in `purple`
- `==>` Green processes
- ` -->` Blue subprocesses
- `==> Error:` Red process errors (Retrieving...)
- `==> Warning:` Yellow process errors (Found)

TODO: Add custom progress bar function and style

