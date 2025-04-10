**limsbin**

shell commands for json etc

con: concatenate string
> ech "hello" | con " you\n"

copycat: print input n times
> copycat -l 5 < file

csvtotab: comma-seperated to tab-seperated
> cat hello.csv | csvtotab > hello.tsv

dofor: do for files
> dofor "in/*" "python script.py" out

ech: echo without newline
> ech 'a' | con 'bc'

fif: find in files
> fif TODO

gh-login: specify which github account to log into
> gh login numlims

gh-logout: log out of github
> gh-logout

j: access json dict/array
> echo "['a', 'b', 'c']" | j 2

jdict: fields as json dict
> jdict < file

jlen: length of json array
> echo "['a', 'b', 'c']" | jlen

jsplit: input as json array
> echo "1,2,3" | jsplit ,

> jsplit "\n" < file

jfmt: format json files
> jfmt *.json

lip: line pick
> lip 2,3-12,13 < file

lower: lower case
> echo "Hello" | lower

name: filename without suffix
> name file.json

reframe: change csv header
> reframe "my,new,header,line" < file

tabtocsv: tab-seperated to comma-seperated
> cat hello.tsv | tabtocsv > hello.csv

**neat commands**

for some short handy commands, see (and update) [neat-commands.md](./neat-commands.md).

**setup**

put limsbin on path (put this in your .bashrc)
> export PATH=$PATH:/path/to/limsbin

**issues**

copycat -l doesn't work

for jdict use `jc --yaml` instead?

reframe depends on rename.awk

**license**

[cc0](https://creativecommons.org/publicdomain/zero/1.0/)