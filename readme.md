limsbin

con: concatenate string
> ech "hello" | con " you\n"

copycat: print input n times
> cat file | copycat -l 5

csvtotab: comma-seperated to tab-seperated
> cat hello.csv | csvtotab > hello.tsv

ech: echo without newline
> ech 'a' | con 'bc'

fif: find in files
> fif 'dir/' 'Specimen/'

j: access json dict/array
> echo "['a', 'b', 'c']" | j 2

jarr: lines as json array
> cat file | jarr

jdict: fields as json dict
> cat file | jdict

jlen: length of json array
> echo "['a', 'b', 'c']" | jlen

jsplit: input as json array
> echo "1,2,3" | jsplit ,

jfmt: format json files
> jfmt *.json

lip: line pick
> cat file | lip 2,3-12,13

name: filename without suffix
> name file.json

reframe: change csv header
> cat file | reframe "my,new,header,line"

tabtocsv: tab-seperated to comma-seperated
> cat hello.tsv | tabtocsv > hello.csv

# setup

put limsbin on path (put this in your .bashrc)
> export PATH=$PATH:/path/to/limsbin

