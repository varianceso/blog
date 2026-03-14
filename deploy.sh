#!/bin/bash
cd /var/www/blog

hexo clean
hexo generate

# 创建软链接使分类和标签页面可访问
ln -sf public/archives/index.html public/categories/index.html
ln -sf public/archives/index.html public/tags/index.html

systemctl reload nginx

echo 部署完成！
