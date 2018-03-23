%Using subject 2 for training, validation and testing
Person2 = importdata("Person2.xls",'',3);
circle_1 = Person2.data.Circle(:,[1,3])';
circle_2 = Person2.data.Circle(:,[5,7])';
circle_3 = Person2.data.Circle(:,[9,11])';
triangle_1 = Person2.data.Triangle(:,[1,3])';
triangle_2 = Person2.data.Triangle(:,[5,7])';
triangle_3 = Person2.data.Triangle(:,[9,11])';
horizontal_1 = Person2.data.Right(:,[1,3])';
horizontal_2 = Person2.data.Right(:,[5,7])';
horizontal_3 = Person2.data.Right(:,[9,11])';
vertical_1 = Person2.data.Down(:,[1,3])';
vertical_2 = Person2.data.Down(:,[5,7])';
vertical_3 = Person2.data.Down(:,[9,11])';
%%
% Training, validation and testing data setup
train_data = [circle_1 triangle_1 horizontal_1 vertical_1];
validation_data = [circle_2 triangle_2 horizontal_2 vertical_2];
test_data = [circle_3 triangle_3 horizontal_3 vertical_3];

%Changing the data from concurrent to sequential
s_train = con2seq(train_data);
s_validation = con2seq(validation_data);
s_test = con2seq(test_data);

%%
% Target signals for class/not class
tar_c = [ones([1 length(circle_1)]) -ones([1 length(triangle_1)]) -ones([1 length(horizontal_1)]) -ones([1 length(vertical_1)]) ];
tar_t = [-ones([1 length(circle_1)]) ones([1 length(triangle_1)]) -ones([1 length(horizontal_1)]) -ones([1 length(vertical_1)]) ];
tar_h = [-ones([1 length(circle_1)]) -ones([1 length(triangle_1)]) ones([1 length(horizontal_1)]) -ones([1 length(vertical_1)]) ];
tar_v = [-ones([1 length(circle_1)]) -ones([1 length(triangle_1)]) -ones([1 length(horizontal_1)]) ones([1 length(vertical_1)]) ];

%Changing the target from concurrent to sequential
s_tar_c = con2seq(tar_c);
s_tar_t = con2seq(tar_t);
s_tar_h = con2seq(tar_h);
s_tar_v = con2seq(tar_v);

for delay_input = 20:10:30
    for delay_feedback = 5:5:15
        for hidden_layer = 10:10:20
            
            %circle network
            network_c = narxnet(1:delay_input ,1:delay_feedback ,hidden_layer ,'closed' ,'trainbr');
            [Xsc, Xic, Aic, Tsc] = preparets(network_c ,s_train ,{} , s_tar_c);
            network_c.trainParam.epochs = 100;
            network_c.divideParam.trainRatio = 1;
            network_c.divideParam.valRatio = 0;
            network_c.divideParam.testRatio = 0;
            network_c.layers{2}.transferFcn = 'tansig';
            
            %triangle network
            network_t = narxnet(1:delay_input ,1:delay_feedback ,hidden_layer ,'closed' ,'trainbr');
            [Xst, Xit, Ait, Tst] = preparets(network_t ,s_train ,{} ,s_tar_t);
            network_t.trainParam.epochs = 100;
            network_t.divideParam.trainRatio = 1;
            network_t.divideParam.valRatio = 0;
            network_t.divideParam.testRatio = 0;
            network_t.layers{2}.transferFcn = 'tansig';
            
            %horizontal network
            network_h = narxnet(1:delay_input ,1:delay_feedback ,hidden_layer ,'closed' ,'trainbr');
            [Xsh, Xih, Aih, Tsh] = preparets(network_h ,s_train ,{} ,s_tar_h);
            network_h.trainParam.epochs = 100;
            network_h.divideParam.trainRatio = 1;
            network_h.divideParam.valRatio = 0;
            network_h.divideParam.testRatio = 0;
            network_h.layers{2}.transferFcn = 'tansig';
            
            %vertical network
            network_v = narxnet(1:delay_input ,1:delay_feedback ,hidden_layer ,'closed' ,'trainbr');
            [Xsv, Xiv, Aiv, Tsv] = preparets(network_v, s_train ,{} ,s_tar_v);
            network_v.trainParam.epochs = 100;
            network_v.divideParam.trainRatio = 1;
            network_v.divideParam.valRatio = 0;
            network_v.divideParam.testRatio = 0;
            network_v.layers{2}.transferFcn = 'tansig';
            
            H = zeros([4 4 5]);
            for j = 1:5
                
                %CIRCLE
                network_c = init(network_c);
                network_c = train(network_c, Xsc, Tsc, Xic, Aic);
                network_c = closeloop(network_c);
                YC = sim(network_c,s_validation);
                conYC = seq2con(YC);
                conYC = conYC{1};
                mYC1 = mean(conYC(1:300));
                mYC2 = mean(conYC(301:600));
                mYC3 = mean(conYC(601:900));
                mYC4 = mean(conYC(901:1200));
                
                %TRIANGLE
                network_t = init(network_t);
                network_t = train(network_t, Xst, Tst, Xit, Ait);
                network_t = closeloop(network_t);
                YT = sim(network_t,s_validation);
                conYT = seq2con(YT);
                conYT = conYT{1};
                mYT1 = mean(conYT(1:300));
                mYT2 = mean(conYT(301:600));
                mYT3 = mean(conYT(601:900));
                mYT4 = mean(conYT(901:1200));
                
                %RIGHT_LEFT
                network_h = init(network_h);
                network_h = train(network_h, Xsh, Tsh, Xih, Aih);
                network_h = closeloop(network_h);
                YH = sim(network_h, s_validation);
                conYH = seq2con(YH);
                conYH = conYH{1};
                mYH1 = mean(conYH(1:300));
                mYH2 = mean(conYH(301:600));
                mYH3 = mean(conYH(601:900));
                mYH4 = mean(conYH(901:1200));
                
                %UP-DOWN
                network_v = init(network_v);
                network_v = train(network_v, Xsv, Tsv, Xiv, Aiv);
                network_v = closeloop(network_v);
                YV = sim(network_v,s_validation);
                conYV = seq2con(YV);
                conYV = conYV{1};
                mYV1 = mean(conYV(1:300));
                mYV2 = mean(conYV(301:600));
                mYV3 = mean(conYV(601:900));
                mYV4 = mean(conYV(901:1200));
                
                H(:,:,j) = [ mYC1 mYC2 mYC3 mYC4;...
                    mYT1 mYT2 mYT3 mYT4;...
                    mYH1 mYH2 mYH3 mYH4;...
                    mYV1 mYV2 mYV3 mYV4];
                
            end
            network = [network_c, network_t, network_h, network_v];
            ezroc3(H,[],2,'',1);
            filename = strcat('net_d',num2str(delay_input),'_h',num2str(hidden_layer),'.mat');
            save (filename, 'network');
        end
    end
end