#!/usr/bin/env bash
# Fetch strictly-public-domain poster art from Wikimedia Commons.
#
# Uses the Wikidata `copyright status = public domain` statement
# (P6216 = Q19652) as the filter rather than category names. Previous
# versions grabbed era-based categories like "1950s_film_posters",
# which contained copyrighted content (Universal horror, Toho films,
# even 2011+ horror posters). The wbstatement filter is Commons'
# formal way to mark "this file is in the public domain", so every
# returned file is safe to redistribute.
#
# Pulls across several themed queries so the grid has variety: films,
# concert/opera/sheet-music posters (music), book covers, and
# vintage art-nouveau posters (Mucha, Chéret, etc).

set -eo pipefail
cd "$(dirname "$0")/../static/posters"

API="https://commons.wikimedia.org/w/api.php"
UA="nexus-website-poster-fetch/1.0 (github.com/PetalCat/Nexus)"
W=400
TARGET=120

# Each entry is a srsearch query. All queries are ANDed with the
# P6216=Q19652 (public domain) statement so only PD files return.
# Weighted toward silent-era and early-sound film posters — the stuff
# that's both PD by age (pre-1929) and visually recognizable as
# "movie", not "art nouveau painting".
QUERIES=(
  'silent film poster haswbstatement:P6216=Q19652'
  'Chaplin film poster haswbstatement:P6216=Q19652'
  'Buster Keaton poster haswbstatement:P6216=Q19652'
  'Harold Lloyd poster haswbstatement:P6216=Q19652'
  'Lon Chaney film poster haswbstatement:P6216=Q19652'
  'Valentino film poster haswbstatement:P6216=Q19652'
  'Mary Pickford poster haswbstatement:P6216=Q19652'
  'Douglas Fairbanks poster haswbstatement:P6216=Q19652'
  'Nosferatu poster haswbstatement:P6216=Q19652'
  'Metropolis film poster haswbstatement:P6216=Q19652'
  'Caligari poster haswbstatement:P6216=Q19652'
  'Phantom of the Opera 1925 poster haswbstatement:P6216=Q19652'
  '1920s film poster haswbstatement:P6216=Q19652'
  '1910s film poster haswbstatement:P6216=Q19652'
  'lobby card haswbstatement:P6216=Q19652'
  'movie poster haswbstatement:P6216=Q19652'
  'Steamboat Willie haswbstatement:P6216=Q19652'
  'Walt Disney 1928 haswbstatement:P6216=Q19652'
  'Great Gatsby cover haswbstatement:P6216=Q19652'
  'Dracula 1897 cover haswbstatement:P6216=Q19652'
  'Frankenstein book haswbstatement:P6216=Q19652'
)

tmp_names="$(mktemp)"
trap 'rm -f "$tmp_names"' EXIT

for q in "${QUERIES[@]}"; do
  # URL-encode the query (space → %20, = stays).
  encoded_q=$(python3 -c "import urllib.parse,sys; print(urllib.parse.quote_plus(sys.argv[1]))" "$q")
  resp=$(curl -sL --max-time 30 -H "User-Agent: $UA" \
    "$API?action=query&list=search&srsearch=$encoded_q&srnamespace=6&srlimit=50&format=json")
  echo "$resp" \
    | python3 -c "
import json, sys
data = json.load(sys.stdin)
for r in data.get('query', {}).get('search', []):
    t = r['title']
    if t.lower().endswith(('.jpg', '.jpeg', '.png')):
        print(t.removeprefix('File:'))
" >> "$tmp_names" || true
done

# Dedup, cap at TARGET.
seen_file=".seen"
sort -u "$tmp_names" | head -n "$TARGET" > "$seen_file"
echo "Candidates: $(wc -l < "$seen_file")"

success=0
fail=0
while IFS= read -r remote; do
  local_name=$(echo "$remote" \
    | tr ' ' '_' \
    | sed -E 's/[^A-Za-z0-9._-]//g' \
    | tr '[:upper:]' '[:lower:]')
  if [[ -s "$local_name" ]]; then
    success=$((success + 1))
    continue
  fi
  encoded=$(python3 -c "import urllib.parse, sys; print(urllib.parse.quote(sys.argv[1], safe=''))" "$remote")
  url="https://commons.wikimedia.org/wiki/Special:FilePath/$encoded?width=$W"
  if curl -sL --max-time 30 -o "$local_name.tmp" \
       -H "User-Agent: $UA" \
       "$url" \
     && [[ -s "$local_name.tmp" ]] \
     && file "$local_name.tmp" | grep -qE "image|JPEG|PNG"; then
    mv "$local_name.tmp" "$local_name"
    success=$((success + 1))
    echo "  ✓ $local_name"
  else
    rm -f "$local_name.tmp"
    fail=$((fail + 1))
    echo "  ✗ $local_name"
  fi
done < "$seen_file"
rm -f "$seen_file"

echo
echo "Downloaded: $success  |  Failed: $fail"

find . -maxdepth 1 \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) \
  -not -name "manifest.json" \
  -exec basename {} \; \
  | sort \
  | python3 -c "import sys,json; print(json.dumps([l.strip() for l in sys.stdin if l.strip()], indent=2))" \
  > manifest.json

count=$(python3 -c "import json; print(len(json.load(open('manifest.json'))))")
echo "Wrote manifest.json ($count entries)"
