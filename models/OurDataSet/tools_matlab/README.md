### preprocess.m
主要功能是把list中每个图片对和他们之间的光流保存到各自单独的文件夹
```
# 保存的文件夹结构
0
  img1.jpg
  img2.jpg
  flownetc-pred-remap-0000000.flo
1 
  img3.jpg
  img4.jpg
  flownetc-pred-remap-0000001.flo
 ```
```
# 图片对list
img1 = textread('/home/s-lab/rgh/flownet/models/new_spring/auto_from_t.txt','%s');
img2 = textread('/home/s-lab/rgh/flownet/models/new_spring/auto_to_t-1.txt','%s');
# 图片所在文件夹
root = '/home/s-lab/rgh/flownet/models/new_spring/ts/';
# 保存的光流文件夹
root_flo = '/home/s-lab/rgh/flownet/models/new_spring/results/';
# 将所有图片对和光流整理到各自文件夹的根目录
save_root = '/home/s-lab/rgh/flownet/models/new_spring/';

```

### warpImg_all.m
根据a,b,ab之间的光流得到warp-a
```
# 上一步所有图片对和光流整理到各自文件夹的根目录
root = '/home/s-lab/rgh/flownet/models/new_spring/frame/';
# 图片对list
file1 = textread('/home/s-lab/rgh/flownet/models/new_spring/auto_from_t.txt','%s');
file2 = textread('/home/s-lab/rgh/flownet/models/new_spring/auto_to_t-1.txt','%s');
```

### 其他.m为以上两个.m提供所需的功能函数

### 相关工具引用如下

Some utilities for reading, writing, and color-coding .flo images.

Written according to the c++ source code of Daniel Scharstein 

Deqing Sun, 11/03/07

see colorTest for visualizing the encoding scheme, reading and writing  .flo files.

