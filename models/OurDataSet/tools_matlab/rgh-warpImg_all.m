% root = '/home/s-lab/yuhan/flow/flownet_journal/models/FlowNetC/frame/';
% file1 = textread('/home/s-lab/yuhan/flow/flownet_journal/models/FlowNetC/auto_from_t.txt','%s');
% file2 = textread('/home/s-lab/yuhan/flow/flownet_journal/models/FlowNetC/auto_to_t-1.txt','%s');
root = '/home/s-lab/rgh/flownet/models/new_spring/frame/';
file1 = textread('/home/s-lab/rgh/flownet/models/new_spring/auto_from_t.txt','%s');
file2 = textread('/home/s-lab/rgh/flownet/models/new_spring/auto_to_t-1.txt','%s');
fid = fopen('warp_results.txt','w');


for i = 1:numel(file1)
pairs_root = [root,num2str(i-1),'/'];

 a_tmp = char(file1(i));
 a_name = a_tmp(4:end);
 
  b_tmp = char(file2(i));
  b_name = b_tmp(4:end);
  
  a = imread([pairs_root,a_name]);
  b = imread([pairs_root,b_name]);
  
%   figure(1);
%   imshow(a);
%   hold on;
%   figure(2);
%   imshow(b);

flow_tmp = dir(fullfile(pairs_root,'*.flo'));
flowfile = [flow_tmp(1).name,];
 of_file=[pairs_root,flowfile];
  warp_a = mywarp(of_file,b);
  
 figure(1);

subplot(1,3,1);
imshow(a);
title('a');


subplot(1,3,2);
imshow(b);
title('b');

subplot(1,3,3);
 imshow(uint8(warp_a));
title('warp-a');



  
save_file_name = [num2str(i-1),'.png'];
% pause(2);

print (gcf,'-dpng',save_file_name);

% imwrite(uint8(warp_a),save_file_name,'png');
% fprintf(fid,'%s\n',['warp_results/',save_file_name]);





end


fclose(fid);