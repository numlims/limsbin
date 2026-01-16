# neat commands

(sorted alphabetically by description)

collect every four lines into one.

> awk 'ORS=NR%3?FS:RS'

convert a yaml to json.

> cat my.yaml | jc --yaml

get a manual page as pdf.

> man -Tpdf docker run > docker-run.pdf

