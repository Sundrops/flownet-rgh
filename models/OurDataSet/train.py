#!/usr/bin/env python
import os, sys
import subprocess

#caffe_bin = '../bin/caffe'
caffe_bin = '../../../build/tools/caffe'
os.system('mkdir training') 
os.chdir('training') # change to directory 'training'

# =========================================================

my_dir = os.path.dirname(os.path.realpath(__file__)) #output empty string(run this python file in relative path) or fullpath (run this python file in full path)
os.chdir(my_dir)

if not os.path.isfile(caffe_bin):
    print('Caffe tool binaries not found. Did you compile caffe with tools (make all tools)?')
    sys.exit(1)

print('args:', sys.argv[1:])#input: python train.py aaa bbb ccc   output: ['aaa', 'bbb', 'ccc']


args = [caffe_bin, 'train', '-model', ''] + sys.argv[1:]
cmd = str.join(' ', args)
print('Executing %s' % cmd)

subprocess.call(args)
