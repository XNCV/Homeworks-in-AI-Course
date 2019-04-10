function maxQ = Buoc3(nextState,ran,Q)
    [~,c] = size(nextState);
    maxQ = [];
    for i = 1:c
        maxQ = [Q(ran,nextState(i)) maxQ];
    end
    maxQ = max(maxQ);
end