# go-utils

## Github LFS

### 安装 Git LFS

Git LFS 是一个 Git 扩展，允许你有效地管理大文件，如视频、数据集、图形文件等，而不会给 Git 仓库带来过大的负担。

参考：https://github.com/git-lfs/git-lfs/blob/main/INSTALLING.md

```shell
(. /etc/lsb-release && curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo env os=ubuntu dist="${DISTRIB_CODENAME}" bash)

sudo apt-get install git-lfs
```

### 初始化 Git LFS

在你的 Git 仓库中，运行以下命令来初始化 Git LFS：

```shell
git lfs install
```

这个命令将 Git LFS 钩子添加到你的 Git 仓库中，以便在提交和推送时自动处理大文件。

### 跟踪大文件

使用 git lfs track 命令来告诉 Git LFS 你想要跟踪哪个文件或文件类型。对于你的具体情况，可以运行：

```shell
git lfs track "geoip/geolite/assets/GeoLite2-City.mmdb"
```

这个命令会创建一个 .gitattributes 文件（如果尚不存在），并在其中添加一行来指定应该使用 Git LFS 跟踪的文件模式。

### 添加并推送更改

```shell
git add .  
git commit -m "Add GeoLite2-City.mmdb using Git LFS"
```

然后推送你的更改，Git LFS 会自动处理大文件：

```shell
git push origin <branch-name>
```

推送完成后，你应该不会再看到关于大文件的警告信息。你可以在 GitHub 上检查你的仓库，确认大文件已经被正确地存储在 Git LFS 中。
