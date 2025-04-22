import pytest
from app import app as flask_app


@pytest.fixture
def app():
    return flask_app


@pytest.fixture
def client(app):
    return app.test_client()


def test_home_page(client):
    """Test that home page loads correctly"""
    response = client.get('/')
    assert response.status_code == 200
    assert b'Welcome to the CI/CD Demo!' in response.data


def test_app_running():
    """Test that app exists and is configured"""
    assert flask_app is not None
    assert flask_app.name == 'app'
