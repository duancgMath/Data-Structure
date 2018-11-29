
classdef binarySearchTreenode < handle
% -----------------------------------------------------
% --------------- Class Properties -------------------
% Data - Contains the data for this node
% Parent - Contains the handle of the parent node in the tree
% LeftChild - Contains the handle of the left child node in the tree
% RightChild - Contains the handle of the right child node in the tree
% --------------- Class Methods ------------------------
% binarySearchTreenode - Construct a node and assign the value passed as an input to the Data property
% getLeftChild - Get left child of obj
% getRightChild - Get right child of obj
% setLeftChild - Set newNode as left child of obj
% setRightChild - Set newNode as right child of obj 
%
%
%
%
%
%
%
% insertLeft ！ Insert this node after the specified node
% insertRight ！ Insert this node before the specified node
% removeNode ！ Remove this node from the list and reconnect the remaining nodes
% clearTree ！ Remove large lists efficiently
% delete ！ Private method called by MATLAB when deleting the list.
% -----------------------------------------------------

  properties (SetAccess = private)
    Data 
    Parent = binarySearchTreenode.empty
    LeftChild = binarySearchTreenode.empty
    RightChild = binarySearchTreenode.empty
  end
  
  methods
    
    function obj = binarySearchTreenode(Data) 
      % Construct a binarySearchTreenode object
      if nargin > 0
        obj.Data = Data;
      end
    end
    
    function isEmp = isEmpty(obj)
      if isempty(obj)
        isEmp = true;
      else
        isEmp = false;
      end
    end
    
    function root = treeRoot(obj)
      % Find the root of the tree
      root = obj;
      while ~isempty(root.Parent)
        root = root.Parent;
      end
    end
    
    function parent = getParent(obj)
      if isempty(obj.Parent)
        warning('Parent node is empty.');
      end
      parent = obj.Parent;
    end
    
    function leftChild = getLeftChild(obj)
      % Get left child of obj
      if isempty(obj.LeftChild)
        warning('Left child node is empty.');
      end
      leftChild = obj.LeftChild;
    end
    
    function rightChild = getRightChild(obj)
      % Get right child of obj
      if isempty(obj.RightChild)
        warning('Right child node is empty');
      end
      rightChild = obj.RightChild;
    end
    
    function setLeftChild(obj,nodeLeftChild)
      % Set newNode as left child of obj
      obj.LeftChild = nodeLeftChild;
      nodeLeftChild.Parent = obj;
    end
    
    function setRightChild(obj, nodeRightChild)
      % Set newNode as right child of obj 
      obj.RightChild = nodeRightChild;
      nodeRightChild.Parent = obj;
    end
    
    function inorderTreeWalk(obj) 
      % Inorder tree walk
      if ~obj.isEmpty()
          obj.LeftChild.inorderTreeWalk();
          disp(obj.Data);
          obj.RightChild.inorderTreeWalk();
      end
    end
    
    function search = treeSearch_recursion(obj, val)
      % Search given value with recursion
      if isempty(obj)
        search = false;
        return
      elseif  val==obj.Data
        search = true;
        return
      end
      if val < obj.Data
        search = treeSearch(obj.LeftChild, val);
      else
        search = treeSearch(obj.RightChild, val);
      end
    end
    
    function search = treeSearch(obj, val)
      % Search given value with iteration
      while ~isempty(obj) && val~= obj.Data
        if val < obj.Data
          obj = obj.LeftChild;
        else
          obj = obj.RightChild;
        end
      end
      if isempty(obj)
        search = false;
      elseif  val==obj.Data
        search = true;
      end
    end
    
    function min = treeMinimum(obj)
      % Return the minimum data in the tree
      while ~isempty(obj)
        min = obj.Data;
        obj = obj.LeftChild;
      end
    end
    
    function max = treeMaximum(obj)
      % Return the maximum data in the tree
      while ~isempty(obj)
        max = obj.Data;
        obj = obj.RightChild;
      end
    end
    
    function treeInsert(obj, insertNode)
      % Insert a now node into the tree
      if isempty(insertNode.Data)
        error('The node inserted is null');
      end
      xParent = binarySearchTreenode.empty;
      x = obj.treeRoot;
      while ~isempty(x)
        xParent = x;
        if insertNode.Data < x.Data
          x = x.LeftChild;
        else
          x = x.RightChild;
        end
      end
      insertNode.Parent = xParent;
      if isempty(xParent)
        error('The initial tree is empty'); % tree is empty
      elseif insertNode.Data < xParent.Data
        xParent.LeftChild = insertNode;
      else
        xParent.RightChild = insertNode;
      end
    end
    
    function treeDelete(obj, deleteNode)
      
    end
    
    function removeNode(obj)
      % Remove a node from a binary tree.
      
    end
    
    function clearTree(obj)
      % Clear the list before clearing list variable
      
    end
    
  end
  
%   methods (Access = private)
%     function delete(obj)
%       obj.clearTree();
%     end
%   end
  
end 
