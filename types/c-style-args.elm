

iterate n f x =
    if n == 0 then
        x

    else
        iterate(n - 1, f ,f(x))


square x =
    x * x


foo =
    iterate 1 square 3