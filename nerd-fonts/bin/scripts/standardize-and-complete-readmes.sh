#!/bin/bash
# version: 1.0.0
# Iterates over all patched fonts directories
# converts all non markdown readmes to markdown (e.g., txt, rst) using pandoc
# adds information on additional-variations and complete font variations

infofilename="font-info.md"
unpatched_parent_dir="src/unpatched-fonts"
patched_parent_dir="patched-fonts"
LINE_PREFIX="# [Nerd Fonts] "

cd ../../src/unpatched-fonts/ || {
  echo >&2 "$LINE_PREFIX Could not find source fonts directory"
  exit 1
}

#find ./ProFont -type d | # uncomment to test 1 font (with txt)
#find ./DejaVuSansMono -type d | # uncomment to test 1 font (with rst)
#find ./Hasklig -type d | # uncomment to test 1 font
#find ./Hack -type d | # uncomment to test 1 font (with md)
#find ./Gohu -type d | # uncomment to test 1 font (no readme files)
find . -type d | # uncomment to do ALL fonts
while read -r filename
do

	dirname=$(dirname "$filename")
	searchdir=$filename

	# limit looking for the readme files in the parent dir not the child dirs:
	if [[ $dirname != "." ]];
	then
		searchdir=$dirname
	fi

	RST=( $(find "$searchdir" -type f -iname 'readme.rst') )
	TXT=( $(find "$searchdir" -type f -iname 'readme.txt') )
	MD=( $(find "$searchdir" -type f -iname 'readme.md') )
	outputdir=$PWD/../../patched-fonts/$filename/

	echo "$LINE_PREFIX Generating readme for: $filename"

	[[ -d "$outputdir" ]] || mkdir -p "$outputdir"


	if [ "${RST[0]}" ];
	then
		for i in "${RST[@]}"
		do
			echo "#$LINE_PREFIX Found RST"

			from="$PWD/$i"
			to_dir="${PWD/$unpatched_parent_dir/$patched_parent_dir}/$filename"
			to="${to_dir}/$infofilename"

			[[ -d "$to_dir" ]] || mkdir -p "$to_dir"
			# clear output file (needed for multiple runs or updates):
			> "$to" 2> /dev/null

			pandoc "$from" --from=rst --to=markdown --output="$to"

			cat "$PWD/../../src/readme-per-directory-addendum.md" >> "$to"
		done
	elif [ "${TXT[0]}" ];
	then
		for i in "${TXT[@]}"
		do
			echo "#$LINE_PREFIX Found TXT"

			from="$PWD/$i"
			to_dir="${PWD/$unpatched_parent_dir/$patched_parent_dir}/$filename"
			to="${to_dir}/$infofilename"

			[[ -d "$to_dir" ]] || mkdir -p "$to_dir"
			# clear output file (needed for multiple runs or updates):
			> "$to" 2> /dev/null

			cp "$from" "$to"

			cat "$PWD/../../src/readme-per-directory-addendum.md" >> "$to"
		done
	elif [ "${MD[0]}" ];
	then
		for i in "${MD[@]}"
		do
			echo "#$LINE_PREFIX Found MD"

			from="$PWD/$i"
			to_dir="${PWD/$unpatched_parent_dir/$patched_parent_dir}/$filename"
			to="${to_dir}/$infofilename"

			[[ -d "$to_dir" ]] || mkdir -p "$to_dir"
			# clear output file (needed for multiple runs or updates):
			> "$to" 2> /dev/null

			cp "$from" "$to"

			cat "$PWD/../../src/readme-per-directory-addendum.md" >> "$to"
		done
	else
		echo "$LINE_PREFIX Did not find RST nor TXT"
	fi

done
