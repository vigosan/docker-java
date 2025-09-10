.PHONY: help dev build clean stop compile run shell logs practice exercise lab

# Default target
help:
	@echo "Java Development Environment"
	@echo ""
	@echo "Setup commands:"
	@echo "  dev      - Start development container"
	@echo "  stop     - Stop development container"
	@echo "  clean    - Clean up containers and volumes"
	@echo "  shell    - Open bash shell in container"
	@echo ""
	@echo "Development commands:"
	@echo "  compile  - Compile all Java files"
	@echo "  run FILE - Run specific Java class (e.g., make run FILE=Practice01)"
	@echo "  practice - Quick run Practice01"
	@echo ""
	@echo "Usage examples:"
	@echo "  make dev                    # Start container"
	@echo "  make practice               # Run Practice01"
	@echo "  make run FILE=Practice02    # Run specific file"

# Start development environment
dev:
	@echo "🚀 Starting Java development environment..."
	docker-compose up -d --build
	@echo "✅ Container running! Use 'make shell' to access terminal"

# Stop development environment
stop:
	@echo "🛑 Stopping development environment..."
	docker-compose down

# Clean up everything
clean:
	@echo "🧹 Cleaning up containers, images and volumes..."
	docker-compose down -v --rmi all --remove-orphans
	docker system prune -f

# Compile all Java files
compile:
	@echo "🔨 Compiling Java files..."
	docker-compose exec java-dev find . -name "*.java" -not -path "./build/*" -exec javac -d build -cp . {} +
	@echo "✅ Compilation complete"

# Run specific Java class
run:
ifndef FILE
	@echo "❌ Please specify FILE. Example: make run FILE=Practice01"
else
	@echo "▶️  Running $(FILE)..."
	@$(MAKE) compile
	docker-compose exec java-dev java -cp build $(FILE)
endif

# Quick shortcut
practice:
	@echo "▶️  Running Practice01..."
	@$(MAKE) compile
	docker-compose exec java-dev java -cp build Practice01

# Open shell in container
shell:
	@echo "🐚 Opening shell in development container..."
	docker-compose exec java-dev bash

# Show logs
logs:
	docker-compose logs -f java-dev

# Auto-compile and run (for file watching - advanced)
watch:
	@echo "👀 Watching for changes... (Ctrl+C to stop)"
	docker-compose exec java-dev bash -c "while true; do find . -name '*.java' -newer build/.timestamp 2>/dev/null | head -1 | grep -q . && (echo 'Recompiling...' && find . -name '*.java' -not -path './build/*' -exec javac -d build -cp . {} + && touch build/.timestamp); sleep 2; done"
