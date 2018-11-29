
clear, clc
%% demo

n1 = dlnode(1);
n2 = dlnode(2);
n3 = dlnode(3);

n2.insertAfter(n1)
n3.insertAfter(n2)

head = dlnode(1);
for i = 100:-1:2
  new = dlnode(i);
  new.insertAfter(head);
end

clearList(head.Next.Next)
clear head new









