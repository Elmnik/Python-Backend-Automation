# custom_library.py
import requests

class CustomLibrary:
    def get_user_details(self, user_id):
        response = requests.get(f"https://jsonplaceholder.typicode.com/users/{user_id}")
        return response

    def get_user_posts(self, user_id):
        response = requests.get(f"https://jsonplaceholder.typicode.com/users/{user_id}/posts")
        return response