
clear, clc
%% --------------  Demo: Stack -----------------

% init

a = Stack;
a.dispStack;
b = Stack(5);
b.dispStack;
data = cell(5,1);
for i = 1:5, data{i} = i; end
c = Stack(data);
c.dispStack;

% push
for k = 20:-3:5
  c.push(k);
end
c.dispStack;

% pop
for k = 1:3
  ele = c.pop();
  disp(ele)
end
c.dispStack;


