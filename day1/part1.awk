BEGIN {
    # Not necessary but good for clarity
    total = 0;
}

{
    str = $0;

    # Get first
    split(str, arr, "");
    for (i = 1; i < length(str); i++) {
        c = arr[i];
        if (c ~ /[0-9]/) {
            n1 = c;
            break;
        }
    }

    # Get last
    for (i = length(str); i > 0 ; i--) {
        c = arr[i];
        if (c ~ /[0-9]/) {
            n2 = c;
            break;
        }
    }

    total += n1 * 10 + n2;
}

END {
    print total;
}
