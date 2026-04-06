# GitHub Codespaces QMD 环境部署指南

## 🚀 快速开始

### 1. 创建GitHub仓库

1. 在GitHub上创建新仓库：`qmd-codespaces`
2. 将当前文件夹内容推送到仓库：

```bash
cd /opt/openclaw/data/.openclaw/workspace/qmd-codespaces
git init
git add .
git commit -m "Initial QMD compilation environment"
git branch -M main
# 替换 YOUR_USERNAME 为你的GitHub用户名
git remote add origin https://github.com/YOUR_USERNAME/qmd-codespaces.git
git push -u origin main
```

### 2. 启动Codespaces

1. 访问你的GitHub仓库页面
2. 点击绿色的"Code"按钮
3. 选择"Open with Codespaces" → "New codespace"
4. 等待环境初始化完成（约2-5分钟）

### 3. 测试编译环境

在Codespaces终端中运行：

```bash
# 给测试脚本执行权限
chmod +x compile-test.sh

# 运行完整测试
./compile-test.sh
```

## 🔧 环境特性

**已配置的工具：**
- ✅ Quarto 1.4.553 (最新稳定版)
- ✅ Python 3.10 + 数据科学库
- ✅ LaTeX (XeTeX + 完整字体包)
- ✅ Node.js 18
- ✅ Rust 稳定版

**支持的输出格式：**
- HTML (默认)
- PDF (通过LaTeX)
- DOCX
- EPUB
- RevealJS 幻灯片

## 📝 使用示例

### 创建新的QMD文档

```bash
# 创建新文档
cat > new-document.qmd << 'EOF'
---
title: "我的文档"
format: html
---

# 标题

这是我的QMD文档。

```{python}
print("Python代码执行成功！")
```
EOF

# 编译文档
quarto render new-document.qmd
```

### 批量编译

```bash
# 编译所有QMD文件
quarto render *.qmd

# 编译为PDF
quarto render document.qmd --to pdf

# 编译为多种格式
quarto render document.qmd --to html,pdf,docx
```

## 🐛 故障排除

### 常见问题

**1. Quarto未安装**
```bash
# 手动安装Quarto
wget -q https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.553/quarto-1.4.553-linux-amd64.deb
sudo dpkg -i quarto-1.4.553-linux-amd64.deb
```

**2. LaTeX包缺失**
```bash
# 安装缺失的LaTeX包
sudo apt-get update
sudo apt-get install -y texlive-full
```

**3. Python包问题**
```bash
# 重新安装Python包
pip3 install --upgrade pandas numpy matplotlib seaborn jupyter
```

### 环境验证

运行环境健康检查：

```bash
# 检查所有工具
quarto --version
python3 --version
latex --version
node --version
rustc --version
```

## 💡 高级配置

### 自定义开发容器

如果需要额外工具，编辑 `.devcontainer/devcontainer.json`：

```json
{
    "features": {
        "ghcr.io/devcontainers/features/java:1": {
            "version": "17"
        },
        "ghcr.io/devcontainers/features/go:1": {
            "version": "1.21"
        }
    }
}
```

### VS Code扩展

推荐的VS Code扩展已在配置中预设：
- Quarto扩展
- Python扩展
- Rust Analyzer

## 📊 性能优化

**Codespaces配置建议：**
- 选择4核8GB配置以获得最佳编译性能
- 启用预构建以加快启动速度
- 定期清理缓存文件

---

**环境状态：** ✅ 就绪
**最后测试：** 2026-04-06
**支持：** 持续维护