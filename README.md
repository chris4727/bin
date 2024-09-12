# bin

Local binaries and scripts for simple tools.

Name using heirarchical naming, all lowercase, underscore separator. Ex. `photo_rename`, `video_to_h264`.

## Script utilities

- **chmox** Quickly makes new scripts executable. `chmox <script>`
- **mksh** Opens a new executable shell script in Vim. `mksh <new_script>`

# Planned

- **backup** Daily, weekly, and monthly backups of home directory. See [Tony Teaches Tech](https://tonyteaches.tech/rsync-backup-tutorial/) 

## Photography

- **generate_lut** Create a HaldCLUT. See the *How it works* section of [RawTherapee: Film Simulation](https://rawpedia.rawtherapee.com/Film_Simulation) for example code to generate with ImageMagick.
- **photo_rename** Rename and reorganize photos into `/YYYY/YYYY-MM-DD-<optional-description>/YYYY-MM-DD_HH-MM-SS-<##unique_id><optional-description>.ext` .Add a two digit uniqui_id to differentiate between two images taken at the same time. Based on creation date metadata.[9 Degrees Below Photography: EXIF Commands](https://ninedegreesbelow.com/photography/exiftool-commands.html)
  - `exiftool '-filename<CreateDate' -d ~/Photos/<path_to_renamed_photos>/%Y/%Y-%m-%d<optional-description>/%Y-%m-%d-%H-%M-%S-%%-c-<optional-description>.%%le -r <path_to_current_photos>`
  - **DigiKam** `[date:"yyyy-MM-dd_HH-MM-ss"]{unique:2,-,0}`
- **photo_backup** Use Rsync to back up a directory of photos. Optionally compress with tar/gzip?
