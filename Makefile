


humdrum: segment id



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



