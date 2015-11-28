L=5119*(k-1);
n=zeros(5119,(k-1));
for i=1:(k-1)
    N=dataout1(1:5119,i);
n(:,i)=fftshift(fft(N.*rectwin(length(N))));
end
B=reshape(n,[1,L]);
Q=(20*log10(abs(B)/10^5))-35;
f=linspace((minf-1),((fc/1e6)+(interval/2)),L);
plot(f,Q);