
L=10;M=20;ST=1000;   %%(Lamda,mu,Simulation time)
L2=5;M2=10;ST2=1000; %%(Lamda2,Mu2, Simulation Time2)
Tstate=[]; %%(for storing the state value of the out put. we are creating an empty matrix)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for kk=10:24 %%(states)
    N=Q2MM1(L,M,ST); %Simulating the M/M/1
    T1=mean(N)/L; %average time that a customer spends in the petrol bunk when there is single server system
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %simulating 2 parallel M/M/1 systems simultaneously with the same
    %arrival rate,service rate and simulation time
    L2=5;M2=kk;ST2=1000;
    N1=Q2MM1(L2,M2,ST2);
    N2=Q2MM1(L2,M2,ST2);
    
    Tot_mean=mean([mean(N1)/L2,mean(N2)/L2]); %% by calculating the individual average times of 2 M/M/1 and taking the average is the total meam
    
   
    Tstate=[Tstate,Tot_mean-T1];%% gives at what state the M/M/2 system is better to use that M/M/1
end
%%%%%%%
figure,plot(Tstate),hold on %% plots the graph of the current state and the difference value
p=Tstate; %time state
tp=find(p>0);
p(tp)=0;
plot(p,'o')%%%
%%%%%%%%%%%
tp=find(Tstate<=0);
v=10:24;
x=v(tp);
disp(x)
%v(tp) ressembles at what state the 2 server system is better than the 1 server system  

%the service time chooses, we shouls choose the one which is minimum od contious behavior 