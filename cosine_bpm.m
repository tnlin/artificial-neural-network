clear;clc;close;
%% Loading Data & Create Network
p = -2:0.01:2; 
t = cos(2*pi*p);
net=feedforwardnet(10,'traingdm');
%% Training Params
net.trainParam.lr=0.03;     % Learning rate
net.trainParam.mu=0.9;      % Momentum constant 
net.trainParam.epochs=3000; % Maximum number of epochs to train
net.trainParam.show=20;     % Epochs between displays 
net.trainParam.max_fail=20;
net = init(net); 
%% Training & Predict
[net,tr]=train(net,p,t);
weight = net.IW{1,1};
y = sim(net, p);

%% Plot the result
plot(p, cos(2*pi*p), 'LineWidth', 2);hold on;
%plot(p, t,'r');
plot(p, y,'g', 'LineWidth', 2);
xlabel('p')
ylabel('y')
title('Cosine Wave with Momentum')
legend('cosine','predict') 
%legend('cosine','noised','predict') 
hold off;