# coding=utf-8
import cv2
import numpy as np
def viz_flow(flow):
    # 色调H：用角度度量，取值范围为0°～360°，从红色开始按逆时针方向计算，红色为0°，绿色为120°,蓝色为240°
    # 饱和度S：取值范围为0.0～1.0
    # 亮度V：取值范围为0.0(黑色)～1.0(白色)
    h, w = flow.shape[:2]
    hsv = np.zeros((h, w, 3), np.uint8)
    # 用cartToPolar直接转为极坐标
    mag, ang = cv2.cartToPolar(flow[...,0], flow[...,1])
    hsv[...,0] = ang*180/np.pi/2
    # 参考http://opencv-python-tutroals.readthedocs.io/en/latest/py_tutorials/py_video/py_lucas_kanade/py_lucas_kanade.html#dense-optical-flow-in-opencv
    # 直接将mag 归一到0-255 最小值对应0 最大值对应255
    hsv[...,1] = cv2.normalize(mag,None,0,255,cv2.NORM_MINMAX)
    # opencv-3.0.0/samples/python2/opt_flow.py draw_hsv(flow)中S赋值为255, 光流的可视化很黑，因为像素位移很小的地方亮度V约为0，大部分很黑
    # flownet他们都是V赋值为255, 此函数遵循flownet，像素位移的大小影响的是颜色的饱和度S，亮度都为最大，很亮
    hsv[...,2] = 255
    bgr = cv2.cvtColor(hsv,cv2.COLOR_HSV2BGR)
    return bgr
