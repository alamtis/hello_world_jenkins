import unittest
from app import say_hello

class TestHelloWorld(unittest.TestCase):
    def test_say_hello(self):
        self.assertEqual(say_hello(), "Hello, World!")
