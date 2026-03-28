# App Rules

## Structure
Organize code by **domain**, not by file type. Do not use generic submodules like `api/` or `crud/` for the whole application. Instead, structure domains as follows:

```text
app/
├── {domain}/           # e.g., auth/, posts/, aws/
│   ├── router.py       # API endpoints
│   ├── schemas.py      # Pydantic models
│   ├── models.py       # Database models
│   ├── service.py      # Business logic
│   ├── dependencies.py # Route dependencies
│   ├── config.py       # Environment variables
│   ├── constants.py    # Constants and error codes
│   ├── exceptions.py   # Domain-specific exceptions
│   └── utils.py        # Helper functions
├── config.py           # Global configuration
├── models.py           # Global models
├── exceptions.py       # Global exceptions
├── database.py         # Database connection
└── main.py             # FastAPI app initialization
```

## Best Practices
- **Imports Across Domains**: Use explicit module names when importing across domains (e.g., `from app.auth import constants as auth_constants`).
- **FastAPI & Routes**: Keep `main.py` clean. Use `async def` for non-blocking I/O (`await`) and `def` for blocking I/O (runs in threadpool). Always offload CPU-intensive operations.
- **Dependencies**: Use dependencies for input validation (not just DI). Keep path variables consistent (e.g., `/{profile_id}`) across endpoints to enable dependency reuse.
- **Database**: 
  - Use `lower_case_snake` for table names.
  - Employ a SQL-first approach for complex joins and data aggregation.
  - Utilize centralized `database.py` for the session lifecycle.
- **Pydantic & Config**: Use Pydantic's built-in validators (e.g., `EmailStr`, `Field`). Split `BaseSettings` by domain so each domain has its own `config.py` handling environment variables.
- **Error Handling**: Standardize application errors and HTTP exceptions globally in `app/exceptions.py`, but define domain-specific exceptions tightly coupled to their domain module.