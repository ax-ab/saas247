function currencySorter(a, b, rowA, rowB) {
    a = +a.substring(1);
    b = +b.substring(1);
    if (a > b) return 1;
    if (a < b) return -1;
    return 0;
}
