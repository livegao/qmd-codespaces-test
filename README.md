# QMD Compilation Environment

GitHub Codespaces environment for compiling QMD (Quarto Markdown) documents.

## Features

- **Base Environment**: Ubuntu 22.04
- **Programming Languages**:
  - Node.js 18
  - Python 3.10
  - Rust stable
- **Documentation Tools**:
  - Quarto
  - Pandoc
  - LaTeX (XeTeX)
  - TinyTeX

## Setup Instructions

1. **Create GitHub Repository**:
   ```bash
   git init
   git add .
   git commit -m "Initial QMD compilation environment"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/qmd-codespaces.git
   git push -u origin main
   ```

2. **Open in Codespaces**:
   - Go to your repository on GitHub
   - Click "Code" → "Open with Codespaces" → "New codespace"

3. **Test QMD Compilation**:
   ```bash
   # Create a test QMD file
   cat > test.qmd << 'EOF'
   ---
   title: "Test QMD Document"
   format: html
   ---

   # Test Document

   This is a test QMD document.

   ```{python}
   import pandas as pd
   print("Python code executed successfully!")
   ```
   EOF

   # Compile the QMD document
   quarto render test.qmd
   ```

## Configuration

The environment includes:
- Quarto for QMD compilation
- Python 3.10 with data science libraries
- LaTeX for PDF generation
- All necessary fonts and tools

## Usage

After the Codespace starts:

1. **Install Quarto** (if not already installed):
   ```bash
   quarto install
   ```

2. **Create QMD files** with `.qmd` extension

3. **Compile documents**:
   ```bash
   quarto render document.qmd
   ```

## Supported Formats

- HTML
- PDF (via LaTeX)
- DOCX
- EPUB
- RevealJS slides

## Troubleshooting

If you encounter issues:

1. Check that Quarto is installed: `quarto --version`
2. Verify LaTeX installation: `latex --version`
3. Ensure all dependencies are installed