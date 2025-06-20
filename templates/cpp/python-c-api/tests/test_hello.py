import cppmodule as cpp
from random import random

def test_hello_noarg():
    assert cpp.hello() == 'Hello nguyenpanda!'
    
def test_hello_vararg():
    name = str(random)
    assert cpp.hello(name) == f'Hello {name}!'
