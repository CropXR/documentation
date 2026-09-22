.PHONY: help dev docs docs-build

help:
	@echo "dev        - serve the documentation with hot reload (alias for docs)"
	@echo "docs       - serve the documentation with hot reload on http://localhost:8000"
	@echo "docs-build - build the static site into site/, as CI does"

# The documentation is this repository's only surface, so `dev` serves the docs.
dev: docs

# There is no pyproject here; CI installs requirements.txt with pip. uv reads the
# same file, so the local preview and the published site build from one list.
docs:
	uv run --with-requirements requirements.txt mkdocs serve

# Mirrors the build step in .github/workflows/documentation.yml.
docs-build:
	uv run --with-requirements requirements.txt mkdocs build --clean
