


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
	@bash -o pipefail -c 'bin/getWorkIdList | bin/makeNoteCounts'



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


##############################
##
## voicedensity:  Do voice density analysis
##

v: voicedensity
voice: voicedensity
voiceDensity: voicedensity
voice-density: voicedensity
voicedensity:
	bin/voicedensity



##############################
##
## validate -- Check to ensure that the filenames on the spreadsheet match
##             the actual file names in the repository for Humdrum files.
##

vf: validate-filenames
validate: validate-filenames
validateFilenames: validate-filenames
validate-filenames:
	bin/validateFilenames



# Shared incremental asset builds; existing targets remain unchanged.
ASSET_TOOL_DIR ?= ../digital-library-build
ASSET_PYTHON ?= $(if $(wildcard $(ASSET_TOOL_DIR)/.venv/bin/python),$(ASSET_TOOL_DIR)/.venv/bin/python,python3)
ASSET_IDS ?=
.PHONY: assets-plan assets-build
assets-plan:
	$(ASSET_PYTHON) "$(ASSET_TOOL_DIR)/build.py" plan --config asset-build.json $(if $(ASSET_IDS),--ids "$(ASSET_IDS)")
assets-build:
	$(ASSET_PYTHON) "$(ASSET_TOOL_DIR)/build.py" build --config asset-build.json $(if $(ASSET_IDS),--ids "$(ASSET_IDS)")

# Explicit local XML pilot; discrepancies must be reviewed before publication.
.PHONY: assets-xml-build
assets-xml-build:
	@test -n "$(ASSET_IDS)" || (echo "Set ASSET_IDS to explicit pilot work IDs"; exit 1)
	$(ASSET_PYTHON) "$(ASSET_TOOL_DIR)/build.py" build --config asset-build-xml.json --ids "$(ASSET_IDS)"

# Local media pilot; no publication or main build checkpoint.
.PHONY: assets-media-build
assets-media-build:
	@test -n "$(ASSET_IDS)" || (echo "Set ASSET_IDS to explicit pilot work IDs"; exit 1)
	$(ASSET_PYTHON) "$(ASSET_TOOL_DIR)/media_pilot.py" --config asset-build.json --ids "$(ASSET_IDS)" --output .asset-build-media

.PHONY: assets-ranges-check
assets-ranges-check:
	$(ASSET_PYTHON) "$(ASSET_TOOL_DIR)/audit_ranges.py" --config asset-build.json

# Full resumable local media pass, with per-score validation and failure reporting.
.PHONY: assets-media-all
assets-media-all:
	$(ASSET_PYTHON) "$(ASSET_TOOL_DIR)/media_pilot.py" --config asset-build.json --all --resume --output .asset-build-media/corpus

# Refresh stale media locally. Set ASSET_WORKING_TREE=1 for uncommitted edits.
ASSET_WORKING_TREE ?=
ASSET_PRIOR_REPORTS ?=
.PHONY: assets-media-refresh assets-media-refresh-plan
assets-media-refresh-plan:
	$(ASSET_PYTHON) "$(ASSET_TOOL_DIR)/refresh_media.py" --config asset-build.json --plan $(if $(ASSET_IDS),--ids "$(ASSET_IDS)") $(if $(filter 1,$(ASSET_WORKING_TREE)),--working-tree) $(foreach report,$(ASSET_PRIOR_REPORTS),--prior-report "$(report)")
assets-media-refresh:
	$(ASSET_PYTHON) "$(ASSET_TOOL_DIR)/refresh_media.py" --config asset-build.json $(if $(ASSET_IDS),--ids "$(ASSET_IDS)") $(if $(filter 1,$(ASSET_WORKING_TREE)),--working-tree) $(foreach report,$(ASSET_PRIOR_REPORTS),--prior-report "$(report)")
