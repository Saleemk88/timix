# Standard Operating Procedures (SOP) for Timix

This document outlines the standard procedures for development, testing, and deployment of the Timix application.

## 1. Local Development

### 1.1 Prerequisites
*   Docker and Docker Compose installed.
*   Node.js (LTS) installed locally (optional, for running tools outside containers).
*   Git for version control.

### 1.2 Branching Strategy
*   `main`: The production-ready branch. Code here should always be stable.
*   `develop`: The main development branch. Features are merged here before release.
*   `feature/*`: Feature branches branching off from `develop`.
*   `bugfix/*`: Branches for fixing bugs, branching off from `develop`.
*   `hotfix/*`: Urgent fixes branching off directly from `main`.

### 1.3 Commit Messages
Follow the Conventional Commits specification:
*   `feat: add new time tracking module`
*   `fix: resolve bug in leave calculation`
*   `docs: update installation guide`
*   `chore: update dependencies`

## 2. Testing Procedures

### 2.1 Backend Testing
*   Write unit tests for all utility functions and models.
*   Write integration tests for API endpoints.
*   Run tests locally using `npm test` inside the backend container.

### 2.2 Frontend Testing
*   Write component tests using React Testing Library.
*   Run tests locally using `npm test` inside the frontend container.

## 3. Deployment Procedures

### 3.1 Pre-deployment Checklist
*   Ensure all tests pass on the `main` branch.
*   Verify environment variables are correctly configured in the production environment.
*   Ensure the database schema changes (if any) are scripted and ready to run.

### 3.2 Deployment Steps (Docker Compose)
1.  Pull the latest changes from the `main` branch.
2.  Build the production images: `docker-compose -f docker-compose.prod.yml build`
3.  Stop existing containers: `docker-compose -f docker-compose.prod.yml down`
4.  Start new containers in detached mode: `docker-compose -f docker-compose.prod.yml up -d`
5.  Monitor logs to ensure successful startup: `docker-compose -f docker-compose.prod.yml logs -f`

## 4. Database Management

*   All database changes must be tracked using migrations (e.g., Prisma, TypeORM, or raw SQL scripts in the `db/migrations` folder).
*   Never manually modify the production database schema.
