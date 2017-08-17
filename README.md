# flownet-rgh

根据https://lmb.informatik.uni-freiburg.de/resources/binaries/
Disp- and FlowNet: Full code for testing and training networks
v1.2版本进行修改

原版的flownet是用自己合成的flyingchairs数据库进行训练，他们是有label的，而现实中的视频帧光流的label很难获得，该仓库通过一个remap的loss进行约束即两个视频帧t,t-1送入flownet产生光流然后利用这个光流把第t帧remap回t-1帧，然后加loss约束remap回去的t-1帧和本来的t-1帧像(仅要求前景像就ok)。

remap层参考了论文View Synthesis by Appearance Flow
https://github.com/tinghuiz/appearance-flow/blob/8f461936b1fbef9eebb9963e46be571d9f3e855a/caffe/src/caffe/layers/remap_layer.cpp