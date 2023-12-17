

# Add filename to start of file in the format:
#    !!!!SEGMENT: humdrum/Bar/Bar2001-Peccantem_me_cotidie.krn
segment:
	for i in humdrum/[A-Z][a-z][a-z];      \
	do                                     \
		echo processing directory $$i; \
		bin/segmentizer $$i/*.krn;     \
	done


