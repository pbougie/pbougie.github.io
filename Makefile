.SILENT:

default: help


build: #: Build website
	echo "## Building website"
	hugo

deploy: build prettify #: Deploy website
	echo "## --> STEP 1 : Commit to git repository"
	echo "## --> STEP 2 : Push to GitHub to deploy website"

prettify: #: Prettify HTML
	if [ -x "$(shell command -v tidy)" ]; then \
		echo "## Prettifying HTML"; \
	  find docs/* \
	    -name "*.html" \
	    -print \
	    -exec tidy \
	    -config tidy.yaml {} \;; \
	fi

watch: #: Watch website for changes
	echo "## Watching website for filesystem changes"
	hugo --watch


help: color=$(shell printf "\033[1;34m")
help: no_color=$(shell printf "\033[0m")
help: #: Show help
	grep "#:" Makefile* | \
	grep -v "grep" | \
	sed "s/\([A-Za-z_ -]*\):.*#\(.*\)/${color}\1${no_color}\2/g"
