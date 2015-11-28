clc;
minf=87; maxf=109; interval=2;
m=floor(((maxf-minf)/interval)+1);

    dataout1=zeros(5120,m);
        c=clock;
        k = 1;
        a=['Start Time:- ',num2str(c(4)),' Hrs ',num2str(c(5)),' min ',num2str(c(6)),' sec '];
        display(a);
        
        for i=minf:interval:maxf
            i
            fc                 = i*1e6;
            FrontEndSampleRate = 2e6;
            FrameLength        = 256*20;
        
  
            hSDRrRx = comm.SDRRTLReceiver(...
            'CenterFrequency', fc, ...
            'EnableTunerAGC',  true, ...
            'SampleRate',     FrontEndSampleRate, ...
            'SamplesPerFrame', FrameLength, ...
            'OutputDataType',  'double');

            if ~isempty(sdrinfo(hSDRrRx.RadioAddress))
                
                 for count = 1 : 500
                     [data,~] = step(hSDRrRx);
                     data = data - mean(data);
                     dataout1(:,k)=data+dataout1(:,k);
                end
            else
                 warning(message('SDR:sysobjdemos:MainLoop'))

            end
        k = k + 1;
        end
        
            c=clock;
            a=['End Time:- ',num2str(c(4)),' Hrs ',num2str(c(5)),' min ',num2str(c(6)),' sec '];
            display(a);
            
dataout1=dataout1/100;