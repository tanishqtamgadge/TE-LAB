import math

def alpha_beta(depth, node_index, is_maximizing, values, alpha, beta):
    if depth == 3:
        return values[node_index]

    if is_maximizing:
        max_eval = -math.inf
        for i in range(2):  # Each node has 2 children
            eval = alpha_beta(depth + 1, node_index * 2 + i, False, values, alpha, beta)
            max_eval = max(max_eval, eval)
            alpha = max(alpha, eval)

            # Beta cut-off
            if beta <= alpha:
                break
        return max_eval
    else:
        min_eval = math.inf
        for i in range(2):  # Each node has 2 children
            eval = alpha_beta(depth + 1, node_index * 2 + i, True, values, alpha, beta)
            min_eval = min(min_eval, eval)
            beta = min(beta, eval)

            # Alpha cut-off
            if beta <= alpha:
                break
        return min_eval


values = [3, 5, 6, 9, 1, 2, 0, -1]

print("The optimal value is:", alpha_beta(0, 0, True, values, -math.inf, math.inf))
