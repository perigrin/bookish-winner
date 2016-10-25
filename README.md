# bookish-winner

Generate two files, one that contains every unique four character (case
insensative) sequence that appeears in exactly one word in a given dictionary
file. The second file contains the word that generated the sequence.

## Generating the Files

    carton install
    carton exec bin/sequence -i data/large.dict -s sequence -w words


