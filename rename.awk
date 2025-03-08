# rename: rename fields in comma-seperated string by provided mapping
BEGIN {
    FS = ","
    OFS = ","
    mapfile = ARGV[1]
    ARGC = 0 # read from stdin later
    toname = ""
    while (getline < mapfile) {
        # line contains a output name, remember it for the following lines that get mappedto this output name
        if ($0 ~ /:$/) {
            toname = substr($0, 1, length($0)-1)
        }
        else { # line contains an input name
            # remove leading whitespace
            gsub(/^\s+/, "")
            fromname = $0
            map[fromname] = toname
            # remember we encountered this name, that we can delete column names by not writing a name before the colon in the mapping file
            rename[fromname] = 1
        }
    }
}
NR == 1 {
    for (i = 1; i <= NF; i++) {
        if (rename[$i] == 1) {
            $i = map[$i]
        }
    }
    print
}
NR > 1 {
    print
}
