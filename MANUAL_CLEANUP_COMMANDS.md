# Commands to normalize remaining file and folder names

# For a quick fix, run these commands one by one:

cd '/Users/dancoblentz/Desktop/cs-systems'

# Option 1: Use a simple find/rename for spaces in file names
# This will rename files with spaces to use hyphens instead
find . -name "* *" -type f | while IFS= read -r file; do
    dir=$(dirname "$file")
    base=$(basename "$file")
    new_name=$(echo "$base" | tr ' ' '-')
    if [[ "$base" != "$new_name" ]]; then
        mv "$file" "$dir/$new_name"
        echo "Renamed: $base -> $new_name"
    fi
done

# Option 2: Rename directories with spaces
find . -name "* *" -type d | sort -r | while IFS= read -r dir; do
    if [[ "$dir" == "./.git"* ]]; then
        continue
    fi
    parent=$(dirname "$dir")
    base=$(basename "$dir")
    new_name=$(echo "$base" | tr ' ' '-')
    if [[ "$base" != "$new_name" ]]; then
        mv "$dir" "$parent/$new_name"
        echo "Renamed directory: $base -> $new_name"
    fi
done

# Option 3: Simple one-liner to handle parentheses in filenames
find . -name "*(*" -type f | while IFS= read -r file; do
    dir=$(dirname "$file")
    base=$(basename "$file")
    new_name=$(echo "$base" | tr '()' '--' | tr ' ' '-')
    if [[ "$base" != "$new_name" ]]; then
        mv "$file" "$dir/$new_name"
        echo "Renamed: $base -> $new_name"
    fi
done