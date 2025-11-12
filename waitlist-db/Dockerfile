# It's best to use the latest stable version, but avoid "latest" tag for reproducibility.
# Use a specific version, and check for security updates regularly.
FROM mysql:8.0.44

# You can check https://hub.docker.com/_/mysql for newer patch versions.
# For fewer vulnerabilities, consider using the most recent 8.0.x version or a slim variant if available.

# Always check the correctness of AI-generated responses.

ENV MYSQL_ROOT_PASSWORD password
ENV MYSQL_DATABASE waitlist

COPY waitlist.sql /docker-entrypoint-initdb.d/

EXPOSE 3306
