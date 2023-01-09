import socket

#This script is written just for testing purposes, just to check the workflow of AllTogetherSender.py


HOST = "192.168.1.223"  # The server's hostname or IP address
PORT = 8005 # The port used by the server

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((HOST, PORT))

    while True:
        data = s.recv(1024)
        print(data)
        s.send(data)

# print(f"Received {data!r}")
