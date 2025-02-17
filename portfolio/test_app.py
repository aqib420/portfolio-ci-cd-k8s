import pytest
from app import app


@pytest.fixture
def client():
    app.config["TESTING"] = True
    with app.test_client() as client:
        yield client


def test_home_page(client):
    """Test that home page loads successfully"""
    rv = client.get("/")
    assert rv.status_code == 200
    assert b"Welcome to My Portfolio" in rv.data


def test_about_page(client):
    """Test that about page loads successfully"""
    rv = client.get("/about")
    assert rv.status_code == 200
    assert b"About Me" in rv.data


def test_projects_page(client):
    """Test that projects page loads successfully"""
    rv = client.get("/projectsss")
    assert rv.status_code == 200
    assert b"My Projects" in rv.data


def test_static_css(client):
    """Test that static CSS file is accessible"""
    rv = client.get("/static/css/style.css")
    assert rv.status_code == 200
    assert b"body" in rv.data
