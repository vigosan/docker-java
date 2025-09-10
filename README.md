# Java Development with Docker

Java programming without installing anything on your Mac.

## 🍴 Getting Started

```bash
# 1. Fork this repository on GitHub (click Fork button)
# 2. Clone your fork to your Mac
git clone git@github.com:YOUR_USERNAME/docker-java.git
cd docker-java
```

## 🚀 Quick Start

```bash
make dev        # Start container
make run FILE=Practice01   # Run Practice01
```

## 📁 Simple Structure

```
├── practices/     # Your .java files
└── build/         # Compiled files (.class)
```

## 💻 Workflow

1. **Edit**: Modify `practices/Practice01.java`
2. **Run**: `make run FILE=Practice01` (compiles and runs automatically)

## 🛠 Commands

- `make dev` - Start container
- `make run FILE=Practice01` - Run specific file
- `make shell` - Terminal in container
- `make stop` - Stop everything

## 📝 Example

```bash
# 1. Start
make dev

# 2. Edit practices/Practice01.java
# 3. Run
make run FILE=Practice01
```
