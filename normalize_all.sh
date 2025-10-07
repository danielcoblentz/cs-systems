#!/bin/bash

# Complete normalization script for all files and folders
# Handles Unicode characters, spaces, and special characters

echo "=== Phase 2: Normalizing all files and subdirectories ==="

cd "$(dirname "$0")"

# Function to safely rename with ASCII characters
safe_rename() {
    local original="$1"
    local new_name="$2"
    
    if [[ "$original" != "$new_name" && -e "$original" ]]; then
        if [[ -e "$new_name" ]]; then
            echo "Warning: Target exists, skipping: $original -> $new_name"
        else
            echo "Renaming: '$original' -> '$new_name'"
            mv "$original" "$new_name"
        fi
    fi
}

# Normalize file and directory names recursively
normalize_recursive() {
    # Process files first, then directories (bottom-up)
    find . -type f -name "*[–—''""]*" -o -name "*&*" -o -name "* *" | while read -r file; do
        if [[ "$file" == "./.git/"* ]]; then
            continue
        fi
        
        dir=$(dirname "$file")
        base=$(basename "$file")
        
        # Normalize the basename
        new_base="$base"
        new_base="${new_base//–/-}"  # en-dash to hyphen
        new_base="${new_base//—/-}"  # em-dash to hyphen
        new_base="${new_base//'/}"   # remove smart quotes
        new_base="${new_base//'/}"
        new_base="${new_base//\"/}"
        new_base="${new_base//\"/}"
        new_base="${new_base//&/and}" # ampersand to 'and'
        new_base=$(echo "$new_base" | tr ' ' '-') # spaces to hyphens
        
        safe_rename "$file" "$dir/$new_base"
    done
    
    # Process directories (deepest first)
    find . -type d -name "*[–—''""]*" -o -name "*&*" -o -name "* *" | sort -r | while read -r dir; do
        if [[ "$dir" == "./.git"* || "$dir" == "." ]]; then
            continue
        fi
        
        parent=$(dirname "$dir")
        base=$(basename "$dir")
        
        # Normalize the basename
        new_base="$base"
        new_base="${new_base//–/-}"  # en-dash to hyphen
        new_base="${new_base//—/-}"  # em-dash to hyphen
        new_base="${new_base//'/}"   # remove smart quotes
        new_base="${new_base//'/}"
        new_base="${new_base//\"/}"
        new_base="${new_base//\"/}"
        new_base="${new_base//&/and}" # ampersand to 'and'
        new_base=$(echo "$new_base" | tr ' ' '-') # spaces to hyphens
        
        safe_rename "$dir" "$parent/$new_base"
    done
}

normalize_recursive

echo "=== Final structure ==="
find . -maxdepth 2 -type d | sort

echo ""
echo "=== Repository is now ready for cross-platform cloning ==="
echo "All spaces, Unicode dashes, and special characters have been replaced with hyphens."