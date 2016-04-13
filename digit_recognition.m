clear;clc;close;
%% Loading Data & Create Network
x = [1,1,1,0,1,0,0,1,0;
    1,0,0,1,1,1,1,0,0;
    0,1,0,0,1,0,1,1,1;
    0,0,1,1,1,1,0,0,1;
    1,0,0,1,0,0,1,1,1;
    0,0,1,0,0,1,1,1,1;
    1,1,1,0,0,1,0,0,1;
    1,1,1,1,0,0,1,0,0;]';
t = [1,1,1,1,0,0,0,0];
net = patternnet(3,'traingd');
%% Training Params
net.trainParam.lr=0.01;     % Learning rate
net.trainParam.epochs=1000; % Maximum number of epochs to train
net.trainParam.show=20;     % Epochs between displays 
% Set all data to Training
net.divideParam.trainRatio=1;  %Train(default=0.7)
net.divideParam.valRatio=0;    %Validation(default=0.15)
net.divideParam.testRatio=0;   %Test(default=0.15)
%% Training & Predict
net = train(net,x,t);
y = net(x);

perf = perform(net,t,y);
classes = round(y);
%% Predict with NOISE
x_noised = x + 0.2*randn(size(x)); 
imagesc(reshape(x_noised(1:9),3,3)),colorbar , colormap gray;
y_noised = net(x_noised);
classes_noised = round(y_noised);

%% Predict with random generate graph
predict_rand_graph(net)


