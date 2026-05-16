# --- Stage 1: Build Frontend ---
FROM node:20-alpine AS frontend-builder
WORKDIR /app/frontend

COPY frontend/package*.json ./
RUN npm install

COPY frontend ./
RUN npm run build

# --- Stage 2: Build Backend ---
FROM node:20-alpine AS backend-builder
WORKDIR /app/backend

COPY backend/package*.json ./
RUN npm install

COPY backend ./
RUN npm run build

# --- Stage 3: Production Image ---
FROM node:20-alpine
WORKDIR /app

# Set to production mode
ENV NODE_ENV=production
ENV PORT=5000

# Copy backend dependencies
COPY backend/package*.json ./backend/
WORKDIR /app/backend
RUN npm install --production

# Copy compiled backend
COPY --from=backend-builder /app/backend/dist ./dist

# Copy compiled frontend
COPY --from=frontend-builder /app/frontend/dist /app/frontend/dist

# Expose the single port
EXPOSE 5000

CMD ["node", "dist/index.js"]
