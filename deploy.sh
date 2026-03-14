#!/bin/bash
cd /var/www/blog

hexo clean
hexo generate

# 创建必要目录
mkdir -p public/categories public/tags

# 创建软链接
ln -sf public/archives/index.html public/categories/index.html
ln -sf public/archives/index.html public/tags/index.html

systemctl reload nginx

echo 部署完成！
