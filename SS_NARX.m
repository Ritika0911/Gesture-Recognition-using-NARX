Person6 = importdata('Person6.xls','',3);
delay_input = 30;
delay_feedback = 15;
hidden_layer = 20;

%%
% 3 rounds of circle
circle_1 = Person6.data.Circle(:,[1,3])';
circle_2 = Person6.data.Circle(:,[5,7])';
circle_3 = Person6.data.Circle(:,[9,11])';

% 3 rounds of triangle
triangle_1 = Person6.data.Triangle(:,[1,3])';
triangle_2 = Person6.data.Triangle(:,[5,7])';
triangle_3 = Person6.data.Triangle(:,[9,11])';

% 3 rounds of left to right
horizontal_1 = Person6.data.Right(:,[1,3])';
horizontal_2 = Person6.data.Right(:,[5,7])';
horizontal_3 = Person6.data.Right(:,[9,11])';

% 3 rounds of up-down
vertical_1 = Person6.data.Down(:,[1,3])';
vertical_2 = Person6.data.Down(:,[5,7])';
vertical_3 = Person6.data.Down(:,[9,11])';

%%
% Input Data
% FOLD 1
f1_train = [circle_1 circle_2 triangle_1 triangle_2 horizontal_1 horizontal_2 vertical_1 vertical_2];
f1_test = [circle_3 triangle_3 horizontal_3 vertical_3];

% FOLD 2
f2_train = [circle_2 circle_3 triangle_2 triangle_3 horizontal_2 horizontal_3 vertical_2 vertical_3];
f2_test = [circle_1 triangle_1 horizontal_1 vertical_1];

% FOLD 3
f3_train = [circle_1 circle_3 triangle_1 triangle_3 horizontal_1 horizontal_3 vertical_1 vertical_3];
f3_test = [circle_2 triangle_2 horizontal_2 vertical_2];

%%
% targets
tar_c = [ones([1 2*length(circle_1)]) -ones([1 2*length(triangle_1)]) -ones([1 2*length(horizontal_1)]) -ones([1 2*length(vertical_1)]) ];
tar_t = [-ones([1 2*length(circle_1)]) ones([1 2*length(triangle_1)]) -ones([1 2*length(horizontal_1)]) -ones([1 2*length(vertical_1)]) ];
tar_h = [-ones([1 2*length(circle_1)]) -ones([1 2*length(triangle_1)]) ones([1 2*length(horizontal_1)]) -ones([1 2*length(vertical_1)]) ];
tar_v = [-ones([1 2*length(circle_1)]) -ones([1 2*length(triangle_1)]) -ones([1 2*length(horizontal_1)]) ones([1 2*length(vertical_1)]) ];

%%
% 3-FOLD Cross-Validation ROC
sequentialTargetC = con2seq(tar_c);
sequentialTargetT = con2seq(tar_t);
sequentialTargetH = con2seq(tar_h);
sequentialTargetV = con2seq(tar_v);

% FOLD1
sequentialTrain = con2seq(f1_train);
sequentialTest = con2seq(f1_test);

%circle network
network_circle = narxnet(1:delay_input ,1:delay_feedback ,hidden_layer ,'closed' ,'trainbr');
[Xsc,Xic,Aic,Tsc] = preparets(network_circle,sequentialTrain,{},sequentialTargetC);
network_circle.trainParam.epochs = 100;
network_circle.divideParam.trainRatio = 1;
network_circle.divideParam.valRatio = 0;
network_circle.divideParam.testRatio = 0;
network_circle.layers{2}.transferFcn = 'tansig';

%triangle network
network_triangle = narxnet(1:delay_input ,1:delay_feedback ,hidden_layer ,'closed' ,'trainbr');
[Xst,Xit,Ait,Tst] = preparets(network_triangle,sequentialTrain,{},sequentialTargetT);
network_triangle.trainParam.epochs = 100;
network_triangle.divideParam.trainRatio = 1;
network_triangle.divideParam.valRatio = 0;
network_triangle.divideParam.testRatio = 0;
network_triangle.layers{2}.transferFcn = 'tansig';

%horizontal network
network_horizontal = narxnet(1:delay_input ,1:delay_feedback ,hidden_layer ,'closed' ,'trainbr');
[Xsh,Xih,Aih,Tsh] = preparets(network_horizontal,sequentialTrain,{},sequentialTargetH);
network_horizontal.trainParam.epochs = 100;
network_horizontal.divideParam.trainRatio = 1;
network_horizontal.divideParam.valRatio = 0;
network_horizontal.divideParam.testRatio = 0;
network_horizontal.layers{2}.transferFcn = 'tansig';

%vertical network
network_vertical = narxnet(1:delay_input ,1:delay_feedback ,hidden_layer ,'closed' ,'trainbr');
[Xsv,Xiv,Aiv,Tsv] = preparets(network_vertical,sequentialTrain,{},sequentialTargetV);
network_vertical.trainParam.epochs = 100;
network_vertical.divideParam.trainRatio = 1;
network_vertical.divideParam.valRatio = 0;
network_vertical.divideParam.testRatio = 0;
network_vertical.layers{2}.transferFcn = 'tansig';

H_F1 = zeros([4 4 1]);
%CIRCLE
network_circle = init(network_circle);
network_circle = train(network_circle,Xsc,Tsc,Xic);
network_circle = closeloop(network_circle);
YC = sim(network_circle,sequentialTest);
conYC = seq2con(YC);
conYC = conYC{1};
mYC1 = mean(conYC(1:300));
mYC2 = mean(conYC(301:600));
mYC3 = mean(conYC(601:900));
mYC4 = mean(conYC(901:1200));

%TRIANGLE
network_triangle = init(network_triangle);
network_triangle = train(network_triangle,Xst,Tst,Xit);
network_triangle = closeloop(network_triangle);
YT = sim(network_triangle,sequentialTest);
conYT = seq2con(YT);
conYT = conYT{1};
mYT1 = mean(conYT(1:300));
mYT2 = mean(conYT(301:600));
mYT3 = mean(conYT(601:900));
mYT4 = mean(conYT(901:1200));

%RIGHT_LEFT
network_horizontal = init(network_horizontal);
network_horizontal = train(network_horizontal,Xsh,Tsh,Xih);
network_horizontal = closeloop(network_horizontal);
YH = sim(network_horizontal,sequentialTest);
conYH = seq2con(YH);
conYH = conYH{1};
mYH1 = mean(conYH(1:300));
mYH2 = mean(conYH(301:600));
mYH3 = mean(conYH(601:900));
mYH4 = mean(conYH(901:1200));

%UP-DOWN
network_vertical = init(network_vertical);
network_vertical = train(network_vertical,Xsv,Tsv,Xiv);
network_vertical = closeloop(network_vertical);
YV = sim(network_vertical,sequentialTest);
conYV = seq2con(YV);
conYV = conYV{1};
mYV1 = mean(conYV(1:300));
mYV2 = mean(conYV(301:600));
mYV3 = mean(conYV(601:900));
mYV4 = mean(conYV(901:1200));

H_F1(:,:,1) = [ mYC1 mYC2 mYC3 mYC4;...
    mYT1 mYT2 mYT3 mYT4;...
    mYH1 mYH2 mYH3 mYH4;...
    mYV1 mYV2 mYV3 mYV4];

network_F1 = [network_circle, network_triangle, network_horizontal, network_horizontal];

% FOLD2
sequentialTrain = con2seq(f2_train);
sequentialTest = con2seq(f2_test);

%circle network
network_circle = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsc,Xic,Aic,Tsc] = preparets(network_circle,sequentialTrain,{},sequentialTargetC);
network_circle.trainParam.epochs = 100;
network_circle.divideParam.trainRatio = 1;
network_circle.divideParam.valRatio = 0;
network_circle.divideParam.testRatio = 0;
network_circle.layers{2}.transferFcn = 'tansig';

%triangle network
network_triangle = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xst,Xit,Ait,Tst] = preparets(network_triangle,sequentialTrain,{},sequentialTargetT);
network_triangle.trainParam.epochs = 100;
network_triangle.divideParam.trainRatio = 1;
network_triangle.divideParam.valRatio = 0;
network_triangle.divideParam.testRatio = 0;
network_triangle.layers{2}.transferFcn = 'tansig';

%horizontal network
network_horizontal = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsh,Xih,Aih,Tsh] = preparets(network_horizontal,sequentialTrain,{},sequentialTargetH);
network_horizontal.trainParam.epochs = 100;
network_horizontal.divideParam.trainRatio = 1;
network_horizontal.divideParam.valRatio = 0;
network_horizontal.divideParam.testRatio = 0;
network_horizontal.layers{2}.transferFcn = 'tansig';

%vertical network
network_vertical = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsv,Xiv,Aiv,Tsv] = preparets(network_vertical,sequentialTrain,{},sequentialTargetV);
network_vertical.trainParam.epochs = 100;
network_vertical.divideParam.trainRatio = 1;
network_vertical.divideParam.valRatio = 0;
network_vertical.divideParam.testRatio = 0;
network_vertical.layers{2}.transferFcn = 'tansig';

H_F2 = zeros([4 4 1]);
%CIRCLE
network_circle = init(network_circle);
network_circle = train(network_circle,Xsc,Tsc,Xic);
network_circle = closeloop(network_circle);
YC = sim(network_circle,sequentialTest);
conYC = seq2con(YC);
conYC = conYC{1};
mYC1 = mean(conYC(1:300));
mYC2 = mean(conYC(301:600));
mYC3 = mean(conYC(601:900));
mYC4 = mean(conYC(901:1200));

%TRIANGLE
network_triangle = init(network_triangle);
network_triangle = train(network_triangle,Xst,Tst,Xit);
network_triangle = closeloop(network_triangle);
YT = sim(network_triangle,sequentialTest);
conYT = seq2con(YT);
conYT = conYT{1};
mYT1 = mean(conYT(1:300));
mYT2 = mean(conYT(301:600));
mYT3 = mean(conYT(601:900));
mYT4 = mean(conYT(901:1200));

%RIGHT_LEFT
network_horizontal = init(network_horizontal);
network_horizontal = train(network_horizontal,Xsh,Tsh,Xih);
network_horizontal = closeloop(network_horizontal);
YH = sim(network_horizontal,sequentialTest);
conYH = seq2con(YH);
conYH = conYH{1};
mYH1 = mean(conYH(1:300));
mYH2 = mean(conYH(301:600));
mYH3 = mean(conYH(601:900));
mYH4 = mean(conYH(901:1200));

%UP-DOWN
network_vertical = init(network_vertical);
network_vertical = train(network_vertical,Xsv,Tsv,Xiv);
network_vertical = closeloop(network_vertical);
YV = sim(network_vertical,sequentialTest);
conYV = seq2con(YV);
conYV = conYV{1};
mYV1 = mean(conYV(1:300));
mYV2 = mean(conYV(301:600));
mYV3 = mean(conYV(601:900));
mYV4 = mean(conYV(901:1200));

H_F2(:,:,1) = [ mYC1 mYC2 mYC3 mYC4;...
    mYT1 mYT2 mYT3 mYT4;...
    mYH1 mYH2 mYH3 mYH4;...
    mYV1 mYV2 mYV3 mYV4];

network_F2 = [network_circle, network_triangle, network_horizontal, network_horizontal];

% FOLD3
sequentialTrain = con2seq(f3_train);
sequentialTest = con2seq(f3_test);

%circle network
network_circle = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsc,Xic,Aic,Tsc] = preparets(network_circle,sequentialTrain,{},sequentialTargetC);
network_circle.trainParam.epochs = 100;
network_circle.divideParam.trainRatio = 1;
network_circle.divideParam.valRatio = 0;
network_circle.divideParam.testRatio = 0;
network_circle.layers{2}.transferFcn = 'tansig';

%triangle network
network_triangle = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xst,Xit,Ait,Tst] = preparets(network_triangle,sequentialTrain,{},sequentialTargetT);
network_triangle.trainParam.epochs = 100;
network_triangle.divideParam.trainRatio = 1;
network_triangle.divideParam.valRatio = 0;
network_triangle.divideParam.testRatio = 0;
network_triangle.layers{2}.transferFcn = 'tansig';

%horizontal network
network_horizontal = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsh,Xih,Aih,Tsh] = preparets(network_horizontal,sequentialTrain,{},sequentialTargetH);
network_horizontal.trainParam.epochs = 100;
network_horizontal.divideParam.trainRatio = 1;
network_horizontal.divideParam.valRatio = 0;
network_horizontal.divideParam.testRatio = 0;
network_horizontal.layers{2}.transferFcn = 'tansig';

%vertical network
network_vertical = narxnet(1:delay_input,1:delay_feedback,hidden_layer,'closed','trainbr');
[Xsv,Xiv,Aiv,Tsv] = preparets(network_vertical,sequentialTrain,{},sequentialTargetV);
network_vertical.trainParam.epochs = 100;
network_vertical.divideParam.trainRatio = 1;
network_vertical.divideParam.valRatio = 0;
network_vertical.divideParam.testRatio = 0;
network_vertical.layers{2}.transferFcn = 'tansig';

H_F3 = zeros([4 4 1]);
%CIRCLE
network_circle = init(network_circle);
network_circle = train(network_circle,Xsc,Tsc,Xic);
network_circle = closeloop(network_circle);
YC = sim(network_circle,sequentialTest);
conYC = seq2con(YC);
conYC = conYC{1};
mYC1 = mean(conYC(1:300));
mYC2 = mean(conYC(301:600));
mYC3 = mean(conYC(601:900));
mYC4 = mean(conYC(901:1200));

%TRIANGLE
network_triangle = init(network_triangle);
network_triangle = train(network_triangle,Xst,Tst,Xit);
network_triangle = closeloop(network_triangle);
YT = sim(network_triangle,sequentialTest);
conYT = seq2con(YT);
conYT = conYT{1};
mYT1 = mean(conYT(1:300));
mYT2 = mean(conYT(301:600));
mYT3 = mean(conYT(601:900));
mYT4 = mean(conYT(901:1200));

%RIGHT_LEFT
network_horizontal = init(network_horizontal);
network_horizontal = train(network_horizontal,Xsh,Tsh,Xih);
network_horizontal = closeloop(network_horizontal);
YH = sim(network_horizontal,sequentialTest);
conYH = seq2con(YH);
conYH = conYH{1};
mYH1 = mean(conYH(1:300));
mYH2 = mean(conYH(301:600));
mYH3 = mean(conYH(601:900));
mYH4 = mean(conYH(901:1200));

%UP-DOWN
network_vertical = init(network_vertical);
network_vertical = train(network_vertical,Xsv,Tsv,Xiv);
network_vertical = closeloop(network_vertical);
YV = sim(network_vertical,sequentialTest);
conYV = seq2con(YV);
conYV = conYV{1};
mYV1 = mean(conYV(1:300));
mYV2 = mean(conYV(301:600));
mYV3 = mean(conYV(601:900));
mYV4 = mean(conYV(901:1200));


H_F3(:,:,1) = [ mYC1 mYC2 mYC3 mYC4;...
    mYT1 mYT2 mYT3 mYT4;...
    mYH1 mYH2 mYH3 mYH4;...
    mYV1 mYV2 mYV3 mYV4];

network_F3 = [network_circle, network_triangle, network_horizontal, network_horizontal];

network_6 = [network_F1, network_F2, network_F3];
H = cat(3,H_F1, H_F2, H_F3);
ezroc3(H,[],2,'Person6',1);
filename = strcat('Person6.mat');
save(filename,'network_6');