# dp for knapsack

def maxVal(w, v, i, aW):
    print 'maxVal called with', i, aW
    global numCalls
    numCalls += 1
    if i == 0:
        if w[i] <= aW:
            return v[i]
        else:
            return 0
    without_i = maxVal(w, v, i-1, aW)
    if w[i] > aW:
        return without_i
    else:
        with_i = w[i] + maxVal(w, v, i-1, aW - w[i])
    return max(with_i, without_i)

weights = [1, 1, 5, 5, 3, 3, 4, 4]
values  = [15, 15, 10, 10, 9, 9, 5, 5]
numCalls = 0
res = maxVal(weights, values, len(values) - 1, 8)
print 'max =', res, 'numCalls =', numCalls

memo = {}
def fastMaxVal(w, v, i, aW):
    print 'fastMaxVal called with', i, aW
    global numCalls, memo
    numCalls += 1
    if (i, aW) not in memo:
        if i == 0:
            if w[i] <= aW:
                memo[(i, aW)] = v[i]
            else:
                memo[(i, aW)] = 0
        else:
            without_i = fastMaxVal(w, v, i-1, aW)
            if w[i] > aW:
                memo[(i, aW)] = without_i
            else:
                with_i = w[i] + fastMaxVal(w, v, i-1, aW - w[i])
                memo[(i, aW)] = max(with_i, without_i)
    return memo[(i, aW)]

numCalls = 0
res = fastMaxVal(weights, values, len(values) - 1, 8)
print 'max =', res, 'numCalls =', numCalls
