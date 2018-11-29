
classdef dlnode < handle
% -----------------------------------------------------
% --------------- Class Properties -------------------
% Data ！ Contains the data for this node
% Next ！ Contains the handle of the next node in the list
% Prev ！ Contains the handle of the previous node in the list
% --------------- Class Methods ------------------------
% dlnode ！ Construct a node and assign the value passed as an input to the Data property
% insertAfter ！ Insert this node after the specified node
% insertBefore ！ Insert this node before the specified node
% removeNode ！ Remove this node from the list and reconnect the remaining nodes
% clearList ！ Remove large lists efficiently
% delete ！ Private method called by MATLAB when deleting the list.
% -----------------------------------------------------
  properties
    Data
  end
  properties (SetAccess = private)
    Next = dlnode.empty
    Prev = dlnode.empty
  end
  methods
    function obj = dlnode(Data) 
      % Construct a dlnode object
      if nargin > 0
        obj.Data = Data;
      end
    end
    function insertAfter(obj,nodeBefore)
      % Insert newNode after nodeBefore
      obj.removeNode();
      obj.Next = nodeBefore.Next;
      obj.Prev = nodeBefore;
      if ~isempty(nodeBefore.Next)
        nodeBefore.Next.Prev = obj;
      end
      nodeBefore.Next = obj;
    end
    function insertBefore(obj, nodeAfter)
      % Insert newNode before nodeAfter 
      obj.removeNode();
      obj.Next = nodeAfter;
      obj.Prev = nodeAfter.Prev;
      if ~isempty(nodeAfter.Prev)
        nodeAfter.Prev.Next = obj;
      end
      nodeAfter.Prev = obj;
    end
    function removeNode(obj)
      % Remove a node from a linked list.
      if ~isscalar(obj)
        error('Input must be scalar')
      end
      prevNode = obj.Prev;
      nextNode = obj.Next;
      if ~isempty(prevNode)
        prevNode.Next = nextNode;
      end
      if ~isempty(nextNode)
        nextNode.Prev = prevNode;
      end
      obj.Next = dlnode.empty;
      obj.Prev = dlnode.empty;
    end
    function clearList(obj)
      % Clear the list before clearing list variable
      prev = obj.Prev;
      next = obj.Next;
      obj.removeNode();
      while ~isempty(next)
        obj = next;
        next = obj.Next;
        obj.removeNode();
      end
      while ~isempty(prev)
        obj = prev;
        prev = obj.Prev;
        obj.removeNode();
      end
    end
  end
  methods (Access = private)
    function delete(obj)
      obj.clearList();
    end
  end
  
end