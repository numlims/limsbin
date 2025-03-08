# copy this in your .bash_profile and say `source .bash_profile`

# cdmk: mkdir and cd into it immediately
# from https://unix.stackexchange.com/a/125386
cdmk() {
    
  # "$1": quotes protect the argument if it has spaces or so
  # --: makes the name not interpreted as an option for mkdir or cp, so you can create a dictionary that starts with - or --
# -p: make parent directories if they do not exist yet
# -P: resolve symbolic links

  mkdir -p -- "$1"
  cd -P -- "$1"
}

# ci: cd and show index.txt or readme.md with less
ci() {
    # cd into the given directory
    cd "$1"
    # if there's and index.txt, show it
    if [[ -f "index.txt" ]]; then
	# make text pageable with less, don't start less if text is less than one screen long
	cat index.txt | less --quit-if-one-screen
    elif [[ -f "readme.md" ]]; then
	# make text pageable with less, don't start less if text is less than one screen long
	cat readme.md | less --quit-if-one-screen 
    fi

}

# i: show index.txt or readme.md with less
i() {
    # is there an index.txt?
    if [[ -f index.txt ]]; then
	cat index.txt | less --quit-if-one-screen
    elif [[ -f readme.md ]]; then
	cat readme.md | less --quit-if-one-screen
    fi
}

# li lists directories along with a description line from their index.txt or readme.md
# the description line is the first line starting with a word character.
# -a (all) flag: list also the directories with no index.txt or readme.md
li() {
    # look for a -a (all) flag with getopts
    # see https://stackoverflow.com/a/21128172 
    a_flag=''
    while getopts 'abf:v' flag; do
	case "${flag}" in
	    a) a_flag='true' ;;
	esac
    done
    
    # go through the files
    for f in *; do
	# is f a directory?
	if [[ -d $f ]]; then
	    # does an index.txt or readme.txt exists?
	    if [[ -f $f/index.txt ]]; then
		# print its first non-heading line (the first line starting with a word character)
		echo -n "$f: "
		egrep "^\w" --max-count 1 $f/index.txt 
	    elif [[ -f $f/readme.md ]]; then
		# print its first non-heading line (the first line starting with a word character)
		echo -n "$f: "
		egrep "^\w" --max-count 1 $f/readme.md
	    else
		# no index.txt or readme
		# if -a (all) flag, print dir (file also?)
		if [[ $a_flag == "true" ]]; then
		    echo $f
		fi
	    fi
	fi
    done
}

