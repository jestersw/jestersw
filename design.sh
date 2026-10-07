set -euo pipefail
out="${1:-assets}"
mkdir -p "$out"
BG="#EEF4FF"
INK="#0B1F3A"
ACC="#3D7BF5"
DEEP="#2557C7"
SOFT="#CFE0FF"
BOARD="#DCE8FF"
SANS="'Arial Black','Helvetica Neue',Arial,sans-serif"
MONO="'Courier New',ui-monospace,monospace"
HANDLE="${HANDLE:-jestersw}"
TG="${TG:-@JESTERSW}"
COUNT="${COUNT:-6 PROJECTS}"

tw() { echo $(( ${#1} * $2 * 6 / 10 + $3 )); }

mtext() {
  printf '<text x="%d" y="%d" font-family="%s" font-size="%d" font-weight="700" fill="%s" textLength="%d" lengthAdjust="spacingAndGlyphs">%s</text>' "$1" "$2" "$MONO" "$3" "$4" "$5" "$6"
}

win() {
  local x=$1 y=$2 k=$3
  printf '<rect x="%d" y="%d" width="120" height="92" fill="#FFFFFF" stroke="%s" stroke-width="4"/>' "$x" "$y" "$INK"
  printf '<line x1="%d" y1="%d" x2="%d" y2="%d" stroke="%s" stroke-width="3"/>' "$x" $((y+20)) $((x+120)) $((y+20)) "$INK"
  for d in 12 24 36; do printf '<circle cx="%d" cy="%d" r="3.5" fill="%s"/>' $((x+d)) $((y+10)) "$INK"; done
  case $k in
    code)
      printf '<rect x="%d" y="%d" width="64" height="6" fill="%s"/>' $((x+14)) $((y+34)) "$ACC"
      printf '<rect x="%d" y="%d" width="88" height="6" fill="%s"/>' $((x+14)) $((y+48)) "$INK"
      printf '<rect x="%d" y="%d" width="48" height="6" fill="%s"/>' $((x+14)) $((y+62)) "$ACC"
      printf '<rect x="%d" y="%d" width="76" height="6" fill="%s"/>' $((x+14)) $((y+76)) "$INK"
      ;;
    image)
      printf '<polygon points="%d,%d %d,%d %d,%d %d,%d %d,%d" fill="%s"/>' $((x+10)) $((y+84)) $((x+44)) $((y+42)) $((x+64)) $((y+64)) $((x+82)) $((y+50)) $((x+112)) $((y+84)) "$INK"
      printf '<circle cx="%d" cy="%d" r="9" fill="%s"/>' $((x+94)) $((y+36)) "$ACC"
      ;;
    chart)
      printf '<rect x="%d" y="%d" width="16" height="22" fill="%s"/>' $((x+16)) $((y+62)) "$ACC"
      printf '<rect x="%d" y="%d" width="16" height="44" fill="%s"/>' $((x+40)) $((y+40)) "$INK"
      printf '<rect x="%d" y="%d" width="16" height="30" fill="%s"/>' $((x+64)) $((y+54)) "$ACC"
      printf '<rect x="%d" y="%d" width="16" height="56" fill="%s"/>' $((x+88)) $((y+28)) "$INK"
      ;;
  esac
}

header() {
  cat > "$out/header.svg" <<EOF
<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="920" viewBox="0 0 1200 920">
<defs><pattern id="dots" width="14" height="14" patternUnits="userSpaceOnUse"><circle cx="7" cy="7" r="1.6" fill="#9DB8E8"/></pattern></defs>
<rect width="1200" height="920" fill="$BG"/>
<text x="50" y="64" font-family="$SANS" font-size="44" fill="$INK">$HANDLE</text>
<rect x="1124" y="30" width="46" height="7" fill="$INK"/>
<rect x="1124" y="44" width="46" height="7" fill="$INK"/>
<rect x="1124" y="58" width="46" height="7" fill="$INK"/>
<line x1="0" y1="92" x2="1200" y2="92" stroke="$INK" stroke-width="8"/>
<line x1="1098" y1="0" x2="1098" y2="92" stroke="$INK" stroke-width="8"/>
<rect x="50" y="122" width="420" height="44" fill="$INK"/>
$(mtext 70 152 22 "$BG" 380 "DEVOPS · ML · SECURITY")
<rect x="756" y="132" width="400" height="44" fill="$INK"/>
<rect x="746" y="122" width="170" height="44" fill="$INK"/>
$(mtext 764 152 20 "$BG" 134 "TELEGRAM")
<rect x="916" y="122" width="230" height="44" fill="$ACC" stroke="$INK" stroke-width="4"/>
$(mtext 934 152 20 "#FFFFFF" 194 "$TG")
<text x="44" y="284" font-family="$SANS" font-size="118" font-weight="900" fill="$INK" textLength="900" lengthAdjust="spacingAndGlyphs">INFRA THAT</text>
<rect x="50" y="306" width="1146" height="254" fill="$ACC"/>
<text x="70" y="425" font-family="$SANS" font-size="118" font-weight="900" fill="#FFFFFF" textLength="720" lengthAdjust="spacingAndGlyphs">SURVIVES</text>
<text x="70" y="540" font-family="$SANS" font-size="118" font-weight="900" fill="#FFFFFF" textLength="720" lengthAdjust="spacingAndGlyphs">FAILOVER</text>
<g font-family="$MONO" font-size="24" fill="$INK">
<text x="50" y="630">Highly available databases,</text>
<text x="50" y="664">infrastructure as code, CI/CD,</text>
<text x="50" y="698">monitoring and security tooling:</text>
<text x="50" y="732">built, broken and fixed in one place.</text>
</g>
<rect x="60" y="790" width="250" height="64" fill="$INK"/>
<rect x="50" y="780" width="250" height="64" fill="$ACC" stroke="$INK" stroke-width="4"/>
<text x="175" y="822" text-anchor="middle" font-family="$MONO" font-size="26" font-weight="700" fill="#FFFFFF" textLength="200" lengthAdjust="spacingAndGlyphs">$COUNT</text>
<rect x="340" y="790" width="250" height="64" fill="$INK"/>
<rect x="330" y="780" width="250" height="64" fill="$BG" stroke="$INK" stroke-width="4"/>
<text x="455" y="822" text-anchor="middle" font-family="$MONO" font-size="26" font-weight="700" fill="$INK" textLength="180" lengthAdjust="spacingAndGlyphs">2024–2026</text>
<rect x="702" y="612" width="460" height="280" fill="$INK"/>
<rect x="690" y="600" width="460" height="280" fill="$BOARD" stroke="$INK" stroke-width="6"/>
<rect x="693" y="603" width="454" height="274" fill="url(#dots)"/>
$(win 720 660 code)
$(win 855 640 image)
$(win 995 665 chart)
<polyline points="690,630 780,660 915,640 1055,665 1150,625" fill="none" stroke="$ACC" stroke-width="3"/>
<line x1="1055" y1="665" x2="1010" y2="880" stroke="$INK" stroke-width="4"/>
<circle cx="780" cy="660" r="8" fill="$ACC" stroke="$INK" stroke-width="3"/>
<circle cx="915" cy="640" r="8" fill="$ACC" stroke="$INK" stroke-width="3"/>
<circle cx="1055" cy="665" r="8" fill="$ACC" stroke="$INK" stroke-width="3"/>
<rect x="4" y="4" width="1192" height="912" fill="none" stroke="$INK" stroke-width="8"/>
</svg>
EOF
}

section() {
  local name=$1 file=$2
  local w; w=$(tw "$name" 26 48)
  cat > "$out/$file" <<EOF
<svg xmlns="http://www.w3.org/2000/svg" width="$((w+10))" height="64" viewBox="0 0 $((w+10)) 64">
<rect x="10" y="10" width="$w" height="52" fill="$ACC"/>
<rect x="0" y="0" width="$w" height="52" fill="$INK"/>
$(mtext 24 35 26 "$BG" $((w-48)) "$name")
</svg>
EOF
}

stack() {
  local body="" y=40 row label fill tc sh items x w item
  local -a arr
  local -a rows=(
    "INFRA|$ACC|#FFFFFF|$INK|Linux,Docker,Kubernetes,Ansible,Terraform,GitLab CI,GitHub Actions,Nginx,Prometheus,Grafana"
    "DATA|$DEEP|#FFFFFF|$INK|PostgreSQL,Redis,MongoDB"
    "CODE|$SOFT|$INK|$INK|Python,Go,Bash,FastAPI,scikit-learn"
    "SECURITY|$INK|$BG|$ACC|OWASP Top 10,MITRE ATT&amp;CK,Burp Suite,Wireshark"
  )
  for row in "${rows[@]}"; do
    IFS='|' read -r label fill tc sh items <<< "$row"
    body+=$(printf '<rect x="40" y="%d" width="190" height="44" fill="%s"/>' "$y" "$INK")
    body+=$(mtext 56 $((y+29)) 20 "$BG" $(( ${#label} * 12 )) "$label")
    x=262
    IFS=',' read -ra arr <<< "$items"
    for item in "${arr[@]}"; do
      w=$(tw "${item//&amp;/&}" 20 32)
      if (( x + w > 1160 )); then x=262; y=$((y+62)); fi
      body+=$(printf '<rect x="%d" y="%d" width="%d" height="44" fill="%s"/><rect x="%d" y="%d" width="%d" height="44" fill="%s" stroke="%s" stroke-width="3"/>' $((x+6)) $((y+6)) "$w" "$sh" "$x" "$y" "$w" "$fill" "$INK")
      body+=$(mtext $((x+16)) $((y+29)) 20 "$tc" $((w-32)) "$item")
      x=$((x+w+16))
    done
    y=$((y+84))
  done
  local h=$((y-10))
  cat > "$out/stack.svg" <<EOF
<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="$h" viewBox="0 0 1200 $h">
<rect width="1200" height="$h" fill="$BG"/>
$body
<rect x="4" y="4" width="1192" height="$((h-8))" fill="none" stroke="$INK" stroke-width="8"/>
</svg>
EOF
}

card() {
  local file=$1 num=$2 title=$3 desc=$4 tags=$5
  local body="" y=118 line x=36 w tag
  local -a lines arr
  IFS='|' read -ra lines <<< "$desc"
  for line in "${lines[@]}"; do
    body+=$(printf '<text x="36" y="%d" font-family="%s" font-size="19" fill="%s">%s</text>' "$y" "$MONO" "$INK" "$line")
    y=$((y+30))
  done
  IFS=',' read -ra arr <<< "$tags"
  for tag in "${arr[@]}"; do
    w=$(tw "$tag" 16 26)
    body+=$(printf '<rect x="%d" y="214" width="%d" height="36" fill="#FFFFFF" stroke="%s" stroke-width="3"/>' "$x" "$w" "$INK")
    body+=$(mtext $((x+13)) 238 16 "$INK" $((w-26)) "$tag")
    x=$((x+w+12))
  done
  cat > "$out/$file" <<EOF
<svg xmlns="http://www.w3.org/2000/svg" width="590" height="300" viewBox="0 0 590 300">
<rect x="20" y="20" width="564" height="274" fill="$INK"/>
<rect x="4" y="4" width="564" height="274" fill="$BG"/>
<rect x="4" y="4" width="564" height="64" fill="$ACC"/>
<text x="36" y="47" font-family="$MONO" font-size="28" font-weight="700" fill="#FFFFFF">$title</text>
<text x="536" y="47" text-anchor="end" font-family="$MONO" font-size="22" font-weight="700" fill="$INK">$num</text>
<line x1="4" y1="68" x2="568" y2="68" stroke="$INK" stroke-width="5"/>
$body
<rect x="4" y="4" width="564" height="274" fill="none" stroke="$INK" stroke-width="6"/>
</svg>
EOF
}

footer() {
  cat > "$out/footer.svg" <<EOF
<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="110" viewBox="0 0 1200 110">
<rect x="4" y="4" width="1192" height="102" fill="$ACC" stroke="$INK" stroke-width="8"/>
<text x="600" y="64" text-anchor="middle" font-family="$MONO" font-size="22" font-weight="700" fill="#FFFFFF" textLength="900" lengthAdjust="spacingAndGlyphs">infra that survives failover · ml that ships · security by design</text>
</svg>
EOF
}

header
section "WHOAMI" sec-whoami.svg
section "NOW" sec-now.svg
section "STACK" sec-stack.svg
section "PROJECTS" sec-projects.svg
stack
card card-lisa-cyber.svg "01" "lisa-cyber" "Simulates realistic user activity inside|a cyber range so blue teams train|against believable background noise." "Python,Docker Compose,GitHub Actions"
card card-barcode-detection.svg "02" "barcode-detection" "Conveyor tunnel prototype: decodes|barcodes from several camera angles|and merges them per box, deduplicated." "Python,ZBar,YOLO-ready"
card card-enose-core.svg "04" "enose-core" "Electronic-nose platform: time-series|feature extraction and a substance|classifier behind a FastAPI service." "Python,scikit-learn,FastAPI"
card card-bot-notification.svg "05" "bot-notification" "Telegram bot that sends a daily meal|reminder at a time the user picks." "Python,Telegram API,Railway"
card card-robo-guide.svg "06" "robo-guide" "Guide robot that understands its|surroundings with a vision-language|model: team VLM module." "Python,VLM,Robotics"
footer
ls -1 "$out"
card card-defect-segmentation.svg "03" "Defect-Segmentation" "Binary defect segmentation on MVTec AD:|reproducible, leakage-checked splits|and a U-Net baseline in progress." "Python,OpenCV,scikit-learn,GitHub Actions"
section "ACTIVITY" sec-activity.svg
