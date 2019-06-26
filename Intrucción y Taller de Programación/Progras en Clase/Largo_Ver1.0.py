def largo(num):
    if num == 0:
        return 0
    else:
        return 1 + largo(num // 10)
