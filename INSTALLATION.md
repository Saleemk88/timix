# Installation and Setup Guide for Timix

This guide provides step-by-step instructions to get the Timix application running locally using Docker.

## Prerequisites

Before you begin, ensure you have the following installed on your system:
*   [Docker](https://docs.docker.com/get-docker/)
*   [Docker Compose](https://docs.docker.com/compose/install/)
*   [Git](https://git-scm.com/downloads)

## Local Development Setup

Follow these steps to set up the application for local development.

### 1. Clone the Repository

```bash
git clone https://github.com/Saleemk88/timix.git
cd timix
```

### 2. Environment Variables

Create `.env` files for both the backend and the root directory (if needed by docker-compose). For this template, we'll use default values in the `docker-compose.yml`, but in a real scenario, you should configure these.

**Root `.env` (optional, for docker-compose):**
```env
POSTGRES_USER=timixuser
POSTGRES_PASSWORD=timixpassword
POSTGRES_DB=timixdb
```

**Backend `.env` (`backend/.env`):**
```env
PORT=5000
DATABASE_URL=postgres://timixuser:timixpassword@db:5432/timixdb
JWT_SECRET=supersecretkey_change_in_production
```

### 3. Build and Run the Containers

Run the following command from the root of the repository to build the images and start the containers in detached mode:

```bash
docker-compose up --build -d
```

This command will:
1.  Pull the necessary base images (Node.js, PostgreSQL).
2.  Build the backend image.
3.  Build the frontend image.
4.  Start the database, backend, and frontend containers.
5.  Initialize the database using `init.sql`.

### 4. Verify the Setup

Once the containers are running, you can access the applications at the following URLs:

*   **Frontend**: [http://localhost:3000](http://localhost:3000)
*   **Backend API**: [http://localhost:5000](http://localhost:5000) (e.g., `http://localhost:5000/api/health`)
*   **Database**: Accessible on `localhost:5432` using your preferred DB client (e.g., pgAdmin, DBeaver) with the credentials defined in the `docker-compose.yml`.

### 5. Managing the Application

*   **View Logs**:
    ```bash
    docker-compose logs -f
    ```
    To view logs for a specific service (e.g., backend):
    ```bash
    docker-compose logs -f backend
    ```
*   **Stop the Application**:
    ```bash
    docker-compose down
    ```
*   **Stop and Remove Volumes (Wipes Database)**:
    ```bash
    docker-compose down -v
    ```

## Production Deployment

For production deployment, you should:

1.  Use a robust reverse proxy (like Nginx or Traefik) to handle HTTPS and route traffic to the frontend and backend containers.
2.  Build the frontend for production (static files) and serve them using Nginx rather than the Vite dev server.
3.  Ensure strong, unique passwords are used for the database and secrets.
4.  Use a managed database service (like AWS RDS or Google Cloud SQL) instead of a Docker container for the database for better reliability and backups.
5.  Set `NODE_ENV=production` for the backend.
