[f,freq]=audioread("test.wav");

x1=length(f)/freq; #time length of the audio 
x=linspace(0,x1,length(f)); #time domain

#my audio data "myf"
myf=0;
i=1;
imax=50;
while i<=imax
  myf=myf+sin((i+2)*x);
  i+=1;
endwhile
myf=myf';

#figure 1
plot(x,myf); #myf in time domain
title("myf in time domain");
xlabel("time");
set(gca,"fontsize",14);

#Fourier transormation of myf
myF=fft(myf); 
myFshift=fftshift(myF);#shifting myF

df=freq/length(myF); #resolution[Hz]
x2=-freq/2:df:freq/2-df; #frequency domain

figure #2
plot(x2,abs(myFshift)); #myf in frequency domain
title("myf in frequency domain");
xlabel("frequency");
set(gca,"fontsize",14);

figure #3
plot(x,f); #f in time domain
title("f in time domain");
xlabel("time");
set(gca,"fontsize",14);

#Fourier transormation of test.wav
Fshift=fftshift(fft(f));#shifting F

figure #4
plot(x2,abs(Fshift)); #f in frequency domain
title("f in frequency domain");
xlabel("frequency");
set(gca,"fontsize",14);

#adding sine wave to test.wav
f2=sin(2*x)'.+f;

figure #5
plot(x,f2); #f2 in time domain
title("f2 in time domain");
xlabel("time");
set(gca,"fontsize",14);

F2shift=fftshift(fft(f2));

figure #6
plot(x2,abs(F2shift)); #f2 in frequency domain
title("f2 in frequency domain");
xlabel("frequency");
set(gca,"fontsize",14);

#filtering noise
filter=abs(x2)>10; #filtering out freq>-10Hz&freq<10Hz 
f2filtered=ifft(ifftshift(F2shift.*filter'));

figure #7
plot(x,f2filtered); #f2filtered in time domain
title("f2filtered in time domain");
xlabel("time");
set(gca,"fontsize",14);

figure #8
plot(x2,abs(F2shift.*filter')); #f2filtered in frequnecy domain
title("f2filtered in frequency domain");
xlabel("frequency");
set(gca,"fontsize",14);

#playing all audios
sound(myf,freq); 
sound(f2,freq); 
sound(f2filtered,freq); 