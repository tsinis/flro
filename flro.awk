awk '{
    while (match($0, /[0-9]+\.[0-9]+/)) {
        printf "%s%.2f", substr($0, 1, RSTART-1), substr($0, RSTART, RLENGTH)
        $0 = substr($0, RSTART+RLENGTH)
    }
    print
}' original.flr > optimized.flr