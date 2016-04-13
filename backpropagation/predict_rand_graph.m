function y = predict_rand_graph(net)
x_rand = randi(2,9,1)-1;
x_rand_shape = reshape(x_rand(1:9),3,3)
y_rand = net(x_rand)
if round(y_rand)==0
    disp('Result = L');
else
    disp('Result = T');
end
end