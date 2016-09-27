
## Install the package, also decompress to run the tests
RD CMD INSTALL "$1"
tar xzf "$1"
pkg=$(echo $1 | sed 's/_.*$//')

## Tests
if [ -e "${pkg}/tests" ]; then
    (
	echo "Running tests"
	cd ${pkg}/tests
	RD -e 'tools:::.runPackageTestsR()'
	cat *.Rout*
    )
fi

## Examples
echo "Running examples"
RD -q -e "tools:::.createExdotR('$pkg', system.file(package = '$pkg'))"
RD --slave -f ${pkg}-Ex.R

## Vignettes
if [ -e "${pkg}/vignettes" ]; then
    echo "Running vignette code"
    RD -q -e "tools::buildVignettes(dir = '.', tangle = TRUE)"
    find ${pkg}/vignettes -name "*.R" -maxdepth 1 -print -exec RD -q -f \{\} \;
fi
