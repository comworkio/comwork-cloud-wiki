#!/usr/bin/env bash

if [[ $(uname -a) =~ .*Darwin.* ]]; then
  AWK_BIN="gawk"
  SED_BIN="gsed"
else
  AWK_BIN="awk"
  SED_BIN="sed"
fi

ROOT_DIR="price_calculator"
DATA_FILE="${ROOT_DIR}/data.csv"
PRICE_ENV_FILE="prices_env.sh"
DOC_FILE="sizing_pricing.md"

dos2unix "${DATA_FILE}" >/dev/null 2>&1 || :
$SED_BIN "s/\([0-9]\),\([0-9][0-9]*\)/\1.\2/g;s/\"//g" "${DATA_FILE}" > "${DATA_FILE}.tmp"
$AWK_BIN -F ',' 'BEGIN {sep=","} {print $1""sep""$2""sep""$3""sep""$5""sep""$6""sep""$7""sep""$8}' "${DATA_FILE}.tmp" > "${DATA_FILE}.tmp2"
$AWK_BIN '{if ($0 ~ "V_ARRAY_PRICING"){system("mdtable '"${DATA_FILE}.tmp2"' 2>/dev/null || :")} else {print $0}}' "${ROOT_DIR}/sizing_pricing.tpl" > "${DOC_FILE}"
$SED_BIN -i "s/V_DATE/$(date +"%Y-%m-%d")/g" "${DOC_FILE}"

echo "#!/usr/bin/env bash" > "${PRICE_ENV_FILE}"
echo "" >> "${PRICE_ENV_FILE}"
echo "## This script is generated, do not update it manually!" >> "${PRICE_ENV_FILE}"
echo "## See: https://gitlab.comwork.io/comwork_public/comwork_cloud/-/blob/main/price_calculator/README.md" >> prices_env.sh
echo "" >> "${PRICE_ENV_FILE}"

$AWK_BIN -F ',' 'BEGIN {sep=","} {if($4 != "Variable"){gsub(/ *€/,"", $6); print "export "$4"="$6}}' "${DATA_FILE}.tmp" >> "${PRICE_ENV_FILE}"

echo "export TTVA=1.2" >> "${PRICE_ENV_FILE}"

rm -rf "${DATA_FILE}".tmp*
