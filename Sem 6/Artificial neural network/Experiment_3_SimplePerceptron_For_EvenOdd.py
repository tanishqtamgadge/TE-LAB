import numpy as np
user_input = input("Enter a Number (0-9): ")

if user_input.strip() == "":
    print("You entered nothing")
else:
    j = int(user_input)

    step_function = lambda x: 1 if x >= 0 else 0

    training_data = [
        {'input': [1, 1, 0, 0, 0, 0], 'label': 1},
        {'input': [1, 1, 0, 0, 0, 1], 'label': 0},
        {'input': [1, 1, 0, 0, 1, 0], 'label': 1},
        {'input': [1, 1, 0, 1, 1, 1], 'label': 0},
        {'input': [1, 1, 0, 1, 0, 0], 'label': 1},
        {'input': [1, 1, 0, 1, 0, 1], 'label': 0},
        {'input': [1, 1, 0, 1, 1, 0], 'label': 1},
        {'input': [1, 1, 0, 1, 1, 1], 'label': 0},
        {'input': [1, 1, 1, 0, 0, 0], 'label': 1},
        {'input': [1, 1, 1, 0, 0, 1], 'label': 0},
    ]

    weights = np.array([0, 0, 0, 0, 0, 1])

    for data in training_data:
        x = np.array(data['input'])
        label = data['label']
        output = step_function(np.dot(x, weights))
        error = label - output
        weights += x * error

    x = np.array([int(b) for b in format(j, '06b')])
    output = "odd" if step_function(np.dot(x, weights)) == 0 else "even"

    print(j, "is", output)
    