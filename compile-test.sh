#!/bin/bash

# QMD Compilation Test Script
# This script tests the QMD compilation environment

echo "=== QMD Compilation Environment Test ==="

# Check Quarto installation
echo "1. Checking Quarto installation..."
quarto --version
if [ $? -eq 0 ]; then
    echo "✅ Quarto is installed"
else
    echo "❌ Quarto installation failed"
    exit 1
fi

# Check Python availability
echo "2. Checking Python environment..."
python3 --version
pip3 --version
if [ $? -eq 0 ]; then
    echo "✅ Python environment is available"
else
    echo "❌ Python environment setup failed"
fi

# Install Python dependencies
echo "3. Installing Python dependencies..."
pip3 install pandas numpy matplotlib seaborn jupyter
if [ $? -eq 0 ]; then
    echo "✅ Python dependencies installed"
else
    echo "⚠️ Python dependency installation had issues"
fi

# Check LaTeX installation
echo "4. Checking LaTeX installation..."
latex --version
if [ $? -eq 0 ]; then
    echo "✅ LaTeX is installed"
else
    echo "❌ LaTeX installation failed"
fi

# Test QMD compilation
echo "5. Testing QMD compilation..."
quarto render test.qmd --to html
if [ $? -eq 0 ]; then
    echo "✅ QMD compilation successful"
    echo "📄 Output file: test.html"
else
    echo "❌ QMD compilation failed"
    exit 1
fi

# Test PDF compilation (optional)
echo "6. Testing PDF compilation..."
quarto render test.qmd --to pdf
if [ $? -eq 0 ]; then
    echo "✅ PDF compilation successful"
    echo "📄 Output file: test.pdf"
else
    echo "⚠️ PDF compilation failed (may require additional LaTeX packages)"
fi

echo "=== Test Completed ==="
echo "Environment is ready for QMD development!"