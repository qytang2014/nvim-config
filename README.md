# nvim-config
1、通过图形化界面管理plugin，采用lazy nvim来实现，基于neovim

2、采用lua脚本来写

3、可以基于终端实现图形化界面来阅读代码，可以自动提示补全，java代码也可以实现自动import

4、通过gtags实现代码快速检索代码跳转



# Require enviroment

1、git version >=2.19.0

2、neovim version >=0.8.0，安装neovim方法：https://github.com/neovim/neovim/wiki/Installing-Neovim

3、若要实现java的import及提示等，需要java版本大于等于17

4、安装nodejs(包含npm的版本)

​	macos安装方法：`brew install node`

​	ubuntu安装方法示例：

```
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
```

对于有些ubuntu版本可能不支持高版本，可以参考nodejs官网安装方法：[nodejs官网](https://nodejs.org/en

5、需要安装clangd服务，clangd安装包下载：https://github.com/clangd/clangd

# Install方式

mkdir ~/.config

git clone https://github.com/qytang2014/nvim-config.git ~/.config/nvim
