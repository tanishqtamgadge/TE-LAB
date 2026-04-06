# ===================================
# Hopfield Network to store 4 vectors
# ===================================
import numpy as np

# ===================================
# 1. Define 4 Bipolar Patterns (-1, +1)
# ===================================
patterns = np.array([
    [1, -1, 1, -1],
    [-1, 1, -1, 1],
    [1, 1, -1, -1],
    [-1, -1, 1, 1]
])

# ===================================
# 2. Train using Hebbian Learning
# ===================================
n = patterns.shape[1]
W = np.zeros((n, n))

for p in patterns:
    W += np.outer(p, p)

# Remove self-connections
np.fill_diagonal(W, 0)

print("Weight Matrix:\n", W)

# ===================================
# 3. Activation Function
# ===================================
def sign(x):
    return np.where(x >= 0, 1, -1)

# ===================================
# 4. Recall Function
# ===================================
def recall(x, W, steps=10):
    for _ in range(steps):
        x_new = sign(np.dot(W, x))
        
        if np.array_equal(x, x_new):
            break
        
        x = x_new
    return x

# ===================================
# 5. Test with noisy input
# ===================================
test_pattern = np.array([1, -1, -1, -1])

print("\nTest Input:", test_pattern)

output = recall(test_pattern, W)

print("Recovered Pattern:", output)
