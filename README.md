# Timix

Timix is a comprehensive time-tracking and management platform, designed to replicate and extend the core functionalities of platforms like Timebutler. It provides a robust, scalable, and containerised solution for managing time, attendance, leave requests, and working hours for teams of any size.

## Architectural Overview

Timix is built with a modern, scalable architecture using the following stack:

*   **Frontend**: React (with TypeScript), Vite for fast building and HMR, and Tailwind CSS for styling.
*   **Backend**: Node.js with Express (and TypeScript), providing a RESTful API.
*   **Database**: PostgreSQL for robust relational data storage.
*   **Containerisation**: Docker and Docker Compose for seamless local development and production deployment.

### System Architecture

The system consists of three main containers:

1.  **Frontend Container (`timix-frontend`)**: Serves the React application. In production, this can be served via Nginx. In development, it uses Vite's dev server.
2.  **Backend Container (`timix-backend`)**: Runs the Node.js API server, handling business logic, authentication, and database interactions.
3.  **Database Container (`timix-db`)**: Runs the PostgreSQL database.

## Features

*   **Time Tracking**: Log working hours with start, end, and break times.
*   **Absence Management**: Request and approve leaves (vacation, sick leave, etc.).
*   **User Roles**: Admin, Manager, and Employee roles with distinct permissions.
*   **Reporting**: Generate timesheets and absence reports.

## Documentation

*   See [INSTALLATION.md](INSTALLATION.md) for detailed setup and deployment instructions.
*   See [SOP.md](SOP.md) for Standard Operating Procedures regarding development, testing, and deployment.
