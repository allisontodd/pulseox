%
% Script name: pulseOxProbability.m
% Copyright 2021 Neal Patwari
%   
% ESE 359: Lab 1, Allison Todd
%
% Version History:
%   Version 1.0:  Initial Release.  26 Oct 2021.
%
% License: see LICENSE.md

% Our two hypotheses:
% H0: the "normal"
%     Arterial Oxygen Saturation is >= threshold
% H1: the "abnormal", what we want to be alarmed about
%     Arterial Oxygen Saturation is < threshold

% Load data: There are two files separated by race.
% I use _w and _b for the white and Black patient data, respectively
data_w = csvread('oxygenation_w.csv',1,0);
data_b = csvread('oxygenation_b.csv',1,0);
data_all = cat(1,data_w, data_b);
% column 1 = pulse ox measurement
% column 2 = arterial ox measurement 

%% Section 1

% given threshold:
thPO = 91.5;

thAO = 88;

% Black Patients:

% P[false alarm] = # of false alarms / # of cases not hypoxemia

cFalseAlarms = 0; % false alarms counter
cNotHypo = 0; % not hypoxemia counter

for i = 1:1:length(data_b)
    if data_b(i,2) > thAO     % AO > threshold --> NOT HYPOXEMIA
        cNotHypo = cNotHypo + 1;
        if data_b(i,1) < thPO % PO < threshold --> DECIDE HYPOXEMIA
            cFalseAlarms = cFalseAlarms + 1;
        end 
    end 
end 

P_b_falseAlarms = cFalseAlarms / cNotHypo

cCorrectDecide = 0; % correct decision counter
cHypoxemia = 0; % hypoxemia counter

for i = 1:1:length(data_b)
    if data_b(i,2) < thAO     % AO < threshold --> HYPOXEMIA
        cHypoxemia = cHypoxemia + 1;
        if data_b(i,1) < thPO % PO < threshold --> DECIDE HYPOXEMIA
            cCorrectDecide = cCorrectDecide + 1;
        end 
    end 
end 

P_b_correctDetection = cCorrectDecide / cHypoxemia


% White Patients:

cFalseAlarms = 0; % false alarms counter
cNotHypo = 0; % not hypoxemia counter

for i = 1:1:length(data_w)
    if data_w(i,2) > thAO    % AO > threshold --> NOT HYPOXEMIA
        cNotHypo = cNotHypo + 1;
        if data_w(i,1) < thPO % PO < threshold --> DECIDE HYPOXEMIA
            cFalseAlarms = cFalseAlarms + 1;
        end 
    end 
end 

P_w_falseAlarms = cFalseAlarms / cNotHypo

cCorrectDecide = 0; % correct decision counter
cHypoxemia = 0; % hypoxemia counter

for i = 1:1:length(data_w)
    if data_w(i,2) < thAO    % AO < threshold --> HYPOXEMIA
        cHypoxemia = cHypoxemia + 1;
        if data_w(i,1) < thPO % PO < threshold --> DECIDE HYPOXEMIA
            cCorrectDecide = cCorrectDecide + 1;
        end 
    end 
end 

P_w_correctDetection = cCorrectDecide / cHypoxemia


% All Patients: 

cFalseAlarms = 0; % false alarms counter
cNotHypo = 0; % not hypoxemia counter

for i = 1:1:length(data_all)
    if data_all(i,2) > thAO     % AO > threshold --> NOT HYPOXEMIA
        cNotHypo = cNotHypo + 1;
        if data_all(i,1) < thPO % PO < threshold --> DECIDE HYPOXEMIA
            cFalseAlarms = cFalseAlarms + 1;
        end 
    end 
end 

P_all_falseAlarms = cFalseAlarms / cNotHypo

cCorrectDecide = 0; % correct decision counter
cHypoxemia = 0; % hypoxemia counter

for i = 1:1:length(data_all)
    if data_all(i,2) < thAO     % AO < threshold --> HYPOXEMIA
        cHypoxemia = cHypoxemia + 1;
        if data_all(i,1) < thPO % PO < threshold --> DECIDE HYPOXEMIA
            cCorrectDecide = cCorrectDecide + 1;
        end 
    end 
end 

P_all_correctDetection = cCorrectDecide / cHypoxemia


%% Section 2

thAO = 88;

for j = 88.5 : 1 : 96.5
    thPO = j;

    % Black Patients:

    % P[false alarm] = # of false alarms / # of cases not hypoxemia

    cFalseAlarms = 0; % false alarms counter
    cNotHypo = 0; % not hypoxemia counter

    for i = 1:1:length(data_b)
        if data_b(i,2) > thAO     % AO > threshold --> NOT HYPOXEMIA
            cNotHypo = cNotHypo + 1;
            if data_b(i,1) < thPO % PO < threshold --> DECIDE HYPOXEMIA
                cFalseAlarms = cFalseAlarms + 1;
            end 
        end 
    end 

    P_b_falseAlarms = cFalseAlarms / cNotHypo;

    cCorrectDecide = 0; % correct decision counter
    cHypoxemia = 0; % hypoxemia counter

    for i = 1:1:length(data_b)
        if data_b(i,2) < thAO     % AO < threshold --> HYPOXEMIA
            cHypoxemia = cHypoxemia + 1;
            if data_b(i,1) < thPO % PO < threshold --> DECIDE HYPOXEMIA
                cCorrectDecide = cCorrectDecide + 1;
            end 
        end 
    end 

    P_b_correctDetection = cCorrectDecide / cHypoxemia;


    % White Patients:

    cFalseAlarms = 0; % false alarms counter
    cNotHypo = 0; % not hypoxemia counter

    for i = 1:1:length(data_w)
        if data_w(i,2) > thAO    % AO > threshold --> NOT HYPOXEMIA
            cNotHypo = cNotHypo + 1;
            if data_w(i,1) < thPO % PO < threshold --> DECIDE HYPOXEMIA
                cFalseAlarms = cFalseAlarms + 1;
            end 
        end 
    end 

    P_w_falseAlarms = cFalseAlarms / cNotHypo;

    cCorrectDecide = 0; % correct decision counter
    cHypoxemia = 0; % hypoxemia counter

    for i = 1:1:length(data_w)
        if data_w(i,2) < thAO    % AO < threshold --> HYPOXEMIA
            cHypoxemia = cHypoxemia + 1;
            if data_w(i,1) < thPO % PO < threshold --> DECIDE HYPOXEMIA
                cCorrectDecide = cCorrectDecide + 1;
            end 
        end 
    end 

    P_w_correctDetection = cCorrectDecide / cHypoxemia;


    % All Patients: 

    cFalseAlarms = 0; % false alarms counter
    cNotHypo = 0; % not hypoxemia counter

    for i = 1:1:length(data_all)
        if data_all(i,2) > thAO     % AO > threshold --> NOT HYPOXEMIA
            cNotHypo = cNotHypo + 1;
            if data_all(i,1) < thPO % PO < threshold --> DECIDE HYPOXEMIA
                cFalseAlarms = cFalseAlarms + 1;
            end 
        end 
    end 

    P_all_falseAlarms = cFalseAlarms / cNotHypo;

    cCorrectDecide = 0; % correct decision counter
    cHypoxemia = 0; % hypoxemia counter

    for i = 1:1:length(data_all)
        if data_all(i,2) < thAO     % AO < threshold --> HYPOXEMIA
            cHypoxemia = cHypoxemia + 1;
            if data_all(i,1) < thPO % PO < threshold --> DECIDE HYPOXEMIA
                cCorrectDecide = cCorrectDecide + 1;
            end 
        end 
    end 

    P_all_correctDetection = cCorrectDecide / cHypoxemia;

    data = [P_w_falseAlarms P_w_correctDetection;
        P_b_falseAlarms P_b_correctDetection;
        P_all_falseAlarms P_all_correctDetection]

    allProb(:,:,j-87.5) = data
end 

%% Section 3 - Plotting

% parsing data to be plotted
p_FA_w = reshape(allProb(1,1,:), [9 1]);
p_CD_w = reshape(allProb(1,2,:), [9 1]);
p_FA_b = reshape(allProb(2,1,:), [9 1]);
p_CD_b = reshape(allProb(2,2,:), [9 1]);
p_FA_all = reshape(allProb(3,1,:), [9 1]);
p_CD_all = reshape(allProb(3,2,:), [9 1]);

threshold_list = 88.5 : 1 : 96.5;

% Plot the results
figure(1)
plot(p_FA_w, p_CD_w, 'rs', p_FA_b, p_CD_b, 'ko', p_FA_all, p_CD_all, 'g.', ...
    'LineWidth',2, 'MarkerSize',10)
set(gca, 'FontSize', 16)
set(gca,'xlim',[-0.05, 1.05])
set(gca,'ylim',[-0.05, 1.05])
grid('on')
xlabel('Probability of False Alarm')
ylabel('Probability of Correct Detection')
hold on;
for i=1:length(threshold_list)
    % Put the threshold_list(i) on each dot, connect the white/Black points for 
    % that correspond to the same threshold_list(i).
    text(p_FA_w(i)-0.01, p_CD_w(i), num2str(threshold_list(i),'%.1f'), ...
        'HorizontalAlignment', 'right', 'FontSize', 14);
    text(p_FA_b(i)+0.01, p_CD_b(i), num2str(threshold_list(i),'%.1f'), ...
        'HorizontalAlignment', 'left', 'FontSize', 14);
    plot([p_FA_b(i),p_FA_w(i)], [p_CD_b(i),p_CD_w(i)], 'b-', 'LineWidth',2);
end
legend('White', 'Black', 'All','Location','southeast','FontSize',16)

