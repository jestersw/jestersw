set -euo pipefail
title="${1:?title}"
band="${2:?band}"
label="${3:?label}"
out="${4:-banner.svg}"
handle="${HANDLE:-jestersw}"
cap() { local v=$1 m=$2; (( v > m )) && v=$m; echo "$v"; }
tw=$(cap $(( ${#title} * 64 )) 1080)
bw=$(cap $(( ${#band} * 34 )) 1060)
lw=$(( ${#label} * 16 + 40 ))
sans="'Arial Black','Helvetica Neue',Arial,sans-serif"
mono="'Courier New',ui-monospace,monospace"
bg="#EEF4FF"
ink="#0B1F3A"
accent="#3D7BF5"
cat > "$out" <<EOF
<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="420" viewBox="0 0 1200 420">
<defs><clipPath id="card"><rect x="4" y="4" width="1192" height="412"/></clipPath></defs>
<rect x="4" y="4" width="1192" height="412" fill="$bg"/>
<g clip-path="url(#card)">
<rect x="56" y="282" width="1144" height="104" fill="$accent"/>
<line x1="0" y1="86" x2="1200" y2="86" stroke="$ink" stroke-width="6"/>
</g>
<text x="48" y="58" font-family="$mono" font-size="34" font-weight="700" fill="$ink">$handle</text>
<rect x="56" y="112" width="$lw" height="46" fill="$ink"/>
<text x="76" y="143" font-family="$mono" font-size="22" font-weight="700" letter-spacing="2" fill="$bg">$label</text>
<text x="52" y="258" font-family="$sans" font-size="100" font-weight="900" fill="$ink" textLength="$tw" lengthAdjust="spacingAndGlyphs">$title</text>
<text x="76" y="352" font-family="$sans" font-size="54" font-weight="900" fill="#FFFFFF" textLength="$bw" lengthAdjust="spacingAndGlyphs">$band</text>
<rect x="4" y="4" width="1192" height="412" fill="none" stroke="$ink" stroke-width="8"/>
</svg>
EOF
echo "written: $out"
