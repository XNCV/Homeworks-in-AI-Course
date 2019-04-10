% tìm phòng target
clear all;close all
Gamma = 0.8;
Q = zeros(6,6);
R = [-1 -1 -1 -1 0 -1;
     -1 -1 -1 0 -1 100;
     -1 -1 -1 0 -1 -1;
     -1  0  0 -1 0 -1;
     0  -1 -1 0  -1 100;
     -1  0 -1 -1 0 100
    ];
for i = 1 : 10000
    goal = 0;
    next1State = [];
    next2State = [];
    StateCurrent = randi([1,6],1);     % Select a random initial state.
    while(goal==0)
        %Select (randomly) one among all possible actions for the current state.
        
        for n = 1 : 6
            if(R(StateCurrent,n) ~= -1)
                next1State = [n, next1State];
            end
        end
        ranNext1 = next1State(Buoc1(next1State));
        %Using this possible action, consider going to the next state
        for n = 1 : 6
            if(R(ranNext1,n) ~= -1)
                next2State = [n, next2State];
            end
        end
        %ranNext2 = next2State(Buoc2(next2State));
        %Get maximum Q value for this next state based on all possible actions.       
        maxQ = Buoc3(next2State,ranNext1,Q);
        %Compute: Q(state, action) ? R(state, action) + ?*Max[Q(next state, all actions)]
        Q(StateCurrent,ranNext1) = R(StateCurrent,ranNext1) + Gamma*maxQ;
        StateCurrent = ranNext1;
        if StateCurrent == 6
            goal = 1;
        end
        next1State = [];
        next2State = [];
    end
end
%----------------- normalization Q ---------------
nor = max(max(Q))/100;
Q = Q/nor;
save train.mat;

















