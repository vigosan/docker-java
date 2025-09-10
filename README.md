# Java Development with Docker

Java programming without installing anything on your Mac.

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

1. **Edit**: Modify `practices/Practice01.java` in Zed
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

# 2. Edit practices/Practice01.java in Zed
# 3. Run
make run FILE=Practice01
```
