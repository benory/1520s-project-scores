#!/usr/bin/env bash

root="$1"

find "$root" -type f -name "*.krn" | while IFS= read -r file; do

    base="$(basename "$file" .krn)"

    # Extract suffix (after --)
    suffix=""
    if [[ "$base" == *"--"* ]]; then
        suffix="${base#*--}"
        suffix="${suffix//_/ }"
    fi

    # If there's no suffix, no SMS to add → skip the file entirely
    if [[ -z "$suffix" ]]; then
        continue
    fi

    # Check if SMS already exists
    if grep -q '^!!!SMS:' "$file"; then
        continue
    fi

    # Otherwise, we must update the file
    tmp="$(mktemp)"
    inserted_sms=0

    # Read file safely, preserving last line even w/out newline
    while IFS= read -r line || [[ -n "$line" ]]; do

        printf '%s\n' "$line" >> "$tmp"

        # Insert SMS after the COM record (only once)
        if [[ "$inserted_sms" -eq 0 && "$line" == '!!!COM:'* ]]; then
            printf '!!!SMS: %s\n' "$suffix" >> "$tmp"
            inserted_sms=1
        fi

    done < "$file"

    mv "$tmp" "$file"
    echo "Inserted SMS into: $file"

done