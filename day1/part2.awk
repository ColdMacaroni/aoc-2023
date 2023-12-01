BEGIN {
    # Not necessary but good for clarity
    total = 0;

    nums["one"] = 1;
    nums["two"] = 2;
    nums["three"] = 3;
    nums["four"] = 4;
    nums["five"] = 5;
    nums["six"] = 6;
    nums["seven"] = 7;
    nums["eight"] = 8;
    nums["nine"] = 9;
}

{
    # The trick here is that twone1 is 211, evil tbh.

    # Need to reset, otherwise it just keeps adding to the array
    line_nums_len = 0;
    str = $0;
    start = 1;

    while (start <= length(str)) {
        sub_ = substr(str, start, length(str));

        # [0-9] needs to be first otherwise it might match words first.
        match_pos=match(sub_, /([0-9]|one|two|three|four|five|six|seven|eight|nine)/, arr);

        # no matches
        if (match_pos == 0) break;

        num = substr(sub_, arr[1, "start"], arr[1, "length"]);

        # Go to next character so this doesn't match again.
        start += arr[1, "start"];

        # Turn into digit if necessary
        if (arr[1, "length"] > 1) {
            line_nums[++line_nums_len] = nums[num];
        } else {
            line_nums[++line_nums_len] = num;
        }
    }

    n1 = line_nums[1];
    n2 = line_nums[line_nums_len];

    total += n1 * 10 + n2;
}

END {
    print total;
}
