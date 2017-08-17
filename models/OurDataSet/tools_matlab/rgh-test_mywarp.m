% of_file ='/home/yuhan/dispflownet-5conv-remap-finetune/models/FlowNetC/results/flownetc-pred-remap-0000000.flo' ;
% b = imread('/home/yuhan/dispflownet-5conv-remap-finetune/models/FlowNetC/data/0007_test_30.jpg');


% of_file ='/home/yuhan/dispflownet-5conv-remap-finetune-euclidean/models/FlowNetC/results/flownetc-pred-remap-0000000.flo' ;
% b = imread('/home/yuhan/dispflownet-5conv-remap-finetune-euclidean/models/FlowNetC/data/0007_test_30.jpg');
 
of_file ='/home/yuhan/dispflownet-5conv-remap-change-finetune-euclidean-v2/models/FlowNetC/results/flownetc-pred-remap-0000005.flo' ;
b = imread('/home/yuhan/dispflownet-5conv-remap-change-finetune-euclidean-v2/models/FlowNetC/data/0555_test_6.jpg');






warp_a = mywarp(of_file,b);
