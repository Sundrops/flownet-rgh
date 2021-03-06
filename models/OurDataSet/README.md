### train.py
相关models的link 链接: https://pan.baidu.com/s/1pKHBflh 密码: a299
利用光流改进分割网络deeplab，进行训练的脚本，实际上我们的训练分成了以下几步

- 因为最后的remap的loss定义在前景，训练一个前背景分割的网络，得到我们数据库图片的mask保存下来或者训练时动态得到，本程序保存下来了
- 因为我们要利用光流改进分割网络deeplab，所以flownet的卷积和deeplab共享，但是deeplab的提取特征和原版的flownet提取特征层不一样，所以我们需要改掉flownet的提取特征层为deeplab的conv1-5，具体过程是把deeplab训练到最好然后把conv1-5赋值到flownet这边并且固定，然后在flyingchair上重新光流(还有一点需要注意原版的flownet会把图片范围放缩到0-1，然后做一些数据增强，最后范围就变得不可知了，而deeplab是-128-128所以需要在flownet的特征提取前范围大致放大到-128-128，然后出了特征层后再放缩到flownet本来的范围 prototxt:model/train_flownet255.prototxt  model: 网盘：flow_iter_220000-flychair-noscale.caffemodel
- 最后的大网络，需要在一个分割的model deeplab和flownet model上finetuning prototxt:model/train.prototxt model: 网盘：flow_iter_500000-remap-noscale.caffemodel

### run.py

```
# 计算两张图片的光流
run.py IMAGE1 IMAGE2 # 自动生成两个imglist到tmp
# 计算两个imglist中对应图片对的光流
run.py tmp/img1.txt tmp/img2.txt # imglist放到tmp文件夹
# 注意所有图片尺寸必须都相同
# run.py会把图片缩小64倍
divisor = 64.
adapted_width = ceil(width/divisor) * divisor
adapted_height = ceil(height/divisor) * divisor
rescale_coeff_x = width / adapted_width
rescale_coeff_y = height / adapted_height
# 然后把model/deploy.tpl.prototxt 中的
replacement_list = {
    '$ADAPTED_WIDTH': ('%d' % adapted_width),
    '$ADAPTED_HEIGHT': ('%d' % adapted_height),
    '$TARGET_WIDTH': ('%d' % width),
    '$TARGET_HEIGHT': ('%d' % height),
    '$SCALE_WIDTH': ('%.8f' % rescale_coeff_x),
    '$SCALE_HEIGHT': ('%.8f' % rescale_coeff_y)
}
# 替换数值生成新的tmp/deploy.txt
# 生成光流结果所放位置
layer {
  name: "FLOWriter"
  type: "FLOWriter"
  bottom: "predict_flow_final"
  writer_param {
    folder: "./results"
    prefix: "flownetc-pred-remap-"
    suffix: ""
    scale: 1.0
  }
}

```