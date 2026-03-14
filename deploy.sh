#!/bin/bash
cd /var/www/blog

# 先保存index.html副本
if [ -f public/index.html ]; then
    cp public/index.html /tmp/index.html.bak
fi

# 清理
hexo clean

# 生成
hexo generate

# 恢复index.html并复制到categories和tags
if [ -f /tmp/index.html.bak ]; then
    cp /tmp/index.html.bak public/index.html
    cp public/index.html public/categories/index.html
    cp public/index.html public/tags/index.html
fi

# 重启nginx
systemctl reload nginx

echo 部署完成！
