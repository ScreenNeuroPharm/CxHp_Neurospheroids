function [event_train] = event_train_detection(data,n)

% input:
% dati = fluorescence trace (.mat)
% n = number of considered ROI
% output:
% peak_train is an array of 0 and 1 (1 is the frame in which the event is
% detected)

[x, y]=size(data);

% Parameters
n_bin=10;    % Window (in frames) rapresenting the time in wich std is calculated
T_rest=20;   % min time (in frame) between events 
n_h=10;      % n_h*std = high treshold
n_l=5;       % n_l*std = low treshold
T_min=3;     % min time (in frames) between treshold
w_mean=100;  % Window size (in frames) used to calculate the mean fluorescence at the start and end of the recording to estimate and correct fluorescence drift.

% std of noise
for r=1:y
    h{1,r}=histogram(data(:,r));
    [val pos]=max(h{1,r}.Values);
    F_rum(1,r)=h{1,r}.BinEdges(pos);
end
for r=1:y
    for f=1:x 
        F_c(f,r)=(data(f,r)-F_rum(1,r))/F_rum(1,r);
    end
    for i=1:x-n_bin
        std_th(i,r)=std(F_c(i:i+n_bin,r));
    end
    min_std(r)=min(std_th(:,r));
end

% Drift correction 

t=[1:x];
for k=1:y
    s_start=mean(F_c(1:w_mean,k));
    std_start=std(F_c(1:w_mean,k));
    s_end=mean(F_c(x-w_mean:x,k));
    std_end=std(F_c(x-w_mean:x,k));
    c_mean{k}=[round(w_mean/2) s_start;x-round(w_mean/2) s_end];
    m(k)=(c_mean{k}(1,2)-c_mean{k}(2,2))/(c_mean{k}(1,1)-c_mean{k}(2,1));
    cost(k)=-m(k)*c_mean{k}(1,1)+c_mean{k}(1,2);
    drift{k}=m(k)*t+cost(k);
    if abs(s_start-s_end)/s_start>0.15
        F_cok(:,k)=F_c(:,k)-(drift{k})';
    else
        F_cok(:,k)=F_c(:,k);
    end
end

p_matrice=[F_cok>n_h*min_std(r) F_cok>n_l*min_std(r)];

% Peak detection
p_train=zeros(x,y);
for r=1:y
    for frame=1+T_rest:x-T_min
        if (p_matrice(frame,r)==1 && sum(p_matrice(frame+1:frame+T_min,r+y))==T_min) %&& mean(F_cok(frame-T_rest:frame-1,y))<F_cok(frame,y))
            p_train(frame,r)=1;
            p_matrice(frame+1:frame+T_rest,r)=0;
        end
    end
end

%Delete consecutive peak to detect the single event
p_train1=p_train;
for r=1:y
    pos_peak=find(p_train1(:,r)==1);
    for i=1:length(pos_peak)-1
        if sum(F_cok(pos_peak(i):pos_peak(i+1),r)>n_l*min_std(r))>=(pos_peak(i+1)-pos_peak(i))/1
            p_train1(pos_peak(i+1),r)=0;
        end
    end
end


p_train_ok=p_train(:,sum(p_train)>1);
p_train_ok=p_train_ok';

%save peak train
event_train=p_train1(:,sum(p_train)>1);
event_train=event_train';
save(strcat("PeakTrain"),"event_train");


end