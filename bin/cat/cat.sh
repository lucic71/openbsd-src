#!/bin/sh

# -u is still accepted but does nothing as _cat does by default unbuffered
# writes to output

while getopts "bnsuv" arg
do
	case $arg in
	b) B=1 ;;
	n) N=1 ;;
	s) S=1 ;;
	u) U=1 ;;
	v) V=1 ;;
	esac
done
shift $(($OPTIND - 1))

_cat "$@" \
	| if [[ $S -eq 1 ]]; then 
		sed -n '
			# Write non-empty lines.
			/./	 {
				p
				d
			}
			# Write a single empty line, then look for more empty lines.
			/^$/  p
			# Get next line, discard the held <newline> (empty line),
			# and look for more empty lines.
			:Empty
			/^$/  {
				N
				s/.//
				b Empty
			}
			# Write the non-empty line before going back to search
			# for the first in a set of empty lines.
			p
		'
	else _cat; fi \
	| if [[ $V -eq 1 ]]; then sed -n 'l'; else _cat; fi \
	| if [[ $B -eq 1 ]]; then awk '{if (NF) { c++; print c " " $0 } else { print $0 }}'; else _cat; fi \
	| if [[ $N -eq 1 ]]; then awk '{print NR " " $0}'; else _cat; fi

