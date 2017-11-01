close all
clear all
clc

fig=0;

X = rgb2gray(imread('lena.jpg'));
[N,M]= size(X);
hc = sum(sum(X==0));
h(1) = hc;
for i = 1:255
    h(i+1) = sum(sum(X==i));
    hc(i+1) = hc(i)+h(i+1);
end

T= @(p) round(hc(p)*254/(M*N));

Y=X;

for n=1:N
    for m=1:M
        Y(n,m) = T(X(n,m));
    end
end

hc2 = sum(sum(Y==0));
h2(1) = hc2;
for i = 1:255
    h2(i+1) = sum(sum(Y==i));
    hc2(i+1) = hc2(i)+h2(i+1);
end

fig=fig+1;
figure(fig)
subplot(3,2,1)
stem(h)
subplot(3,2,3)
stem(hc)
subplot(3,2,5)
imshow(X)
subplot(3,2,2)
stem(h2)
subplot(3,2,4)
stem(hc2)
subplot(3,2,6)
imshow(Y)

fig=fig+1;
figure(fig)
subplot(1,2,1)
imshow(X)
subplot(1,2,2)
imshow(Y)
