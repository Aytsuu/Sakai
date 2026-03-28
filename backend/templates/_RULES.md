# Templates Rules

## Structure
- Store HTML templates, Jinja2 layouts, and email templates here.
- Organize templates logically into subfolders if they belong to different domains (e.g., `emails/`, `pages/`).

## Best Practices
- **Logic Level**: Keep template logic as simple as possible. Complex business logic belongs in the Python backend, not in the view layer.
- **Composition**: Use Django/Jinja2-style template extension (e.g., `{% extends "base.html" %}` and `{% block content %}`) to avoid code duplication and maintain a consistent layout.
- **Security**: Ensure variable rendering uses auto-escaping where appropriate to prevent XSS. For raw HTML delivery, verify the safety of the source before marking it safe.
