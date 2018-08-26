
clear;
clc;

%%
MUE_C = [];    
min_FUE = [];
sum_FUE = [];
mean_FUE = [];
max_FUE = [];
failed_FUE = [];
diff_FUE = []; % difference of rate of failed FUEs from QoS
C_FUE_Mat = cell(1,40);
for i=1:10
    fprintf('FBS num = %d\t', i);
    maxmue = 0.;
    maxfue = 0.;
    mue_C = 0.;
    minfue = 0.;
    sumfue = 0.;
    c_fue_vec = zeros(1,i);
    Cnt = 0;
    lowCnt = 0;
    failedFUE = 0;
    diffFUE = 0;
    for j=1:500
%         s = sprintf('Jun14/learn_rate/pro_IL_77_%d_%d.mat',i,j);
        s = sprintf('Aug22/T1/pro_x_2_CL_%d_%d.mat',i,j);
%         s = sprintf('Aug16/IL/pro_IL_77_%d_%d.mat',i,j);
        filename = strcat(s);
        if exist(s)
            load(filename);
%                 mue_C  = QFinal.mue.C;
%                 cc = sum(C(40000:size(C,2)))/(-40000+size(C,2)+1);
                mue_C = mue_C + QFinal.mue.C;
                sumfue = sumfue + QFinal.sum_CFUE;
                c_fue_vec = c_fue_vec + QFinal.C_FUE;
                failedFUE = failedFUE + sum(QFinal.C_FUE<0.5);
                if sum((QFinal.C_FUE<0.5)) > 0
                    diffFUE = diffFUE + sum((QFinal.C_FUE<0.5).*(0.5-QFinal.C_FUE))./sum((QFinal.C_FUE<0.5));
                end
                Cnt = Cnt+1;
        end
    end
    fprintf('Total Cnt = %d\n',Cnt);
   
    MUE_C = [MUE_C mue_C/Cnt]; 
    sum_FUE = [sum_FUE sumfue/Cnt];
    C_FUE_Mat{i} = c_fue_vec./Cnt;
    mean_FUE = [mean_FUE mean(C_FUE_Mat{i})];
    max_FUE = [max_FUE max(C_FUE_Mat{i})];
    min_FUE = [min_FUE min(C_FUE_Mat{i})];
    failed_FUE = [failed_FUE (failedFUE/(i*Cnt))*100];
    diff_FUE = [diff_FUE diffFUE./(Cnt)];
end
%%
MUE_C_1 = [];    
min_FUE_1 = [];
sum_FUE_1 = [];
mean_FUE_1 = [];
max_FUE_1 = [];
failed_FUE_1 = [];
diff_FUE_1 = [];
C_FUE_Mat_1 = cell(1,16);
for i=1:10
    fprintf('FBS num = %d\t', i);
    maxmue = 0.;
    maxfue = 0.;
    mue_C = 0.;
    minfue = 0.;
    sumfue = 0.;
    c_fue_vec = zeros(1,i);
    Cnt = 0;
    lowCnt = 0;
    failedFUE = 0;
    diffFUE = 0;
    
    for j=1:500
        s = sprintf('Aug25/T1/prox_2_IL_%d_%d.mat',i,j);
%         s = sprintf('July10/ILCL/pro_CL_77_%d_%d.mat',i,j);
        filename = strcat(s);
        if exist(s)
            load(filename);
%                 C = QFinal.mue.C_profile;
%                 cc = sum(C(40000:size(C,2)))/(-40000+size(C,2)+1);
                mue_C = mue_C + QFinal.mue.C;
                sumfue = sumfue + QFinal.sum_CFUE;
                c_fue_vec = c_fue_vec + QFinal.C_FUE;
                failedFUE = failedFUE + sum(QFinal.C_FUE<0.5);
                if sum((QFinal.C_FUE<0.5)) > 0
                    diffFUE = diffFUE + sum((QFinal.C_FUE<0.5).*(0.5-QFinal.C_FUE))./sum((QFinal.C_FUE<0.5));
                end
                Cnt = Cnt+1;
        end
    end
    fprintf('Total Cnt = %d\n',Cnt);
    
    MUE_C_1 = [MUE_C_1 mue_C/Cnt]; 
    sum_FUE_1 = [sum_FUE_1 sumfue/Cnt];
    C_FUE_Mat_1{i} = c_fue_vec./Cnt;
    min_FUE_1 = [min_FUE_1 min(C_FUE_Mat_1{i})];
    mean_FUE_1 = [mean_FUE_1 mean(C_FUE_Mat_1{i})];
    max_FUE_1 = [max_FUE_1 max(C_FUE_Mat_1{i})];
    failed_FUE_1 = [failed_FUE_1 (failedFUE/(i*Cnt))*100];
    diff_FUE_1 = [diff_FUE_1 diffFUE./Cnt];
end
%%
MUE_C_2 = [];    
min_FUE_2 = [];
sum_FUE_2 = [];
mean_FUE_2 = [];
max_FUE_2 = [];
failed_FUE_2 = [];
diff_FUE_2 = [];
C_FUE_Mat_2 = cell(1,16);
for i=1:10
    fprintf('FBS num = %d\t', i);
    maxmue = 0.;
    maxfue = 0.;
    mue_C = 0.;
    minfue = 0.;
    sumfue = 0.;
    c_fue_vec = zeros(1,i);
    Cnt = 0;
    lowCnt = 0;
    failedFUE = 0;
    diffFUE = 0;
    
    for j=1:500
%         s = sprintf('Rref_1/R3_%d_%d.mat',i,j);
        s = sprintf('Aug25/T1/prox_2_CL_%d_%d.mat',i,j);
        filename = strcat(s);
        if exist(s)
            load(filename);
%                 C = QFinal.mue.C_profile;
%                 cc = sum(C(40000:size(C,2)))/(-40000+size(C,2)+1);
                mue_C = mue_C + QFinal.mue.C;
                sumfue = sumfue + QFinal.sum_CFUE;
                c_fue_vec = c_fue_vec + QFinal.C_FUE;
                failedFUE = failedFUE + sum(QFinal.C_FUE<0.5);
                if sum((QFinal.C_FUE<0.5)) > 0
                    diffFUE = diffFUE + sum((QFinal.C_FUE<0.5).*(0.5-QFinal.C_FUE))./sum((QFinal.C_FUE<0.5));
                end
                Cnt = Cnt+1;
        end
    end
    fprintf('Total Cnt = %d\n',Cnt);
    
    MUE_C_2 = [MUE_C_2 mue_C/Cnt]; 
    sum_FUE_2 = [sum_FUE_2 sumfue/Cnt];
    C_FUE_Mat_2{i} = c_fue_vec./Cnt;
    min_FUE_2 = [min_FUE_2 min(C_FUE_Mat_2{i})];
    mean_FUE_2 = [mean_FUE_2 mean(C_FUE_Mat_2{i})];
    max_FUE_2 = [max_FUE_2 max(C_FUE_Mat_2{i})];
    failed_FUE_2 = [failed_FUE_2 (failedFUE/(i*Cnt))*100];
    diff_FUE_2 = [diff_FUE_2 diffFUE./Cnt];
end
%%
MUE_C_3 = [];    
min_FUE_3 = [];
sum_FUE_3 = [];
mean_FUE_3 = [];
max_FUE_3 = [];
failed_FUE_3 = [];
diff_FUE_3 = [];
C_FUE_Mat_3 = cell(1,16);
for i=1:10
    fprintf('FBS num = %d\t', i);
    maxmue = 0.;
    maxfue = 0.;
    mue_C = 0.;
    minfue = 0.;
    sumfue = 0.;
    c_fue_vec = zeros(1,i);
    Cnt = 0;
    lowCnt = 0;
    failedFUE = 0;
    diffFUE = 0;
    
    for j=1:500
%         s = sprintf('Rref_1/R3_%d_%d.mat',i,j);
        s = sprintf('Aug22/T1/pro_x_4_IL_%d_%d.mat',i,j);
        filename = strcat(s);
        if exist(s)
            load(filename);
%                 C = QFinal.mue.C_profile;
%                 cc = sum(C(40000:size(C,2)))/(-40000+size(C,2)+1);
                mue_C = mue_C + QFinal.mue.C;
                sumfue = sumfue + QFinal.sum_CFUE;
                c_fue_vec = c_fue_vec + QFinal.C_FUE;
                failedFUE = failedFUE + sum(QFinal.C_FUE<0.5);
                if sum((QFinal.C_FUE<0.5)) > 0
                    diffFUE = diffFUE + sum((QFinal.C_FUE<0.5).*(0.5-QFinal.C_FUE))./sum((QFinal.C_FUE<0.5));
                end
                Cnt = Cnt+1;
        end
    end
    fprintf('Total Cnt = %d\n',Cnt);
    
    MUE_C_3 = [MUE_C_3 mue_C/Cnt]; 
    sum_FUE_3 = [sum_FUE_3 sumfue/Cnt];
    C_FUE_Mat_3{i} = c_fue_vec./Cnt;
    min_FUE_3 = [min_FUE_3 min(C_FUE_Mat_3{i})];
    mean_FUE_3 = [mean_FUE_3 mean(C_FUE_Mat_3{i})];
    max_FUE_3 = [max_FUE_3 max(C_FUE_Mat_3{i})];
    failed_FUE_3 = [failed_FUE_3 (failedFUE/(i*Cnt))*100];
    diff_FUE_3 = [diff_FUE_3 diffFUE./Cnt];
end
%%
figure;
hold on;
grid on;
box on;
plot(ones(1,10)*4.0, '--k', 'LineWidth',1);
plot(MUE_C, '--dr', 'LineWidth',1.3,'MarkerSize',8, 'MarkerFaceColor','r', 'MarkerEdgeColor','b');
plot(MUE_C_1, '--db', 'LineWidth',1.3,'MarkerSize',8, 'MarkerFaceColor','b', 'MarkerEdgeColor','b');
plot(MUE_C_2, '--dg', 'LineWidth',1.3,'MarkerSize',8, 'MarkerFaceColor','g', 'MarkerEdgeColor','b');
% plot(MUE_C_3, '--dk', 'LineWidth',1.3,'MarkerSize',8, 'MarkerFaceColor','k', 'MarkerEdgeColor','b');
% title('MUE transmission rate','FontSize',12);%, 'FontWeight','bold');
xlabel('FBS Numbers','FontSize',12);%, 'FontWeight','bold');
ylabel('Transmission rate (b/s/Hz)','FontSize',12);%, 'FontWeight','bold');
xlim([1 10]);
% ylim([3 10]);
% legend({'qos', 'IL','CL'},'Interpreter','latex','FontSize',12);
% legend({'qos','$\mathcal{X}_1$','$\mathcal{X}_2$', '$\mathcal{X}_3$', '$\mathcal{X}_4$'},'Interpreter','latex','FontSize',12);
legend({'$\mathcal{X}_1$','$\mathcal{X}_2$', '$\mathcal{X}_3$', '$\mathcal{X}_4$'},'Interpreter','latex','FontSize',12);
% legend({'$\mathbf{\tilde{q}}$','IL+$\mathbf{X}_1$','CL+$\mathbf{X}_2$', 'X_3', 'X_4'},'FontSize',14, 'FontWeight','bold','Interpreter','latex');
% legend({'$\mathbf{\tilde{q}}$','IL+$\mathbf{X}_2$','CL+$\mathbf{X}_3$'},'FontSize',14, 'FontWeight','bold','Interpreter','latex');
% legend({'qos','proposed RF','proximity RF'},'FontSize',12);%, 'FontWeight','bold','Interpreter','latex');
%%
figure;
hold on;
grid on;
box on;
plot(ones(1,10)*.50, '--k', 'LineWidth',1);
plot(mean_FUE, '--or', 'LineWidth',1.3,'MarkerSize',8, 'MarkerFaceColor','r', 'MarkerEdgeColor','b');
plot(mean_FUE_1, '--ob', 'LineWidth',1.3,'MarkerSize',8, 'MarkerFaceColor','b', 'MarkerEdgeColor','b');
plot(mean_FUE_2, '--og', 'LineWidth',1.3,'MarkerSize',8, 'MarkerFaceColor','g', 'MarkerEdgeColor','b');
% plot(mean_FUE_3, '--ok', 'LineWidth',1.3,'MarkerSize',8, 'MarkerFaceColor','k', 'MarkerEdgeColor','b');
% title('MUE transmission rate','FontSize',12);%, 'FontWeight','bold');
xlabel('FBS Numbers','FontSize',12);%, 'FontWeight','bold');
ylabel('Transmission rate (b/s/Hz)','FontSize',12);%, 'FontWeight','bold');
xlim([1 10]);
% ylim([0 4]);
% legend({'qos', 'IL','CL'},'Interpreter','latex','FontSize',12);
legend({'IL+qos','$\mathcal{X}_1$','$\mathcal{X}_2$', '$\mathcal{X}_3$', '$\mathcal{X}_4$'},'Interpreter','latex','FontSize',12);
%%
figure;
hold on;
grid on;
box on;
plot( ones(1,10)*0.50, '--k', 'LineWidth',1);
for i=1:10
    vec = C_FUE_Mat{i};
%     vec_ref = C_FUE_Mat_1{i};
%     vec_ilq = C_FUE_Mat_2{i};
%     vec_4 = C_FUE_Mat_3{i};
    for j=1:size(vec,2)
        plot(i,vec(j), 'sr', 'LineWidth',1.2,'MarkerSize',10, 'MarkerEdgeColor','r');
%         plot(i,vec_ref(j), 'sb', 'LineWidth',1.2,'MarkerSize',10, 'MarkerEdgeColor','b');
%         plot(i,vec_ilq(j), '*g', 'LineWidth',1,'MarkerSize',10);
%         plot(i,vec_4(j), '*k', 'LineWidth',1,'MarkerSize',10);
    end
end
plot(min_FUE, '--r', 'LineWidth',1.2,'MarkerSize',10);
% plot(min_FUE_1, '--b', 'LineWidth',1.2,'MarkerSize',10);
% plot(min_FUE_2, '--g', 'LineWidth',1,'MarkerSize',10);
% plot(min_FUE_3, '--k', 'LineWidth',1,'MarkerSize',10);
% title('FUEs capacity','FontSize',14, 'FontWeight','bold');
xlabel('FBS Numbers','FontSize',12);%, 'FontWeight','bold');
ylabel('Transmission rate(b/s/Hz)','FontSize',12);%, 'FontWeight','bold');
% xlim([2 16]);
% ylim([0 3.5]);
% legend({'qos','proposed RF','proximity RF'},'FontSize',12);%, 'FontWeight','bold');
%%
figure;

subplot(3,1,1);
hold on;
grid on;
box on;
plot(1:10, ones(1,10)*0.50, '--k', 'LineWidth',1);
errorbar(1:10, mean_FUE, max_FUE-min_FUE, '--or', 'LineWidth',1.3,'MarkerSize',2, 'MarkerFaceColor','r', 'MarkerEdgeColor','b');
%  xlim([1 16]);
% ylim([0 4.0]);
legend({'IL+qos','$\mathcal{X}_1$'}, 'Interpreter','latex','FontSize',12);
% legend({'qos', 'old pathloss'},'Interpreter','latex','FontSize',12);
% legend({'qos','IL+$\mathcal{X}_2$'},'FontSize',10, 'Interpreter','latex');


subplot(3,1,2);
hold on;
grid on;
box on;
plot(1:10, ones(1,10)*0.50, '--k', 'LineWidth',1);
errorbar(1:10, mean_FUE_1, max_FUE_1-min_FUE_1, '--ob', 'LineWidth',1.3,'MarkerSize',2, 'MarkerFaceColor','b', 'MarkerEdgeColor','b');
%  xlim([1 16]);
% ylim([0 4.0]);
% legend({'qos','proximity RF'},'FontSize',12);
legend({'qos', '$\mathcal{X}_2$'},'Interpreter','latex','FontSize',12);
% legend({'qos','CL+$\mathcal{X}_2$'},'FontSize',10, 'Interpreter','latex');

subplot(3,1,3);
hold on;
grid on;
box on;
plot(1:10, ones(1,10)*.50, '--k', 'LineWidth',1);
errorbar(1:10, mean_FUE_2, max_FUE_2-min_FUE_2, '--og', 'LineWidth',1.3,'MarkerSize',2, 'MarkerFaceColor','g', 'MarkerEdgeColor','b');
xlim([1 10]);
% ylim([0 4.0]);
% legend('X_3');
legend({'qos', '$\mathcal{X}_3$'},'Interpreter','latex','FontSize',12);
% legend({'qos','CL+$\mathcal{X}_1$'},'FontSize',10, 'Interpreter','latex');
%%
subplot(4,1,4);
hold on;
grid on;
box on;
plot(1:10, ones(1,10)*0.50, '--k', 'LineWidth',1);
errorbar(1:10, mean_FUE_3, max_FUE_3-min_FUE_3, '--ok', 'LineWidth',1.3,'MarkerSize',2, 'MarkerFaceColor','k', 'MarkerEdgeColor','b');
% xlim([2 15]);
% ylim([0 4.0]);
legend({'qos','$\mathcal{X}_4$'},'FontSize',10, 'Interpreter','latex');

supertitle('','FontSize',14, 'FontWeight','bold');

% xlabel('FBS Numbers','FontSize',14, 'FontWeight','bold');
% ylabel('Capacity(b/s/HZ)','FontSize',14, 'FontWeight','bold');
%%
figure;
hold on;
grid on;
box on;
% plot( ones(1,16)*2.0, '--k', 'LineWidth',1 );
plot(sum_FUE, '--or', 'LineWidth',1.2,'MarkerSize',8, 'MarkerFaceColor','r', 'MarkerEdgeColor','b');
plot(sum_FUE_1, '--ob', 'LineWidth',1.2,'MarkerSize',8, 'MarkerFaceColor','b', 'MarkerEdgeColor','b');
plot(sum_FUE_2, '--og', 'LineWidth',1.3,'MarkerSize',8, 'MarkerFaceColor','g', 'MarkerEdgeColor','b');
% plot(sum_FUE_3, '--ok', 'LineWidth',1.3,'MarkerSize',8, 'MarkerFaceColor','k', 'MarkerEdgeColor','b');
% title('SUM capacity of FUEs','FontSize',14, 'FontWeight','bold');
xlabel('FBS Numbers','FontSize',12);%, 'FontWeight','bold');
ylabel('Sum transmission rate (b/s/Hz)','FontSize',12);%, 'FontWeight','bold');
xlim([1 10]);
 ylim([0 15]);
% legend({'IL','CL', '$\rho$'},'Interpreter','latex','FontSize',12);
% legend({'\alpha_1','\alpha_2', '\alpha_3'},'FontSize',14, 'FontWeight','bold');
% legend({'CL+X_1','X_2', 'X_3', 'X_4'},'FontSize',12);%, 'FontWeight','bold');
% legend({'IL+$\mathbf{X}_2$','CL+$\mathbf{X}_3$'},'FontSize',14, 'FontWeight','bold','Interpreter','latex');
%%
figure;
hold on;
grid on;
box on;
% plot( ones(1,16)*2.0, '--k', 'LineWidth',1 );
plot(failed_FUE, '--or', 'LineWidth',1.2,'MarkerSize',8, 'MarkerFaceColor','r', 'MarkerEdgeColor','b');
plot(failed_FUE_1, '--ob', 'LineWidth',1.2,'MarkerSize',8, 'MarkerFaceColor','b', 'MarkerEdgeColor','b');
plot(failed_FUE_2, '--og', 'LineWidth',1.3,'MarkerSize',8, 'MarkerFaceColor','g', 'MarkerEdgeColor','b');
% plot(failed_FUE_3, '--ok', 'LineWidth',1.3,'MarkerSize',8, 'MarkerFaceColor','k', 'MarkerEdgeColor','b');
% title('SUM capacity of FUEs','FontSize',14, 'FontWeight','bold');
xlabel('FBS Numbers','FontSize',12);%, 'FontWeight','bold');
ylabel('Failed FUEs (%)','FontSize',12);%, 'FontWeight','bold');
xlim([1 10]);
 ylim([0 100]);
legend({'greedy','X_2', 'X_3', 'X_4'},'FontSize',12);%, 'FontWeight','bold');
% legend({'IL+$\mathbf{X}_2$','CL+$\mathbf{X}_3$'},'FontSize',14, 'FontWeight','bold','Interpreter','latex');
%%
figure;
hold on;
grid on;
box on;
% plot( ones(1,16)*2.0, '--k', 'LineWidth',1 );
plot(100*diff_FUE/0.5, '--or', 'LineWidth',1.2,'MarkerSize',8, 'MarkerFaceColor','r', 'MarkerEdgeColor','b');
plot(100*diff_FUE_1/0.5, '--ob', 'LineWidth',1.2,'MarkerSize',8, 'MarkerFaceColor','b', 'MarkerEdgeColor','b');
plot(100*diff_FUE_2/0.5, '--og', 'LineWidth',1.3,'MarkerSize',8, 'MarkerFaceColor','g', 'MarkerEdgeColor','b');
% plot(100*diff_FUE_3/0.5, '--ok', 'LineWidth',1.3,'MarkerSize',8, 'MarkerFaceColor','k', 'MarkerEdgeColor','b');
% title('SUM capacity of FUEs','FontSize',14, 'FontWeight','bold');
xlabel('FBS Numbers','FontSize',12);%, 'FontWeight','bold');
ylabel('Diff qos-C_FUE','FontSize',12);%, 'FontWeight','bold');
xlim([1 10]);
 ylim([0 100]);
legend({'greedy','X_2', 'X_3', 'X_4'},'FontSize',12);%, 'FontWeight','bold');
% legend({'IL+$\mathbf{X}_2$','CL+$\mathbf{X}_3$'},'FontSize',14, 'FontWeight','bold','Interpreter','latex');