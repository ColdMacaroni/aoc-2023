# Elf wants
power_sum=0

parse() {
    declare -A mins
    for c in red blue green; do
        min_num="$(echo "$inp" | grep -o "[0-9]\+ $c" | cut -f1 -d' ' | sort -r -n | head -1)"
        mins[$c]=$min_num
    done

    power_sum=$((power_sum + mins[red] * mins[blue] * mins[green]))
}

while read -r inp; do parse "$inp"; done

echo "$power_sum"
