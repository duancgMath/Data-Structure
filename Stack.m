
classdef Stack < handle
  % Properties
  properties (SetAccess = private)
    Data
    Length
    Capacity
  end
  
  % Methods
  methods
    
    function obj = Stack(data)
      % Construct function
      if nargin > 0 && iscell(data)
        obj.Data = data(:);
        obj.Length = numel(data);
        obj.Capacity = obj.length;
      elseif  nargin > 0
        obj.Data = cell(100,1);
        obj.Data{1} = data;
        obj.Length = 1;
        obj.Capacity = 100;
      else
        obj.Data = cell(100,1);
        obj.Length = 0;
        obj.Capacity = 100;
      end
    end
    
    function len = length(obj)
      % Get the length of the Stack
      len = obj.Length;
    end
    
    function isEmp = isEmpty(obj)
      % Judge whether the Stack is Empty
      isEmp = ~logical(obj.Length);
    end
    
    function push(obj, ele)
      % Push element in
      if obj.Length == obj.Capacity
        temp = cell(obj.Capacity*2,1);
        temp(1:obj.Length) = obj.Data;
        obj.Data = temp;
        obj.Capacity = obj.Capacity * 2;
      end
      obj.Length = obj.Length + 1;
      obj.Data{obj.Length} = ele;
    end
      
    function ele = pop(obj)
      % Pop element out
      if obj.Length
        ele = obj.Data{obj.Length};
        obj.Length = obj.Length - 1;
      else
        warning('POP(): The Stack is empty');
        ele = [];
      end
    end
    
    function dispStack(obj)
      % Display stack 
      disp('--------------- Stack ----------------------');
      if obj.Length
        for i = 1:obj.Length
          disp(['NO. ',num2str(i),' element of the stack:']);
          disp(obj.Data{i});
        end
      else
        disp('The Stack is empty');
      end
      disp('--------------------------------------------');
    end
    
    function remove(obj)
      obj.Length = 0;
    end
    
  end
 
end