def simple_chatbot(user_input):
    user_input = user_input.lower()
    if "hello" in user_input or "hi" in user_input:
        return "Hello there! How can I help you today?"
    elif "how are you" in user_input:
        return "I'm just a program, but I'm doing well! Thanks for asking."
    elif "bye" in user_input or "exit" in user_input:
        return "Goodbye! Have a great day."
    else:
        return "I'm sorry, I don't understand that. Can you rephrase?"

while True:
    user_message = input("You: ")
    response = simple_chatbot(user_message)
    print(f"Chatbot: {response}")
    if "bye" in user_message.lower() or "exit" in user_message.lower():
        break