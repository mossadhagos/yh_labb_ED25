# syntax=docker/dockerfile:1

# Use official PostgreSQL image as base with specific version
FROM postgres:16.1-alpine3.19

# Metadata
LABEL maintainer="your-email@example.com" \
      description="PostgreSQL database for SQL lab exercises"

# Set environment variables with defaults
ENV POSTGRES_DB=labdb \
    POSTGRES_USER=labuser \
    POSTGRES_PASSWORD=labpass

# Copy initialization scripts
COPY --chown=postgres:postgres ./init-scripts/*.sql /docker-entrypoint-initdb.d/

# Expose PostgreSQL port
EXPOSE 5432

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
    CMD pg_isready -U ${POSTGRES_USER} -d ${POSTGRES_DB} || exit 1

# Use default postgres entrypoint and command
# Data will be persisted in /var/lib/postgresql/data
