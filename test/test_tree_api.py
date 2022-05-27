import unittest
from schema import Schema
from parameterized import parameterized

from fastapi.testclient import TestClient
from tree_api.main import app

client = TestClient(app)


class TestTreeApi(unittest.TestCase):
    @parameterized.expand([
        "tree"               #add other endpoints here for testing
    ]
    )
    def test_index(self, endpoint):
        response = client.get(f"/api/{endpoint}")
        self.assertEqual(response.status_code, 200)

    @parameterized.expand([
        "tree"              #add other endpoints here for testing
    ]
    )
    def test_not_empty(self, endpoint):
        response = client.get(f"/api/{endpoint}")
        parsed_response = response.json()
        self.assertGreater(len(parsed_response), 0, "Response is empty")

    @parameterized.expand([
        ("tree", Schema({"My_Favourite_Tree": str}))      #add other endpoints along with their schema for testing
    ]
    )
    def test_schema(self, endpoint, schema):
        response = client.get(f"/api/{endpoint}")
        data = response.json()[0]
        self.assertTrue(schema.validate(data))