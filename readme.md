limsbin

con: concatenate string
`echo "hello" | con " you\n"`

csvtotab: comma-seperated to tab-seperated
`cat hello.csv | csvtotab > hello.tsv`

fif: find in files
`fif 'dir/' 'Specimen/'`

lip: line pick
`cat file | lip 2,3-12,13`

j: access json dict/array

    echo "['a', 'b', 'c']" | j 2

jarr: lines as json array

    cat file | jarr

jdict: fields as json dict

    cat file | jdict

jlen: length of json array

    echo "['a', 'b', 'c']" | jlen

jsplit: input as json array

    echo "1,2,3" | jsplit ,

jfmt: format json files

    jfmt *.json

reframe: change csv headers

    cat file | reframe "my,new,header,line"

tabtocsv: tab-seperated to comma-seperated

    cat hello.tsv | csvtotab > hello.csv