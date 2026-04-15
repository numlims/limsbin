# neat commands

(sorted alphabetically by description)

collect every four lines into one.

> awk 'ORS=NR%3?FS:RS'

convert a yaml to json.

> cat my.yaml | jc --yaml

find files larger than 1GB.

> sudo find ~/ -type f -size +1G 2> /dev/null

get a manual page as pdf.

> man -Tpdf docker run > docker-run.pdf

search in csv file.

> csvgrep [-r <regex> -m <string>] -c <column>

show csv column names numbered.

> csvgrep -n

sort csv file.

> csvsort -c <column>