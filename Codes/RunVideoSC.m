video = readVideo('images/golf.mp4');
video0=video;
targetsize=[240 240];
video_out=SimpleVideoSeamCarving(video,targetsize)
v = VideoWriter('golf_reduced.avi');
open(v);
writeVideo(v,video_out);
close(v);


video = readVideo('images/ratatouille1.mov');
video0=video;
targetsize=[256 300];
video_out=SimpleVideoSeamCarving(video,targetsize)
v = VideoWriter('ratatouille1_reduced1.avi');
open(v);
writeVideo(v,video_out);
close(v);
