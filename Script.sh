
# Define the URL
URL="https://www.amfiindia.com/spages/NAVAll.txt"
# Define the output TSV file
 OUTPUT_FILE="C:/Users/Akshay V R/Desktop/scheme_data.tsv"
# Use curl to download the content from the URL and extract Scheme Name and Asset Value
curl -s "$URL" | awk -F ';' '{print $3 "\t" $4}' > "$OUTPUT_FILE"
echo "Scheme Name and Asset Value data extracted and saved to $OUTPUT_FILE"
