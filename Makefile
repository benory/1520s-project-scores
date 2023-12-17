


humdrum: segment id

# Add filename to start of file in the format:
#    !!!!SEGMENT: humdrum/Bar/Bar2001-Peccantem_me_cotidie.krn
segment:
	for i in humdrum/[A-Z][a-z][a-z];      \
	do                                     \
		echo SEGMENT processing directory $$i; \
		bin/segmentizer $$i/*.krn;     \
	done



# Add filename to start of file in the format:
#    !!!!SEGMENT: humdrum/Bar/Bar2001-Peccantem_me_cotidie.krn
id:
	for i in humdrum/[A-Z][a-z][a-z];      \
	do                                     \
		echo ID processing directory $$i; \
		bin/addId $$i/*.krn;     \
	done


