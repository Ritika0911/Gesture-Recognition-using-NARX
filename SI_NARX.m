Person1 = importdata('Person1.xls','',3);
Person2 = importdata('Person2.xls','',3);
Person3 = importdata('Person3.xls','',3);
Person4 = importdata('Person4.xls','',3);
Person5 = importdata('Person5.xls','',3);
Person6 = importdata('Person6.xls','',3);

%%
% Person 1
% Circle
c_11 = Person1.data.Circle(:,[1,3])';
c_21 = Person1.data.Circle(:,[5,7])';
c_31 = Person1.data.Circle(:,[9,11])';

% Triangle
t_11 = Person1.data.Triangle(:,[1,3])';
t_21 = Person1.data.Triangle(:,[5,7])';
t_31 = Person1.data.Triangle(:,[9,11])';

% Left to Right
h_11 = Person1.data.Right(:,[1,3])';
h_21 = Person1.data.Right(:,[5,7])';
h_31 = Person1.data.Right(:,[9,11])';

% Up-down
v_11 = Person1.data.Down(:,[1,3])';
v_21 = Person1.data.Down(:,[5,7])';
v_31 = Person1.data.Down(:,[9,11])';
%%
% Person 2
% Circle
c_12 = Person2.data.Circle(:,[1,3])';
c_22 = Person2.data.Circle(:,[5,7])';
c_32 = Person2.data.Circle(:,[9,11])';

% Triangle
t_12 = Person2.data.Triangle(:,[1,3])';
t_22 = Person2.data.Triangle(:,[5,7])';
t_32 = Person2.data.Triangle(:,[9,11])';

% Left to Right
h_12 = Person2.data.Right(:,[1,3])';
h_22 = Person2.data.Right(:,[5,7])';
h_32 = Person2.data.Right(:,[9,11])';

% Up-down
v_12 = Person2.data.Down(:,[1,3])';
v_22 = Person2.data.Down(:,[5,7])';
v_32 = Person2.data.Down(:,[9,11])';
%%
% Person 3
% Circle
c_13 = Person3.data.Circle(:,[1,3])';
c_23 = Person3.data.Circle(:,[5,7])';
c_33 = Person3.data.Circle(:,[9,11])';

% Triangle
t_13 = Person3.data.Triangle(:,[1,3])';
t_23 = Person3.data.Triangle(:,[5,7])';
t_33 = Person3.data.Triangle(:,[9,11])';

% Left to Right
h_13 = Person3.data.Right(:,[1,3])';
h_23 = Person3.data.Right(:,[5,7])';
h_33 = Person3.data.Right(:,[9,11])';

% Up-down
v_13 = Person3.data.Down(:,[1,3])';
v_23 = Person3.data.Down(:,[5,7])';
v_33 = Person3.data.Down(:,[9,11])';
%%
% Person 4
% Circle
c_14 = Person4.data.Circle(:,[1,3])';
c_24 = Person4.data.Circle(:,[5,7])';
c_34 = Person4.data.Circle(:,[9,11])';

% Triangle
t_14 = Person4.data.Triangle(:,[1,3])';
t_24 = Person4.data.Triangle(:,[5,7])';
t_34 = Person4.data.Triangle(:,[9,11])';

% Left to Right
h_14 = Person4.data.Right(:,[1,3])';
h_24 = Person4.data.Right(:,[5,7])';
h_34 = Person4.data.Right(:,[9,11])';

% Up-down
v_14 = Person4.data.Down(:,[1,3])';
v_24 = Person4.data.Down(:,[5,7])';
v_34 = Person4.data.Down(:,[9,11])';
%%
% Person 5
% Circle
c_15 = Person5.data.Circle(:,[1,3])';
c_25 = Person5.data.Circle(:,[5,7])';
c_35 = Person5.data.Circle(:,[9,11])';

% Triangle
t_15 = Person5.data.Triangle(:,[1,3])';
t_25 = Person5.data.Triangle(:,[5,7])';
t_35 = Person5.data.Triangle(:,[9,11])';

% Left to Right
h_15 = Person5.data.Right(:,[1,3])';
h_25 = Person5.data.Right(:,[5,7])';
h_35 = Person5.data.Right(:,[9,11])';

% Up-down
v_15 = Person5.data.Down(:,[1,3])';
v_25 = Person5.data.Down(:,[5,7])';
v_35 = Person5.data.Down(:,[9,11])';
%%
% Person 6
% Circle
c_16 = Person6.data.Circle(:,[1,3])';
c_26 = Person6.data.Circle(:,[5,7])';
c_36 = Person6.data.Circle(:,[9,11])';

% Triangle
t_16 = Person6.data.Triangle(:,[1,3])';
t_26 = Person6.data.Triangle(:,[5,7])';
t_36 = Person6.data.Triangle(:,[9,11])';

% Left to Right
h_16 = Person6.data.Right(:,[1,3])';
h_26 = Person6.data.Right(:,[5,7])';
h_36 = Person6.data.Right(:,[9,11])';

% Up-down
v_16 = Person6.data.Down(:,[1,3])';
v_26 = Person6.data.Down(:,[5,7])';
v_36 = Person6.data.Down(:,[9,11])';

%%
% Input Data Setup Section
% FOLD 1
f1_train = [c_11 c_21 c_31 t_11 t_21 t_31 h_11 h_21 h_31 v_11 v_21 v_31...
    c_12 c_22 c_32 t_12 t_22 t_32 h_12 h_22 h_32 v_12 v_22 v_32...
    c_13 c_23 c_33 t_13 t_23 t_33 h_13 h_23 h_33 v_13 v_23 v_33...
    c_14 c_24 c_34 t_14 t_24 t_34 h_14 h_24 h_34 v_14 v_24 v_34...
    c_15 c_25 c_35 t_15 t_25 t_35 h_15 h_25 h_35 v_15 v_25 v_35];

f1_test = [c_16 c_26 c_36 t_16 t_26 t_36 h_16 h_26 h_36 v_16 v_26 v_36];

% FOLD 2
f2_train = [c_11 c_21 c_31 t_11 t_21 t_31 h_11 h_21 h_31 v_11 v_21 v_31...
    c_12 c_22 c_32 t_12 t_22 t_32 h_12 h_22 h_32 v_12 v_22 v_32...
    c_13 c_23 c_33 t_13 t_23 t_33 h_13 h_23 h_33 v_13 v_23 v_33...
    c_14 c_24 c_34 t_14 t_24 t_34 h_14 h_24 h_34 v_14 v_24 v_34...
    c_16 c_26 c_36 t_16 t_26 t_36 h_16 h_26 h_36 v_16 v_26 v_36];

f2_test = [c_15 c_25 c_35 t_15 t_25 t_35 h_15 h_25 h_35 v_15 v_25 v_35];

% FOLD 3
f3_train = [c_11 c_21 c_31 t_11 t_21 t_31 h_11 h_21 h_31 v_11 v_21 v_31...
    c_12 c_22 c_32 t_12 t_22 t_32 h_12 h_22 h_32 v_12 v_22 v_32...
    c_13 c_23 c_33 t_13 t_23 t_33 h_13 h_23 h_33 v_13 v_23 v_33...
    c_15 c_25 c_35 t_15 t_25 t_35 h_15 h_25 h_35 v_15 v_25 v_35...
    c_16 c_26 c_36 t_16 t_26 t_36 h_16 h_26 h_36 v_16 v_26 v_36];

f3_test = [c_14 c_24 c_34 t_14 t_24 t_34 h_14 h_24 h_34 v_14 v_24 v_34];

% FOLD 4
f4_train = [c_11 c_21 c_31 t_11 t_21 t_31 h_11 h_21 h_31 v_11 v_21 v_31...
    c_12 c_22 c_32 t_12 t_22 t_32 h_12 h_22 h_32 v_12 v_22 v_32...
    c_14 c_24 c_34 t_14 t_24 t_34 h_14 h_24 h_34 v_14 v_24 v_34...
    c_15 c_25 c_35 t_15 t_25 t_35 h_15 h_25 h_35 v_15 v_25 v_35...
    c_16 c_26 c_36 t_16 t_26 t_36 h_16 h_26 h_36 v_16 v_26 v_36];

f4_test = [c_13 c_23 c_33 t_13 t_23 t_33 h_13 h_23 h_33 v_13 v_23 v_33];

% FOLD 5
f5_train = [c_11 c_21 c_31 t_11 t_21 t_31 h_11 h_21 h_31 v_11 v_21 v_31...
    c_13 c_23 c_33 t_13 t_23 t_33 h_13 h_23 h_33 v_13 v_23 v_33...
    c_14 c_24 c_34 t_14 t_24 t_34 h_14 h_24 h_34 v_14 v_24 v_34...
    c_15 c_25 c_35 t_15 t_25 t_35 h_15 h_25 h_35 v_15 v_25 v_35...
    c_16 c_26 c_36 t_16 t_26 t_36 h_16 h_26 h_36 v_16 v_26 v_36];

f5_test = [c_12 c_22 c_32 t_12 t_22 t_32 h_12 h_22 h_32 v_12 v_22 v_32];

% FOLD 6
f6_train = [c_12 c_22 c_32 t_12 t_22 t_32 h_12 h_22 h_32 v_12 v_22 v_32...
    c_13 c_23 c_33 t_13 t_23 t_33 h_13 h_23 h_33 v_13 v_23 v_33...
    c_14 c_24 c_34 t_14 t_24 t_34 h_14 h_24 h_34 v_14 v_24 v_34...
    c_15 c_25 c_35 t_15 t_25 t_35 h_15 h_25 h_35 v_15 v_25 v_35...
    c_16 c_26 c_36 t_16 t_26 t_36 h_16 h_26 h_36 v_16 v_26 v_36];

f6_test = [c_11 c_21 c_31 t_11 t_21 t_31 h_11 h_21 h_31 v_11 v_21 v_31];

%%
% OUTPUT DATA SETUP
TC = [ones([1 3*length(c_11)]) -ones([1 3*length(t_11)]) -ones([1 3*length(h_11)]) -ones([1 3*length(v_11)])...
    ones([1 3*length(c_12)]) -ones([1 3*length(t_12)]) -ones([1 3*length(h_12)]) -ones([1 3*length(v_12)])...
    ones([1 3*length(c_13)]) -ones([1 3*length(t_13)]) -ones([1 3*length(h_13)]) -ones([1 3*length(v_13)])...
    ones([1 3*length(c_14)]) -ones([1 3*length(t_14)]) -ones([1 3*length(h_14)]) -ones([1 3*length(v_14)])...
    ones([1 3*length(c_15)]) -ones([1 3*length(t_15)]) -ones([1 3*length(h_15)]) -ones([1 3*length(v_15)])];

TT = [-ones([1 3*length(c_11)]) ones([1 3*length(t_11)]) -ones([1 3*length(h_11)]) -ones([1 3*length(v_11)])...
    -ones([1 3*length(c_12)]) ones([1 3*length(t_12)]) -ones([1 3*length(h_12)]) -ones([1 3*length(v_12)])...
    -ones([1 3*length(c_13)]) ones([1 3*length(t_13)]) -ones([1 3*length(h_13)]) -ones([1 3*length(v_13)])...
    -ones([1 3*length(c_14)]) ones([1 3*length(t_14)]) -ones([1 3*length(h_14)]) -ones([1 3*length(v_14)])...
    -ones([1 3*length(c_15)]) ones([1 3*length(t_15)]) -ones([1 3*length(h_15)]) -ones([1 3*length(v_15)])];

TH = [-ones([1 3*length(c_11)]) -ones([1 3*length(t_11)]) ones([1 3*length(h_11)]) -ones([1 3*length(v_11)])...
    -ones([1 3*length(c_12)]) -ones([1 3*length(t_12)]) ones([1 3*length(h_12)]) -ones([1 3*length(v_12)])...
    -ones([1 3*length(c_13)]) -ones([1 3*length(t_13)]) ones([1 3*length(h_13)]) -ones([1 3*length(v_13)])...
    -ones([1 3*length(c_14)]) -ones([1 3*length(t_14)]) ones([1 3*length(h_14)]) -ones([1 3*length(v_14)])...
    -ones([1 3*length(c_15)]) -ones([1 3*length(t_15)]) ones([1 3*length(h_15)]) -ones([1 3*length(v_15)])];

TV = [-ones([1 3*length(c_11)]) -ones([1 3*length(t_11)]) -ones([1 3*length(h_11)]) ones([1 3*length(v_11)])...
    -ones([1 3*length(c_12)]) -ones([1 3*length(t_12)]) -ones([1 3*length(h_12)]) ones([1 3*length(v_12)])...
    -ones([1 3*length(c_13)]) -ones([1 3*length(t_13)]) -ones([1 3*length(h_13)]) ones([1 3*length(v_13)])...
    -ones([1 3*length(c_14)]) -ones([1 3*length(t_14)]) -ones([1 3*length(h_14)]) ones([1 3*length(v_14)])...
    -ones([1 3*length(c_15)]) -ones([1 3*length(t_15)]) -ones([1 3*length(h_15)]) ones([1 3*length(v_15)])];

T = [TC TT TH TV];

%%
delay_input = 30;
delay_feedback = 15;
hidden_layer = 20;

% FOLD 1
seqTr = con2seq(f1_train);
seqTest = con2seq(f1_test);

TC = T(1:length(f1_train));
TT = T(length(f1_train)+1  : 2*length(f1_train));
TH = T(2*length(f1_train)+1: 3*length(f1_train));
TV = T(3*length(f1_train)+1: 4*length(f1_train));

seqTC = con2seq(TC);
seqTT = con2seq(TT);
seqTH = con2seq(TH);
seqTV = con2seq(TV);

%CIRCLE
net_c = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsc,Xic,Aic,Tsc] = preparets(net_c,seqTr,{},seqTC);
net_c.trainParam.epochs = 100;               % set epoch
net_c.divideParam.trainRatio = 1;            % 100% of data for Training
net_c.divideParam.valRatio = 0;              % 0% of data for Validation
net_c.divideParam.testRatio = 0;             % 0% of data for Testing
net_c.layers{2}.transferFcn = 'tansig';

%TRIANGLE
net_t = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xst,Xit,Ait,Tst] = preparets(net_t,seqTr,{},seqTT);
net_t.trainParam.epochs = 100;               % set epoch
net_t.divideParam.trainRatio = 1;            % 100% of data for Training
net_t.divideParam.valRatio = 0;              % 0% of data for Validation
net_t.divideParam.testRatio = 0;             % 0% of data for Testing
net_t.layers{2}.transferFcn = 'tansig';

%LEFT-RIGHT
net_h = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsh,Xih,Aih,Tsh] = preparets(net_h,seqTr,{},seqTH);
net_h.trainParam.epochs = 100;               % set epoch
net_h.divideParam.trainRatio = 1;            % 100% of data for Training
net_h.divideParam.valRatio = 0;              % 0% of data for Validation
net_h.divideParam.testRatio = 0;             % 0% of data for Testing
net_h.layers{2}.transferFcn = 'tansig';

%UP-DOWN
net_v = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsv,Xiv,Aiv,Tsv] = preparets(net_v,seqTr,{},seqTV);
net_v.trainParam.epochs = 100;               % set epoch
net_v.divideParam.trainRatio = 1;            % 100% of data for Training
net_v.divideParam.valRatio = 0;              % 0% of data for Validation
net_v.divideParam.testRatio = 0;             % 0% of data for Testing
net_v.layers{2}.transferFcn = 'tansig';

H_1 = zeros([4 4 1]);
disp('Network Initilization');
%CIRCLE
net_c = init(net_c);
net_c = train(net_c,Xsc,Tsc,Xic);
net_c = closeloop(net_c);
YC = sim(net_c,seqTest);
conYC = seq2con(YC);
conYC = conYC{1};
mYC1 = mean(conYC(1:900));
mYC2 = mean(conYC(901:1800));
mYC3 = mean(conYC(1801:2700));
mYC4 = mean(conYC(2701:3600));

%TRIANGLE
net_t = init(net_t);
net_t = train(net_t,Xst,Tst,Xit);
net_t = closeloop(net_t);
YT = sim(net_t,seqTest);
conYT = seq2con(YT);
conYT = conYT{1};
mYT1 = mean(conYT(1:900));
mYT2 = mean(conYT(901:1800));
mYT3 = mean(conYT(1801:2700));
mYT4 = mean(conYT(2701:3600));

%RIGHT_LEFT
net_h = init(net_h);
net_h = train(net_h,Xsh,Tsh,Xih);
net_h = closeloop(net_h);
YH = sim(net_h,seqTest);
conYH = seq2con(YH);
conYH = conYH{1};
mYH1 = mean(conYH(1:900));
mYH2 = mean(conYH(901:1800));
mYH3 = mean(conYH(1801:2700));
mYH4 = mean(conYH(2701:3600));

%UP-DOWN
net_v = init(net_v);
net_v = train(net_v,Xsv,Tsv,Xiv);
net_v = closeloop(net_v);
YV = sim(net_v,seqTest);
conYV = seq2con(YV);
conYV = conYV{1};
mYV1 = mean(conYV(1:900));
mYV2 = mean(conYV(901:1800));
mYV3 = mean(conYV(1801:2700));
mYV4 = mean(conYV(2701:3600));

H_1(:,:,1) = [ mYC1 mYC2 mYC3 mYC4;...
    mYT1 mYT2 mYT3 mYT4;...
    mYH1 mYH2 mYH3 mYH4;...
    mYV1 mYV2 mYV3 mYV4];

network1 = [net_c, net_t, net_h, net_h];

% FOLD 2
seqTr = con2seq(f2_train);
seqTest = con2seq(f2_test);

TC = T(1:length(f2_train));
TT = T(length(f2_train)+1  : 2*length(f2_train));
TH = T(2*length(f2_train)+1: 3*length(f2_train));
TV = T(3*length(f2_train)+1: 4*length(f2_train));

seqTC = con2seq(TC);
seqTT = con2seq(TT);
seqTH = con2seq(TH);
seqTV = con2seq(TV);

%CIRCLE
net_c = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsc,Xic,Aic,Tsc] = preparets(net_c,seqTr,{},seqTC);
net_c.trainParam.epochs = 100;               % set epoch
net_c.divideParam.trainRatio = 1;            % 100% of data for Training
net_c.divideParam.valRatio = 0;              % 0% of data for Validation
net_c.divideParam.testRatio = 0;             % 0% of data for Testing
net_c.layers{2}.transferFcn = 'tansig';

%TRIANGLE
net_t = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xst,Xit,Ait,Tst] = preparets(net_t,seqTr,{},seqTT);
net_t.trainParam.epochs = 100;               % set epoch
net_t.divideParam.trainRatio = 1;            % 100% of data for Training
net_t.divideParam.valRatio = 0;              % 0% of data for Validation
net_t.divideParam.testRatio = 0;             % 0% of data for Testing
net_t.layers{2}.transferFcn = 'tansig';

%LEFT-RIGHT
net_h = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsh,Xih,Aih,Tsh] = preparets(net_h,seqTr,{},seqTH);
net_h.trainParam.epochs = 100;               % set epoch
net_h.divideParam.trainRatio = 1;            % 100% of data for Training
net_h.divideParam.valRatio = 0;              % 0% of data for Validation
net_h.divideParam.testRatio = 0;             % 0% of data for Testing
net_h.layers{2}.transferFcn = 'tansig';

%UP-DOWN
net_v = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsv,Xiv,Aiv,Tsv] = preparets(net_v,seqTr,{},seqTV);
net_v.trainParam.epochs = 100;               % set epoch
net_v.divideParam.trainRatio = 1;            % 100% of data for Training
net_v.divideParam.valRatio = 0;              % 0% of data for Validation
net_v.divideParam.testRatio = 0;             % 0% of data for Testing
net_v.layers{2}.transferFcn = 'tansig';

H_2 = zeros([4 4 1]);
disp('Network Initilization');
%CIRCLE
net_c = init(net_c);
net_c = train(net_c,Xsc,Tsc,Xic);
net_c = closeloop(net_c);
YC = sim(net_c,seqTest);
conYC = seq2con(YC);
conYC = conYC{1};
mYC1 = mean(conYC(1:900));
mYC2 = mean(conYC(901:1800));
mYC3 = mean(conYC(1801:2700));
mYC4 = mean(conYC(2701:3600));

%TRIANGLE
net_t = init(net_t);
net_t = train(net_t,Xst,Tst,Xit);
net_t = closeloop(net_t);
YT = sim(net_t,seqTest);
conYT = seq2con(YT);
conYT = conYT{1};
mYT1 = mean(conYT(1:900));
mYT2 = mean(conYT(901:1800));
mYT3 = mean(conYT(1801:2700));
mYT4 = mean(conYT(2701:3600));

%RIGHT_LEFT
net_h = init(net_h);
net_h = train(net_h,Xsh,Tsh,Xih);
net_h = closeloop(net_h);
YH = sim(net_h,seqTest);
conYH = seq2con(YH);
conYH = conYH{1};
mYH1 = mean(conYH(1:900));
mYH2 = mean(conYH(901:1800));
mYH3 = mean(conYH(1801:2700));
mYH4 = mean(conYH(2701:3600));

%UP-DOWN
net_v = init(net_v);
net_v = train(net_v,Xsv,Tsv,Xiv);
net_v = closeloop(net_v);
YV = sim(net_v,seqTest);
conYV = seq2con(YV);
conYV = conYV{1};
mYV1 = mean(conYV(1:900));
mYV2 = mean(conYV(901:1800));
mYV3 = mean(conYV(1801:2700));
mYV4 = mean(conYV(2701:3600));

H_2(:,:,1) = [ mYC1 mYC2 mYC3 mYC4;...
    mYT1 mYT2 mYT3 mYT4;...
    mYH1 mYH2 mYH3 mYH4;...
    mYV1 mYV2 mYV3 mYV4];

network2 = [net_c, net_t, net_h, net_h];

% FOLD 3
seqTr = con2seq(f3_train);
seqTest = con2seq(f3_test);

TC = T(1:length(f3_train));
TT = T(length(f3_train)+1  : 2*length(f3_train));
TH = T(2*length(f3_train)+1: 3*length(f3_train));
TV = T(3*length(f3_train)+1: 4*length(f3_train));

seqTC = con2seq(TC);
seqTT = con2seq(TT);
seqTH = con2seq(TH);
seqTV = con2seq(TV);

%CIRCLE
net_c = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsc,Xic,Aic,Tsc] = preparets(net_c,seqTr,{},seqTC);
net_c.trainParam.epochs = 100;               % set epoch
net_c.divideParam.trainRatio = 1;            % 100% of data for Training
net_c.divideParam.valRatio = 0;              % 0% of data for Validation
net_c.divideParam.testRatio = 0;             % 0% of data for Testing
net_c.layers{2}.transferFcn = 'tansig';

%TRIANGLE
net_t = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xst,Xit,Ait,Tst] = preparets(net_t,seqTr,{},seqTT);
net_t.trainParam.epochs = 100;               % set epoch
net_t.divideParam.trainRatio = 1;            % 100% of data for Training
net_t.divideParam.valRatio = 0;              % 0% of data for Validation
net_t.divideParam.testRatio = 0;             % 0% of data for Testing
net_t.layers{2}.transferFcn = 'tansig';

%LEFT-RIGHT
net_h = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsh,Xih,Aih,Tsh] = preparets(net_h,seqTr,{},seqTH);
net_h.trainParam.epochs = 100;               % set epoch
net_h.divideParam.trainRatio = 1;            % 100% of data for Training
net_h.divideParam.valRatio = 0;              % 0% of data for Validation
net_h.divideParam.testRatio = 0;             % 0% of data for Testing
net_h.layers{2}.transferFcn = 'tansig';

%UP-DOWN
net_v = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsv,Xiv,Aiv,Tsv] = preparets(net_v,seqTr,{},seqTV);
net_v.trainParam.epochs = 100;               % set epoch
net_v.divideParam.trainRatio = 1;            % 100% of data for Training
net_v.divideParam.valRatio = 0;              % 0% of data for Validation
net_v.divideParam.testRatio = 0;             % 0% of data for Testing
net_v.layers{2}.transferFcn = 'tansig';

H_3 = zeros([4 4 1]);
disp('Network Initilization');
%CIRCLE
net_c = init(net_c);
net_c = train(net_c,Xsc,Tsc,Xic);
net_c = closeloop(net_c);
YC = sim(net_c,seqTest);
conYC = seq2con(YC);
conYC = conYC{1};
mYC1 = mean(conYC(1:900));
mYC2 = mean(conYC(901:1800));
mYC3 = mean(conYC(1801:2700));
mYC4 = mean(conYC(2701:3600));

%TRIANGLE
net_t = init(net_t);
net_t = train(net_t,Xst,Tst,Xit);
net_t = closeloop(net_t);
YT = sim(net_t,seqTest);
conYT = seq2con(YT);
conYT = conYT{1};
mYT1 = mean(conYT(1:900));
mYT2 = mean(conYT(901:1800));
mYT3 = mean(conYT(1801:2700));
mYT4 = mean(conYT(2701:3600));

%RIGHT_LEFT
net_h = init(net_h);
net_h = train(net_h,Xsh,Tsh,Xih);
net_h = closeloop(net_h);
YH = sim(net_h,seqTest);
conYH = seq2con(YH);
conYH = conYH{1};
mYH1 = mean(conYH(1:900));
mYH2 = mean(conYH(901:1800));
mYH3 = mean(conYH(1801:2700));
mYH4 = mean(conYH(2701:3600));

%UP-DOWN
net_v = init(net_v);
net_v = train(net_v,Xsv,Tsv,Xiv);
net_v = closeloop(net_v);
YV = sim(net_v,seqTest);
conYV = seq2con(YV);
conYV = conYV{1};
mYV1 = mean(conYV(1:900));
mYV2 = mean(conYV(901:1800));
mYV3 = mean(conYV(1801:2700));
mYV4 = mean(conYV(2701:3600));

H_3(:,:,1) = [ mYC1 mYC2 mYC3 mYC4;...
    mYT1 mYT2 mYT3 mYT4;...
    mYH1 mYH2 mYH3 mYH4;...
    mYV1 mYV2 mYV3 mYV4];

network3 = [net_c, net_t, net_h, net_h];

% FOLD 4
seqTr = con2seq(f4_train);
seqTest = con2seq(f4_test);

TC = T(1:length(f4_train));
TT = T(length(f4_train)+1  : 2*length(f4_train));
TH = T(2*length(f4_train)+1: 3*length(f4_train));
TV = T(3*length(f4_train)+1: 4*length(f4_train));

seqTC = con2seq(TC);
seqTT = con2seq(TT);
seqTH = con2seq(TH);
seqTV = con2seq(TV);

%CIRCLE
net_c = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsc,Xic,Aic,Tsc] = preparets(net_c,seqTr,{},seqTC);
net_c.trainParam.epochs = 100;               % set epoch
net_c.divideParam.trainRatio = 1;            % 100% of data for Training
net_c.divideParam.valRatio = 0;              % 0% of data for Validation
net_c.divideParam.testRatio = 0;             % 0% of data for Testing
net_c.layers{2}.transferFcn = 'tansig';

%TRIANGLE
net_t = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xst,Xit,Ait,Tst] = preparets(net_t,seqTr,{},seqTT);
net_t.trainParam.epochs = 100;               % set epoch
net_t.divideParam.trainRatio = 1;            % 100% of data for Training
net_t.divideParam.valRatio = 0;              % 0% of data for Validation
net_t.divideParam.testRatio = 0;             % 0% of data for Testing
net_t.layers{2}.transferFcn = 'tansig';

%LEFT-RIGHT
net_h = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsh,Xih,Aih,Tsh] = preparets(net_h,seqTr,{},seqTH);
net_h.trainParam.epochs = 100;               % set epoch
net_h.divideParam.trainRatio = 1;            % 100% of data for Training
net_h.divideParam.valRatio = 0;              % 0% of data for Validation
net_h.divideParam.testRatio = 0;             % 0% of data for Testing
net_h.layers{2}.transferFcn = 'tansig';

%UP-DOWN
net_v = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsv,Xiv,Aiv,Tsv] = preparets(net_v,seqTr,{},seqTV);
net_v.trainParam.epochs = 100;               % set epoch
net_v.divideParam.trainRatio = 1;            % 100% of data for Training
net_v.divideParam.valRatio = 0;              % 0% of data for Validation
net_v.divideParam.testRatio = 0;             % 0% of data for Testing
net_v.layers{2}.transferFcn = 'tansig';

H_4 = zeros([4 4 1]);
disp('Network Initilization');
%CIRCLE
net_c = init(net_c);
net_c = train(net_c,Xsc,Tsc,Xic);
net_c = closeloop(net_c);
YC = sim(net_c,seqTest);
conYC = seq2con(YC);
conYC = conYC{1};
mYC1 = mean(conYC(1:900));
mYC2 = mean(conYC(901:1800));
mYC3 = mean(conYC(1801:2700));
mYC4 = mean(conYC(2701:3600));

%TRIANGLE
net_t = init(net_t);
net_t = train(net_t,Xst,Tst,Xit);
net_t = closeloop(net_t);
YT = sim(net_t,seqTest);
conYT = seq2con(YT);
conYT = conYT{1};
mYT1 = mean(conYT(1:900));
mYT2 = mean(conYT(901:1800));
mYT3 = mean(conYT(1801:2700));
mYT4 = mean(conYT(2701:3600));

%RIGHT_LEFT
net_h = init(net_h);
net_h = train(net_h,Xsh,Tsh,Xih);
net_h = closeloop(net_h);
YH = sim(net_h,seqTest);
conYH = seq2con(YH);
conYH = conYH{1};
mYH1 = mean(conYH(1:900));
mYH2 = mean(conYH(901:1800));
mYH3 = mean(conYH(1801:2700));
mYH4 = mean(conYH(2701:3600));

%UP-DOWN
net_v = init(net_v);
net_v = train(net_v,Xsv,Tsv,Xiv);
net_v = closeloop(net_v);
YV = sim(net_v,seqTest);
conYV = seq2con(YV);
conYV = conYV{1};
mYV1 = mean(conYV(1:900));
mYV2 = mean(conYV(901:1800));
mYV3 = mean(conYV(1801:2700));
mYV4 = mean(conYV(2701:3600));

H_4(:,:,1) = [ mYC1 mYC2 mYC3 mYC4;...
    mYT1 mYT2 mYT3 mYT4;...
    mYH1 mYH2 mYH3 mYH4;...
    mYV1 mYV2 mYV3 mYV4];

network4 = [net_c, net_t, net_h, net_h];

% FOLD 5
seqTr = con2seq(f5_train);
seqTest = con2seq(f5_test);

TC = T(1:length(f5_train));
TT = T(length(f5_train)+1  : 2*length(f5_train));
TH = T(2*length(f5_train)+1: 3*length(f5_train));
TV = T(3*length(f5_train)+1: 4*length(f5_train));

seqTC = con2seq(TC);
seqTT = con2seq(TT);
seqTH = con2seq(TH);
seqTV = con2seq(TV);

%CIRCLE
net_c = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsc,Xic,Aic,Tsc] = preparets(net_c,seqTr,{},seqTC);
net_c.trainParam.epochs = 100;               % set epoch
net_c.divideParam.trainRatio = 1;            % 100% of data for Training
net_c.divideParam.valRatio = 0;              % 0% of data for Validation
net_c.divideParam.testRatio = 0;             % 0% of data for Testing
net_c.layers{2}.transferFcn = 'tansig';

%TRIANGLE
net_t = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xst,Xit,Ait,Tst] = preparets(net_t,seqTr,{},seqTT);
net_t.trainParam.epochs = 100;               % set epoch
net_t.divideParam.trainRatio = 1;            % 100% of data for Training
net_t.divideParam.valRatio = 0;              % 0% of data for Validation
net_t.divideParam.testRatio = 0;             % 0% of data for Testing
net_t.layers{2}.transferFcn = 'tansig';

%LEFT-RIGHT
net_h = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsh,Xih,Aih,Tsh] = preparets(net_h,seqTr,{},seqTH);
net_h.trainParam.epochs = 100;               % set epoch
net_h.divideParam.trainRatio = 1;            % 100% of data for Training
net_h.divideParam.valRatio = 0;              % 0% of data for Validation
net_h.divideParam.testRatio = 0;             % 0% of data for Testing
net_h.layers{2}.transferFcn = 'tansig';

%UP-DOWN
net_v = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsv,Xiv,Aiv,Tsv] = preparets(net_v,seqTr,{},seqTV);
net_v.trainParam.epochs = 100;               % set epoch
net_v.divideParam.trainRatio = 1;            % 100% of data for Training
net_v.divideParam.valRatio = 0;              % 0% of data for Validation
net_v.divideParam.testRatio = 0;             % 0% of data for Testing
net_v.layers{2}.transferFcn = 'tansig';

H_5 = zeros([4 4 1]);
disp('Network Initilization');
%CIRCLE
net_c = init(net_c);
net_c = train(net_c,Xsc,Tsc,Xic);
net_c = closeloop(net_c);
YC = sim(net_c,seqTest);
conYC = seq2con(YC);
conYC = conYC{1};
mYC1 = mean(conYC(1:900));
mYC2 = mean(conYC(901:1800));
mYC3 = mean(conYC(1801:2700));
mYC4 = mean(conYC(2701:3600));

%TRIANGLE
net_t = init(net_t);
net_t = train(net_t,Xst,Tst,Xit);
net_t = closeloop(net_t);
YT = sim(net_t,seqTest);
conYT = seq2con(YT);
conYT = conYT{1};
mYT1 = mean(conYT(1:900));
mYT2 = mean(conYT(901:1800));
mYT3 = mean(conYT(1801:2700));
mYT4 = mean(conYT(2701:3600));

%RIGHT_LEFT
net_h = init(net_h);
net_h = train(net_h,Xsh,Tsh,Xih);
net_h = closeloop(net_h);
YH = sim(net_h,seqTest);
conYH = seq2con(YH);
conYH = conYH{1};
mYH1 = mean(conYH(1:900));
mYH2 = mean(conYH(901:1800));
mYH3 = mean(conYH(1801:2700));
mYH4 = mean(conYH(2701:3600));

%UP-DOWN
net_v = init(net_v);
net_v = train(net_v,Xsv,Tsv,Xiv);
net_v = closeloop(net_v);
YV = sim(net_v,seqTest);
conYV = seq2con(YV);
conYV = conYV{1};
mYV1 = mean(conYV(1:900));
mYV2 = mean(conYV(901:1800));
mYV3 = mean(conYV(1801:2700));
mYV4 = mean(conYV(2701:3600));


H_5(:,:,1) = [ mYC1 mYC2 mYC3 mYC4;...
    mYT1 mYT2 mYT3 mYT4;...
    mYH1 mYH2 mYH3 mYH4;...
    mYV1 mYV2 mYV3 mYV4];

network5 = [net_c, net_t, net_h, net_h];

% FOLD 6
seqTr = con2seq(f6_train);
seqTest = con2seq(f6_test);

TC = T(1:length(f6_train));
TT = T(length(f6_train)+1  : 2*length(f6_train));
TH = T(2*length(f6_train)+1: 3*length(f6_train));
TV = T(3*length(f6_train)+1: 4*length(f6_train));

seqTC = con2seq(TC);
seqTT = con2seq(TT);
seqTH = con2seq(TH);
seqTV = con2seq(TV);

%CIRCLE
net_c = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsc,Xic,Aic,Tsc] = preparets(net_c,seqTr,{},seqTC);
net_c.trainParam.epochs = 100;               % set epoch
net_c.divideParam.trainRatio = 1;            % 100% of data for Training
net_c.divideParam.valRatio = 0;              % 0% of data for Validation
net_c.divideParam.testRatio = 0;             % 0% of data for Testing
net_c.layers{2}.transferFcn = 'tansig';

%TRIANGLE
net_t = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xst,Xit,Ait,Tst] = preparets(net_t,seqTr,{},seqTT);
net_t.trainParam.epochs = 100;               % set epoch
net_t.divideParam.trainRatio = 1;            % 100% of data for Training
net_t.divideParam.valRatio = 0;              % 0% of data for Validation
net_t.divideParam.testRatio = 0;             % 0% of data for Testing
net_t.layers{2}.transferFcn = 'tansig';

%LEFT-RIGHT
net_h = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsh,Xih,Aih,Tsh] = preparets(net_h,seqTr,{},seqTH);
net_h.trainParam.epochs = 100;               % set epoch
net_h.divideParam.trainRatio = 1;            % 100% of data for Training
net_h.divideParam.valRatio = 0;              % 0% of data for Validation
net_h.divideParam.testRatio = 0;             % 0% of data for Testing
net_h.layers{2}.transferFcn = 'tansig';

%UP-DOWN
net_v = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsv,Xiv,Aiv,Tsv] = preparets(net_v,seqTr,{},seqTV);
net_v.trainParam.epochs = 100;               % set epoch
net_v.divideParam.trainRatio = 1;            % 100% of data for Training
net_v.divideParam.valRatio = 0;              % 0% of data for Validation
net_v.divideParam.testRatio = 0;             % 0% of data for Testing
net_v.layers{2}.transferFcn = 'tansig';

H_6 = zeros([4 4 1]);
disp('Network Initilization');
%CIRCLE
net_c = init(net_c);
net_c = train(net_c,Xsc,Tsc,Xic);
net_c = closeloop(net_c);
YC = sim(net_c,seqTest);
conYC = seq2con(YC);
conYC = conYC{1};
mYC1 = mean(conYC(1:900));
mYC2 = mean(conYC(901:1800));
mYC3 = mean(conYC(1801:2700));
mYC4 = mean(conYC(2701:3600));

%TRIANGLE
net_t = init(net_t);
net_t = train(net_t,Xst,Tst,Xit);
net_t = closeloop(net_t);
YT = sim(net_t,seqTest);
conYT = seq2con(YT);
conYT = conYT{1};
mYT1 = mean(conYT(1:900));
mYT2 = mean(conYT(901:1800));
mYT3 = mean(conYT(1801:2700));
mYT4 = mean(conYT(2701:3600));

%RIGHT_LEFT
net_h = init(net_h);
net_h = train(net_h,Xsh,Tsh,Xih);
net_h = closeloop(net_h);
YH = sim(net_h,seqTest);
conYH = seq2con(YH);
conYH = conYH{1};
mYH1 = mean(conYH(1:900));
mYH2 = mean(conYH(901:1800));
mYH3 = mean(conYH(1801:2700));
mYH4 = mean(conYH(2701:3600));

%UP-DOWN
net_v = init(net_v);
net_v = train(net_v,Xsv,Tsv,Xiv);
net_v = closeloop(net_v);
YV = sim(net_v,seqTest);
conYV = seq2con(YV);
conYV = conYV{1};
mYV1 = mean(conYV(1:900));
mYV2 = mean(conYV(901:1800));
mYV3 = mean(conYV(1801:2700));
mYV4 = mean(conYV(2701:3600));


H_6(:,:,1) = [ mYC1 mYC2 mYC3 mYC4;...
    mYT1 mYT2 mYT3 mYT4;...
    mYH1 mYH2 mYH3 mYH4;...
    mYV1 mYV2 mYV3 mYV4];

network6 = [net_c, net_t, net_h, net_h];

ezroc3(cat(3, H_1, H_2, H_3, H_4, H_5, H_6),[],2,'Subject Independent',1);