# copy the code here into your .bash_profile and say `source .bash_profile`

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
    # show index
    i
}

# i: show index.txt or readme.md with less
i() {
    # if there's one of the listed files, show the first
    f=`exst index.txt readme.* README.* readme README Readme Readme.*`
    # -f: check that f is not empty
    if [[ -f $f ]]; then
	clear # so that print starts at the top of the screen
	cat $f | less --quit-if-one-screen # --clear-screen: start printing at the top of the screen
    fi
}

# li lists directories along with a description line from their index.txt or readme.md
# the description line is the first line starting with a word character.
# -a (all) flag: list also the directories with no index.txt or readme.md
# issue: ignores arguments
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

# exst echoes the first file that exists, if none exists echo nothing
exst() {
    for f in $@; do
	if [[ -f $f ]]; then
	    echo $f
	    break
	fi
    done
    # no file exists, do nothing    
}

