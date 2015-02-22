import unittest
import hello_world


class HelloWorldTestCase(unittest.TestCase):

	def setUp(self):
		self.app = hello_world.app.test_client()

	def testHelloWorld(self):
		resp = self.app.get('/')
		self.assertEqual(resp.status_code, 200)
		self.assertEqual(resp.data, 'Hello World!')