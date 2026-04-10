OUTPUT="temp.json"
> "$OUTPUT" || { echo "Cannot write to $OUTPUT"; exit 1; }
echo '{' >> "$OUTPUT"
echo '  "entries": [' >> "$OUTPUT"

first=true

while read -r filepath; do
    filename=$(basename "$filepath")
    item="${filename%.*}"

    echo "    { \"game\": \"$item\", \"file\": \"$filepath\" }," >> "$OUTPUT"
done < <(find jingles -type f \( -iname "*.wav" -o -iname "*.mp3" -o -iname "*.ogg" \) | sort)

echo >> "$OUTPUT"
echo '  ]' >> "$OUTPUT"
echo '}' >> "$OUTPUT"
