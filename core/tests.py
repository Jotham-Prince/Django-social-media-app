from django.test import TestCase
from core.models import Profile, LikePost, FollowersCount

# Create your tests here.

class ProfileTestCase(TestCase):
    def testProfile(self):
        profile = Profile(id_user=1000, bio="I'm a software engineer", location="New York City, USA")
        self.assertEqual(profile.id_user, 1000)
        self.assertEqual(profile.bio, "I'm a software engineer")
        self.assertEqual(profile.location, "New York City, USA")

class LikePostTestCase(TestCase):
    def testLikePost(self):
        post = LikePost(post_id="Hey guys, have you seen Justin's new car?", username="Carla")
        self.assertEqual(post.post_id, "Hey guys, have you seen Justin's new car?")
        self.assertEqual(post.username, "Carla")

class FollowersCountTestCase(TestCase):
    def testFollowersCount(self):
        followers_count = FollowersCount(follower="Guzman", user="Lu")
        self.assertEqual(followers_count.follower, "Guzman")
        self.assertEqual(followers_count.user, "Lu")
