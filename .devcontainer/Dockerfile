# Use the base Ubuntu image
FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# Install additional dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    libssl-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libgit2-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    pandoc \
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-latex-recommended \
    latexmk \
    fonts-noto-cjk \
    fonts-noto-color-emoji \
    && rm -rf /var/lib/apt/lists/*

# Install Quarto
RUN wget -q https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.553/quarto-1.4.553-linux-amd64.deb \
    && dpkg -i quarto-1.4.553-linux-amd64.deb \
    && rm quarto-1.4.553-linux-amd64.deb

# Install TinyTeX for LaTeX dependencies
RUN quarto install tinytex --no-prompt

# Set up working directory
WORKDIR /workspaces/qmd-codespaces