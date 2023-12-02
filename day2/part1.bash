# Elf wants
# readonly NRED=12 NGREEN=14 NBLUE=14
declare -A nums
nums[red]=12
nums[green]=13
nums[blue]=14

possible_acc=0

parse() {
    id="$(echo "$inp" | cut -d' ' -f2 | tr -d :)"
    for c in red blue green; do
        max_num="$(echo "$inp" | grep -o "[0-9]\+ $c" | cut -f1 -d' ' | sort -n -r | head -1)"
        if [[ max_num -gt "${nums[$c]}" ]]; then
            return;
        fi
    done

    possible_acc=$((possible_acc + id))
}

while read -r inp; do parse "$inp"; done

echo $possible_acc
