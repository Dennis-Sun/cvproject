function video = readVideo(name)
    reader  = VideoReader(name);
    %Create a video structure array:
    video = struct('cdata',zeros(reader.Height,reader.Width,3,'uint8'),'colormap',[]);
    k = 0;
    while hasFrame(reader)
        k = k+1;
        img=readFrame(reader);
        video(k).cdata = img;
    end
end
