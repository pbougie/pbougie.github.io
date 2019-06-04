# hugo
echo "## Generating website"
hugo

# tidy
if [ -x "$(command -v tidy)" ]; then
  echo
  echo "## Tidying up HTML"
  find public/* -name "*.html" -print -exec tidy -config tidy.yaml {} \;
fi
