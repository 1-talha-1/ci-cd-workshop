# CI/CD Workshop with GitLab

This is a simple Flask application designed for demonstrating CI/CD pipelines with GitLab.

## Project Structure

- `app.py` - Main Flask application
- `templates/index.html` - HTML template for the homepage
- `requirements.txt` - Python dependencies
- `test_app.py` - Unit tests for the application
- `Dockerfile` - For containerizing the application
- `.gitlab-ci.yml` - GitLab CI/CD pipeline configuration

## Local Setup

1. Create a virtual environment:
   ```
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

2. Install dependencies:
   ```
   pip install -r requirements.txt
   ```

3. Run the application:
   ```
   python app.py
   ```

4. Access the application at http://localhost:5000

## Running Tests

Execute the tests using pytest:
```
pytest
```

For test coverage:
```
pytest --cov=./
```

## CI/CD Pipeline

The `.gitlab-ci.yml` file defines a pipeline with the following stages:

1. **Validate**: Runs code linting using flake8
2. **Test**: Runs unit tests and generates coverage report
3. **Build**: Creates a Docker image and pushes it to the GitLab Container Registry
4. **Deploy**: Simulates deployment to a staging environment

## Workshop Activities

1. Fork this repository to your own GitLab account
2. Explore the CI/CD pipeline configuration
3. Make changes to see how the pipeline responds
4. Add new features to the application
5. Extend the pipeline with additional stages or jobs

## Next Steps

- Add more complex testing scenarios
- Implement automated deployment to a cloud provider
- Set up environment-specific configurations
- Add security scanning and quality checks

Happy learning!