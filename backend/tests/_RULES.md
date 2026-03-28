# Tests Rules

## Structure
- Store all unit and integration tests using `pytest` within this directory.
- Mirror the application structure where possible (e.g., `test_models.py`, `test_main.py`) to keep tests easily discoverable.

## Best Practices
- **Fixtures**: Use `pytest` fixtures within `conftest.py` to handle database session setup, teardown, and FastAPI `TestClient` initialization.
- **Isolation**: Always use a separate test database or mock services to ensure tests do not alter production or development databases.
- **Mocks & Patches**: Mock external APIs and heavy dependencies to keep the test suite running quickly and reliably.
- **Coverage**: Aim for high code coverage for core business logic, database CRUD operations, and API endpoints. 
