clc;
clear;
hiddenLayerSize = 1;
%trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.
trainFcn = 'trainrp';  % Resilient Backpropagation
net = fitnet(hiddenLayerSize,trainFcn);
net.input.processFcns = {'removeconstantrows','mapminmax'};
net.output.processFcns = {'removeconstantrows','mapminmax'};
net.divideFcn = 'dividerand';  % Divide data randomly
net.divideMode = 'sample';  % Divide up every sample
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
load 'tank1.txt';
load 'v.txt';
% Choose a Performance Function
% For a list of all performance functions type: help nnperformance
net.performFcn = 'mse';  % Mean Squared Error
[net,tr] = train(net,tank1,v);
% disp(net); % output
y_Out = net(tank1);
x = (0:449)';
yy1 = smooth(x,y_Out,0.1,'loess');
x=0:449;
figure(1)
plot(tank1,'b');
hold on;
% plot(0:449,smoothdata(y_Out),'r');
plot(x,yy1,'r');
grid on;
xlabel('Time second');
ylabel('Height of Water Level/cm');
ylim([0 11]);
legend('Tank 1', 'Tank 2')

