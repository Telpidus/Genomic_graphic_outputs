#!/bin/bash
#Script to parse genepop output .ST2 to produce divergence histograms by Telma G. Laurentino(Telpidus)
#usage: bash script.sh <inputfile.ST2> <namePop1> <namePop2> <namePop3> <namePop4>

# make sure script exists on error(careful with rm's)
set -e

#parses the .ST2 file in order to have a file with Fst values per population pairwise comparison that can be plotes as an histogram to assess genomic divergence between pairs of populations 

sed -e 's/ \+/\t/g' $1 | grep "^2" | cut -f 2 > $2vs$3 
sed -i '1d' $2vs$3
sed -i '$ d' $2vs$3

sed -e 's/ \+/\t/g' $1 | grep "^3" | cut -f 2 > $2vs$4
sed -i '1d' $2vs$4
sed -i '$ d' $2vs$4

sed -e 's/ \+/\t/g' $1 | grep "^4" | cut -f 2 > $2vs$5
sed -i '1d' $2vs$5
sed -i '$ d' $2vs$5

sed -e 's/ \+/\t/g' $1 | grep "^3" | cut -f 3 > $3vs$4
sed -i '1d' $3vs$4
sed -i '$ d' $3vs$4

sed -e 's/ \+/\t/g' $1 | grep "^4" | cut -f 3 > $3vs$5
sed -i '1d' $3vs$5
sed -i '$ d' $3vs$5

sed -e 's/ \+/\t/g' $1 | grep "^4" | cut -f 4 > $4vs$5
sed -i '1d' $4vs$5
sed -i '$ d' $4vs$5


