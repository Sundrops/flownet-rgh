
function warp_a = mywarp(of_file,b)

%% of_file  is    <<<<< (t  a) -> (t-minus b) >>>>>>
our_f_value= readFlowFile(of_file);
vx = our_f_value(:,:,1);
vy = our_f_value(:,:,2);

%% warp_a  is the warped version of b
warp_a=warpImage_ls(double(b),vx,vy);


