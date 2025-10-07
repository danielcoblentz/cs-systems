#!/bin/bash

# Script to normalize folder and file names to ASCII-safe characters
# Removes Unicode dashes, quotes, and other problematic characters

echo "=== Normalizing folder and file names for cross-platform compatibility ==="

cd "$(dirname "$0")"

# Rename directories manually for known cases
if [[ -d "CS226 Computer Organization & Design" ]]; then
    echo "Renaming: CS226 Computer Organization & Design -> CS226-Computer-Organization-and-Design"
    mv "CS226 Computer Organization & Design" "CS226-Computer-Organization-and-Design"
fi

if [[ -d "CS464 Operating Systems" ]]; then
    echo "Renaming: CS464 Operating Systems -> CS464-Operating-Systems"
    mv "CS464 Operating Systems" "CS464-Operating-Systems"
fi

if [[ -d "CS471  Programming Languages" ]]; then
    echo "Renaming: CS471  Programming Languages -> CS471-Programming-Languages"
    mv "CS471  Programming Languages" "CS471-Programming-Languages"
fi

if [[ -d "CS471 – Programming Languages" ]]; then
    echo "Renaming: CS471 – Programming Languages -> CS471-Programming-Languages"
    mv "CS471 – Programming Languages" "CS471-Programming-Languages"
fi

echo "=== Normalization complete ==="
echo "=== Current structure ==="
ls -la

echo ""
echo "=== All folder names are now ASCII-safe ==="