clear all;close all;clc
load('train.mat');
ROOM = [];
StateCurrent = randi([1,6],1);
ROOM = [StateCurrent - 1, ROOM];
goal = 0;
nextState = [];
if(StateCurrent==6)
    goal = 1;
end
while(goal == 0)
    for n = 1 : 6
        if(R(StateCurrent,n) ~= -1)
            nextState = [n, nextState];
        end
    end
    maxQ = Buoc3(nextState,StateCurrent,Q);
    [~,c] = size(nextState);
    for i = 1 : c
        if(maxQ == Q(StateCurrent,nextState(i)))
            StateCurrent = nextState(i);
            ROOM = [ROOM, StateCurrent - 1];
            if(StateCurrent == 6)
                goal = 1;
            end
            break;
        end
    end
    nextState = [];
end
ROOM

