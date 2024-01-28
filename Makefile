


humdrum: segment id newlines



##############################
##
## segment: Add segment lines to files.  The segment line
##     must be the first line in the file.
##
## Add filename to start of file in the format:
##    !!!!SEGMENT: Bar2001-Peccantem_me_cotidie.krn

segment:
	for i in humdrum/[A-Z][a-z][a-z];      \
	do                                     \
		echo SEGMENT processing directory $$i; \
		bin/segmentizer $$i/*.krn;     \
	done



##############################
##
## id: Insert/update 1520s project IDs in Humdrum files.
##
## Insert/Update 1520s project IDs near the start of file in the format:
##    !!!!SEGMENT: Bar2001-Peccantem_me_cotidie.krn
##    !!!id:Bar2001
##
## The ID is extracted from the SEGMENT line, characters before "-" in filename.
##

id:
	for i in humdrum/[A-Z][a-z][a-z];      \
	do                                     \
		echo ID processing directory $$i; \
		bin/addId $$i/*.krn;     \
	done



##############################
##
## notecount: create a list of note counts for each piece which
##      should be pasted into the metadata spreadsheet column for
##      notecounts.
##

notecount:
	@bin/getWorkIdList | bin/makeNoteCounts



##############################
##
## fix-barlines: Fix cases where the first measure has missing first barline
##    Causing a pickup interpretation due to 2/2 being used as the meter rather
##    than 4/2 for cut-c.
##

barlines: fix-barlines;
barline: fix-barlines;
fb: fix-barlines
fixbarline: fix-barlines
fixbarlines: fix-barlines
fix-barline: fix-barlines
fix-barlines:
	@bin/fixBarnums



#############################
##
## newlines: Add a newline to the end of a file if there is none.
##           This can happen when editing in VHV since the editor
##           likes to eat the last newlines.  Having a text file
##           with new ending newline can cause problems in various
##           programs.
##

nl: newlines
newline: newlines
newlines:
	@for file in humdrum/[A-Z][a-z][a-z]/*.krn; do           \
		if [ $$(tail -c 1 $$file | od -An -tx1 | sed -e 's/[\t ]*//g') != "0a" ]; then  \
			echo "Adding newline to end of $$file"; \
			echo >> $$file;                         \
		fi;                                             \
        done




