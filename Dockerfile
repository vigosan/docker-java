# Development environment for Java practices
FROM openjdk:17-jdk-slim

# Install tools for development
RUN apt-get update && apt-get install -y \
    inotify-tools \
    tree \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN groupadd -r student && useradd -r -g student -m student

# Set working directory
WORKDIR /workspace

# Create directories
RUN mkdir -p src build && chown -R student:student /workspace

# Switch to student user
USER student

# Default command for development
CMD ["tail", "-f", "/dev/null"]
