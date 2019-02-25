CoverLovin2
===========

[![Build Status](https://travis-ci.com/jtmoon79/coverlovin2.svg?branch=master)](https://travis-ci.com/jtmoon79/coverlovin2)
[![codecov](https://codecov.io/gh/jtmoon79/coverlovin2/branch/master/graph/badge.svg)](https://codecov.io/gh/jtmoon79/coverlovin2)
[![PyPI version](https://badge.fury.io/py/CoverLovin2.svg)](https://badge.fury.io/py/CoverLovin2)
[![Python versions](https://img.shields.io/pypi/pyversions/coverlovin2.svg?longCache=True)](https://pypi.org/pypi/coverlovin2/)

*CoverLovin2* (Cover Loving!), python name *coverlovin2*, is a Python script for
automating downloading album cover art images.  A common use-case is creating a
"folder.jpg" file for a collection of ripped Compact Disc albums.

coverlovin2 can only be run by python version 3.7 (or greater).

Script Usage
------------

```Text
usage: coverlovin2.py [-h] [-n IMAGE_NAME] [-i {jpg,png,gif}] [-o] [-s*] [-sl]
                      [-se] [-sm] [-sg] [-s {small,medium,large}] [--gid GID]
                      [--gkey GKEY] [-v] [-r REFERER] [-d] [--test-only]
                      DIRS [DIRS ...]

This Python-based program is for automating downloading album cover art images.
A common use-case is creating a "folder.jpg" file for a collection of ripped
Compact Disc albums.

Given a list of directories, DIRS, recursively identify "album" directories.
"Album" directories have audio files, e.g. files with extensions like .mp3 or
.flac.  For each "album" directory, attempt to determine the Artist and Album.
Then find an album cover image file using the requested --search providers.  If
an album cover image file is found then write it to IMAGE_NAME.IMAGE_TYPE within
each "album" directory.

Audio files supported are .mp3, .m4a, .mp4, .flac, .ogg, .wma, .asf.

optional arguments:
  -h, --help            show this help message and exit

Required Arguments:
  DIRS                  directories to scan for audio files (Required)

Recommended:
  -n IMAGE_NAME, --image-name IMAGE_NAME
                        cover image file name IMAGE_NAME. This is the file
                        name that will be created within passed DIRS. This
                        will be appended with the preferred image TYPE, e.g.
                        "jpg", "png", etc. (default: "cover")
  -i {jpg,png,gif}, --image-type {jpg,png,gif}
                        image format IMAGE_TYPE (default: "jpg")
  -o, --overwrite       overwrite any previous file of the same file
                        IMAGE_NAME and IMAGE_TYPE (default: False)

Search all:
  -s*, --search-all     Search for album cover images using all methods and
                        services

Search the local directory for likely album cover images:
  -sl, --search-likely-cover
                        For any directory with audio media files but no file
                        "IMAGE_NAME.IMAGE_TYPE", search the directory for
                        files that are likely album cover images. For example,
                        given options: --name "cover" --type "jpg", and a
                        directory of .mp3 files with a file "album.jpg", it is
                        reasonable to guess "album.jpg" is a an album cover
                        image file. So copy file "album.jpg" to "cover.jpg" .
                        This will skip an internet image lookup and download
                        and could be a more reliable way to retrieve the
                        correct album cover image.

Search the local directory for an embedded album cover image:
  -se, --search-embedded
                        Search audio media files for embedded images. If
                        found, attempt to extract the embedded image.

Search Musicbrainz NGS webservice:
  -sm, --search-musicbrainz
                        Search for album cover images using musicbrainz NGS
                        webservice. MusicBrainz lookup is the most reliable
                        search method.

Search Google Custom Search Engine (CSE):
  -sg, --search-googlecse
                        Search for album cover images using Google CSE. Using
                        the Google CSE requires an Engine ID and API Key.
                        Google CSE reliability entirely depends upon the added
                        "Sites to search". The end of this help message has
                        more advice around using Google CSE.
  -s {small,medium,large}, --gsize {small,medium,large}
                        Google CSE optional image file size (default: "large")
  --gid GID             Google CSE ID (URL parameter "cx") typically looks
                        like "009494817879853929660:efj39xwwkng". REQUIRED to
                        use Google CSE.
  --gkey GKEY           Google CSE API Key (URL parameter "key") typically
                        looks like "KVEIA49cnkwoaaKZKGX_OSIxhatybxc9kd59Dst".
                        REQUIRED to use Google CSE.

Debugging and Miscellanea:
  -v, --version         show program's version number and exit
  -r REFERER, --referer REFERER
                        Referer url used in HTTP GET requests (default:
                        "https://github.com/jtmoon79/coverlovin2")
  -d, --debug           Print debugging messages (default: False)
  --test-only           Only test, do not write any files (default: False)

This program attempts to create album cover image files for the passed DIRS.  It
does this several ways, searching for album cover image files already present in
the directory (-sl).  If not found, it attempts to figure out the Artist and
Album for that directory then searches online services for an album cover image
(-sm or -sg).

Directories are searched recursively.  Any directory that contains one or more
with file name extension .mp3 or .m4a or .mp4 or .flac or .ogg or .wma or .asf
is presumed to be an album directory.  Given a directory of such files, file
contents will be read for the Artist name and Album name using embedded audio
tags (ID3, Windows Media, etc.).  If no embedded media tags are present then a
reasonable guess will be made about the Artist and Album based on the directory
name; specifically this will try to match a directory name with a pattern like
"Artist - Year - Album" or "Artist - Album".
From there, online search services are used to search for the required album
cover image. If found, it is written to the album directory to file name
IMAGE_NAME.IMAGE_TYPE (-n … -i …).

If option --search-googlecse is chosen then you must create your Google Custom
Search Engine (CSE).  This can be setup at https://cse.google.com/cse/all .  It
takes about 5 minutes.  This is where your own values for --gid and --gkey can
be created. --gid is "Search engine ID" (URI parameter "cx") and --gkey is
under the "Custom Search JSON API" from which you can generate an API Key (URI
parameter "key"). A key can be generated at
https://console.developers.google.com/apis/credentials.
Google CSE settings must have "Image search" as "ON"  and "Search the entire
web" as "OFF".

PyPi project: https://pypi.org/project/CoverLovin2/
Source code: https://github.com/jtmoon79/coverlovin2

Inspired by the program coverlovin.
```

Installation
------------

* Using `pip` from pypi:

      pip install coverlovin2

* Using `pip` from source:
  
      pip install https://github.com/jtmoon79/coverlovin2/archive/master.zip

*coverlovin2* depends on non-standard libraries [mutagen](https://pypi.org/project/mutagen/)
and [musicbrainzngs](https://pypi.org/project/musicbrainzngs/).

Development
-----------

Install `pipenv`.

Clone the repository:

    git clone git@github.com:jtmoon79/coverlovin2.git

Start the python virtual environment and install the dependencies:

    cd coverlovin2
    pipenv --python 3.7 shell
    pipenv --python 3.7 install --dev

This will install more non-standard libraries. See the [Pipfile](./Pipfile).

Other Miscellaneous Notes
-------------------------

coverlovin2 is inspired by [coverlovin](https://github.com/amorphic/coverlovin).

coverlovin2 could be used as a module.

Sonos systems will search a connected _Music Library_ directory for a file named
`folder.jpg`. If found, `folder.jpg` will be used as the album cover art.

coverlovin2 is a practice project for sake of the author learning more about
recent changes in the Python Universe and the github Universe.

coverlovin2 is very type-hinted code and could be even more so. The author
thinks type-hinting is a good idea but it still needs improvement. In it's
current form in Python 3.7, it feels clumsy and can be difficult to grok. Also,
PyCharm and mypy seem to catch different type-hint warnings. 

#### run phases

coverlovin2 runs in a few phases:

1. recursively search passed directory paths for "album" directories. An "album"
directory merely holds audio files of type `.mp3`, `.m4a`, `.mp4`, `.flac`,
`.ogg`, `.wma`, or `.asf`. (see [`coverlovin2/coverlovin2.py::AUDIO_TYPES`](./coverlovin2/coverlovin2.py)).
2. employ a few techniques for determining the artist and album for that
directory.  The most reliable technique is to read available embedded audio tags
within the directory. (see [`coverlovin2/coverlovin2.py::process_dir`](./coverlovin2/coverlovin2.py))
3. using user-passed search options, search for the album cover art image file.
4. if album cover art is found, create that image file into the "album"
directory. The name and type of image (`.jpg`, `.png`, `.gif`) is based on
user-passed options for the `IMAGE_NAME` and `IMAGE_TYPE`.
