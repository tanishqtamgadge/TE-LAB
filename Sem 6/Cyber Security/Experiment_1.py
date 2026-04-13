# S-DES Implementation (Clean Version)

# ------------------ BASIC FUNCTIONS ------------------

def permute(data, table):
    return ''.join(data[i-1] for i in table)

def left_shift(bits, n):
    return bits[n:] + bits[:n]

def xor(a, b):
    return ''.join('0' if a[i] == b[i] else '1' for i in range(len(a)))

# ------------------ S-BOXES ------------------

S0 = [
    [1,0,3,2],
    [3,2,1,0],
    [0,2,1,3],
    [3,1,3,2]
]

S1 = [
    [0,1,2,3],
    [2,0,1,3],
    [3,0,1,0],
    [2,1,0,3]
]

# ------------------ TABLES ------------------

P10 = [3,5,2,7,4,10,1,9,8,6]
P8  = [6,3,7,4,8,5,10,9]
IP  = [2,6,3,1,4,8,5,7]
IP_INV = [4,1,3,5,7,2,8,6]
EP  = [4,1,2,3,2,3,4,1]
P4  = [4,1,2,3]

# ------------------ KEY GENERATION ------------------

def generate_keys(key):
    key = permute(key, P10)
    L, R = key[:5], key[5:]

    L, R = left_shift(L, 1), left_shift(R, 1)
    K1 = permute(L + R, P8)

    L, R = left_shift(L, 2), left_shift(R, 2)
    K2 = permute(L + R, P8)

    return K1, K2

# ------------------ FUNCTION F ------------------

def F(R, K):
    temp = xor(permute(R, EP), K)
    L, R = temp[:4], temp[4:]

    row = int(L[0] + L[3], 2)
    col = int(L[1] + L[2], 2)
    s0 = format(S0[row][col], '02b')

    row = int(R[0] + R[3], 2)
    col = int(R[1] + R[2], 2)
    s1 = format(S1[row][col], '02b')

    return permute(s0 + s1, P4)

# ------------------ ENCRYPTION ------------------

def encrypt(pt, key):
    K1, K2 = generate_keys(key)

    pt = permute(pt, IP)
    L, R = pt[:4], pt[4:]

    L = xor(L, F(R, K1))
    L, R = R, L

    L = xor(L, F(R, K2))

    return permute(L + R, IP_INV)

# ------------------ DECRYPTION ------------------

def decrypt(ct, key):
    K1, K2 = generate_keys(key)

    ct = permute(ct, IP)
    L, R = ct[:4], ct[4:]

    L = xor(L, F(R, K2))
    L, R = R, L

    L = xor(L, F(R, K1))

    return permute(L + R, IP_INV)

# ------------------ MAIN ------------------

key = input("Enter 10-bit key: ")
pt = input("Enter 8-bit plaintext: ")

if len(key) != 10 or len(pt) != 8:
    print("Invalid input length.")
else:
    ct = encrypt(pt, key)
    dt = decrypt(ct, key)

    print("Ciphertext :", ct)
    print("Decrypted  :", dt)
    