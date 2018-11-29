
clear, clc
%% -------------- Demo: binarySearchTree --------------

n0 = binarySearchTreenode(0.5);
N = 1e+2;
r = rand(N,1);
for i = 1:N
  n = binarySearchTreenode(r(i));
  n0.treeInsert(n);
end
% n0.inorderTreeWalk()


% 
% n1 = binarySearchTreenode(15);
% n2 = binarySearchTreenode(6);
% n3 = binarySearchTreenode(18);
% n4 = binarySearchTreenode(3);
% n5 = binarySearchTreenode(2);
% n6 = binarySearchTreenode(17);
% n7 = binarySearchTreenode(20);
% 
% n1.setLeftChild(n2);
% n1.setRightChild(n3);
% n2.setLeftChild(n4);
% n4.setLeftChild(n5);
% n3.setLeftChild(n6);
% n3.setRightChild(n7);

% n1.inorderTreeWalk()

% n1.treeSearch(20);
% 
% n1.treeMinimum();
% n1.treeMaximum();
% 
% n8 = binarySearchTreenode(10);
% n5.treeInsert(n8);
% n1.inorderTreeWalk()
% 
% n4.treeRoot;












