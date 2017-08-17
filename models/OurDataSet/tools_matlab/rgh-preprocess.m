% img1 = textread('/home/s-lab/yuhan/flow/flownet_journal/models/FlowNetC/auto_from_t.txt','%s');
% img2 = textread('/home/s-lab/yuhan/flow/flownet_journal/models/FlowNetC/auto_to_t-1.txt','%s');
% 
% 
% save_root = '/home/s-lab/yuhan/flow/flownet_journal/models/FlowNetC/';
% root = '/home/s-lab/yuhan/flow/flownet_journal/models/FlowNetC/ts/';
% root_flo = '/home/s-lab/yuhan/flow/flownet_journal/models/FlowNetC/results/';
img1 = textread('/home/s-lab/rgh/flownet/models/new_spring/auto_from_t.txt','%s');
img2 = textread('/home/s-lab/rgh/flownet/models/new_spring/auto_to_t-1.txt','%s');


save_root = '/home/s-lab/rgh/flownet/models/new_spring/';
root = '/home/s-lab/rgh/flownet/models/new_spring/ts/';
root_flo = '/home/s-lab/rgh/flownet/models/new_spring/results/';
flo = dir(fullfile(root_flo,'*.flo'));

for i = 1: numel(img2)
    t_minus_tmp = char(img1(i));
    t_minus_name = t_minus_tmp(4:end);
    %t_minus_name = t_minus_tmp(10:end);
    t_tmp = char(img2(i));
    t_name = t_tmp(4:end);
    %t_name = t_tmp(10:end);
    flowfile = flo(i).name;
    
    mkdir([save_root,'frame/',num2str(i-1)]);
    
    copyfile([root,t_minus_name],[save_root,'frame/',num2str(i-1),'/',t_minus_name]);
    copyfile([root,t_name],[save_root,'frame/',num2str(i-1),'/',t_name]);
    copyfile([root_flo,flowfile],[save_root,'frame/',num2str(i-1),'/',flowfile]);
    
end