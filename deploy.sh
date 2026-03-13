#!/bin/bash
# 部署博客脚本
cd /var/www/blog

# 生成静态文件（如果hexo可用）
if command -v hexo &> /dev/null; then
    hexo clean
    hexo generate
fi

# 重启nginx
systemctl reload nginx

echo "部署完成！"
