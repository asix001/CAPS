[g,freq]=audioread("CAPS_07_B9TB1710.wav");
[f,freq]=audioread("test.wav");

k=g(1:561000,:);

xx1=length(k)/freq; #time length of the audio
xx = linspace(0,xx1,length(k)); #time domain

#Fourier transormation&shifting
K=fft(k);
Kshift=fftshift(K);

df=freq/length(K); #resolution[Hz]
xx2=-freq/2:df:freq/2-df; #frequency domain

#figure 1
plot(xx,k); #k in time domain
title("k in time domain");
xlabel("time");
set(gca,"fontsize",14);

figure #2
plot(xx2,abs(Kshift)); #k in frequency domain
title("k in frequency domain");
xlabel("frequency");
set(gca,"fontsize",14);

#adding sine wave to my audio
k2=sin(2*xx)'.+k;

#Fourier transormation&shifting
K2shift=fftshift(fft(k2));

figure #3
plot(xx,k2); #k2 in time domain
title("k2 in time domain");
xlabel("time");
set(gca,"fontsize",14);

figure #4
plot(xx2,abs(K2shift)); #k2 in frequency domain
title("k2 in frequency domain");
xlabel("frequency");
set(gca,"fontsize",14);

#filtering noise
filter=abs(xx2)>10; #filtering out freq>-10Hz&freq<10Hz 
k2filtered=ifft(ifftshift(K2shift.*filter'));

figure #5
plot(xx,k2filtered); #k2filtered in time domain
title("k2filtered in time domain");
xlabel("time");
set(gca,"fontsize",14);

figure #6
plot(xx2,abs(K2shift.*filter')); #k2filtered in freq domain
title("k2filtered in frequency domain");
xlabel("frequency");
set(gca,"fontsize",14);

#playing all audios
sound(k,freq);
sound(k2,freq); 
sound(k2filtered,freq); 