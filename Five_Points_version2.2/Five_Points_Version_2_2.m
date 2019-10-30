%% ***************************************************************
%                               五子棋
% 0.   打开文件夹，运行文件 Five_Points_Version_2_2.m ;
% 1.   每次游戏之前，程序会提示输入玩家名字，默认为"Yjbpyjb",置则空为“Girl”;
% 2.   单击“开始”按钮方可进入游戏;
% 3.   红色棋子代表玩家，绿色棋子代表电脑;
% 4.   粉红提示玩家的最近落子，蓝色提示电脑的最近落子;
% 5.   游戏设置三个等级，Smart以攻为主，Idiot以防为主，Ordinary严防;
% 6.   未分胜负之前，不允许中途退出游戏，除非玩家确定“认输”;
% 7.   退出游戏必须单击“退出”按钮，而不能点击figure窗口的关闭按钮;
% 8.   电脑思考时间会比较慢，视电脑配置而定（Smart级别最慢单步不超过十秒钟）;
% 9.   游戏愉快！
%                                                                   Chen Le
%                                                        May 1, 2012 @ NCRL
%                                                     chenle1991@seu.edu.cn
%% ***************************************************************

clc;close;clear
available_points = Get_available_points;
%% 玩家信息初始化
load first_time_play.mat
if first_time_play < 3
    dos('start Readme.txt');
    first_time_play = first_time_play + 1;
    save first_time_play.mat first_time_play
end
options.WindowStyle = 'normal';
options.FontSize = 40;
player_r = inputdlg(['What' '''s your name?  '],'Player Name',1,{'Yjbpyjb','hsv'},options);
if isempty(player_r)
    player_r = 'Girl';
end
player_g = 'Chen Le ';
score_g = 0;
score_r = 0;

chessboard(player_r,player_g,score_g,score_r)
str = {'Smart','Ordinary','Idiot'};
mode = listdlg('PromptString','Difficulty:','SelectionMode','single','ListString',str,'ListSize',[160 50]);
if isempty(mode)
    mode = 1;
end

Quit = 0;
while Quit ~= 1
    %% 下棋
    Boy_Step_Set  = zeros(113,2);
    Girl_Step_Set = zeros(113,2);
    GameOver = 0;
    ButtonDown = 0;
    flag = 1;
    isPlaying = 0;
    Current_Step = [3.5409   15.9342];
    Index_Boy = 1;
    Index_Girl = 1;
    load available_points.mat
    while GameOver ~= 1
        while 1
            pause(0.00001)
            set(gcf,'WindowButtonDownFcn','ButtonDown = 1;');
            if ButtonDown == 1
                Current_Step = get(gca,'CurrentPoint');
                ButtonDown = 0;
                break;
            end
        end
%         if waitforbuttonpress == 0
%             Current_Step = get(gca,'CurrentPoint');
%         end
        if abs(Current_Step(1,1) - 3.0269) <= 1 && abs(Current_Step(1,2) - 0.0309) <= 0.3           %开始
           
            isPlaying = 1;
            if flag == 1                
                chessboard(player_r,player_g,score_g,score_r)                                   % 初始化棋盘
                First_go = questdlg('Will you go first? ','Hello! ','Sure','No','No');
                %% 第一步棋
                if strcmp(First_go(1:2),'No')                                   % Boy 的第一步棋 随机下
                    Boy_Step_Set(1,:) = randi([7,9],1,2);
                    BoyPlay(Boy_Step_Set(1,:),[],1);
                    available_points = available_points_update(available_points,Boy_Step_Set(1,:));

                    Boy_Turn = 0;
                    Index_Boy = Index_Boy + 1;
                end
                while 1                                                         % Girl的第一步棋
                    pause(0.00001)
                    set(gca,'ButtonDownFcn','ButtonDown = 1;');
                    if ButtonDown == 1
                        ButtonDown = 0;
                        Current_Step = get(gca,'CurrentPoint');
                        if Current_Step(1,1) - 0.9 >= 0 && Current_Step(1,1) <= 15.1 && Current_Step(1,2) - 0.9 >= 0 && Current_Step(1,2) <= 15.1
                            GirlPlay(Current_Step(1,1:2),[],1);
                            Boy_Turn = 1;
                            Girl_Step_Set(1,:) = round(Current_Step(1,1:2));
                            available_points = available_points_update(available_points,Girl_Step_Set(1,:));

                            Index_Girl = Index_Girl + 1;
                            break;
                        end
                    end
                end
            else
                msgbox(['Con ''' 't you be more careful ??? ']);
                Current_Step = [3.5409   15.9342];
            end
            flag = 0;
        end
        if abs(Current_Step(1,1) - 8.0569) <= 1 && abs(Current_Step(1,2) - 0.0309) <= 0.3                   %认输
            if isPlaying == 1;
                Surrender = questdlg('Are you sure ? ','Surrender ','Yes','No','Yes');
                if ~strcmp(Surrender(1:2),'No')
                    msgbox([player_g 'is the winner']);                                         %%%%%%%%%%%%%%%%%%%%%%%
                    GameOver = 1;
                    flag = 1;
                    score_g = score_g + 1;
                    if score_g > 10
                        text(19.7,2.4,' +1','FontSize',22,'Color','g');
                    else
                        text(19.6,2.4,'+1','FontSize',22,'Color','g');
                    end
                    Current_Step = [3.5409   15.9342];
                    break;
                else
                    Current_Step = [3.5409   15.9342];
                end
            else
                msgbox('Please start the game first ! ');
                Current_Step = [3.5409   15.9342];
            end
        end
        if abs(Current_Step(1,1) - 13.0569) <= 1 && abs(Current_Step(1,2) - 0.0309) <= 0.3  % 退出
            if  flag == 1
                GameOver = 1;
                Quit = 1;
                close all
                break;
            else
                msgbox('How can you do like this! ');
                Current_Step = [3.5409   15.9342]; 
            end
        end
           
        if Current_Step(1,1) - 0.9 >= 0 && Current_Step(1,1) <= 15.1 && Current_Step(1,2) - 0.9 >= 0 && Current_Step(1,2) <= 15.1 && isPlaying % 下棋

            if ~is_existed(Current_Step(1,1:2),[Girl_Step_Set;Boy_Step_Set]) && Boy_Turn == 0       %% Girl下棋
                Girl_Step_Set(Index_Girl,:) = round(Current_Step(1,1:2));
                if Index_Girl >= 2
                    GirlPlay(Girl_Step_Set(Index_Girl - 1,:));
                end
                GirlPlay(Girl_Step_Set(Index_Girl,:),[],1);
                available_points = available_points_update(available_points,Girl_Step_Set(Index_Girl,:));
                Boy_Turn = 1;
                Current_Step = [3.5409   15.9342]; 
                Index_Girl = Index_Girl + 1;
                if is_win(Girl_Step_Set)                                 % 判断是否五连珠
                    msgbox([player_r 'is the winner']);                    
                    GameOver = 1;
                    score_r = score_r + 1;
                    if score_r > 10
                        text(19.7,9.4,' +1','FontSize',22,'Color','r');
                    else
                        text(19.6,9.4,'+1','FontSize',22,'Color','r');
                    end
                    isPlaying = 0;
                    break;
                end
            end
            %% 主要部分  Boy 思考如何下棋
            if Boy_Turn == 1                        % Boy下棋
                tic                
                success = 0;
                while success == 0                                        
                    if Index_Boy == 1
                        break;
                    end
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Boy 5   连 珠   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    if Index_Boy >= 4
                        for index = 1:size(available_points,1)
                            temp = available_points(index,:);
                            if  is_win([Boy_Step_Set;temp])
                                'Boy 5   连 珠'
                                Boy_Step_Set(Index_Boy,:) = temp;
                                success = 1;
                                break;
                            end
                        end
                        if success == 1
                            break;
                        end
                    end
                    
                    
                    for index = 1:size(available_points,1)
                        temp = available_points(index,:);
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Girl  5  连 珠   %%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        if is_win([Girl_Step_Set;temp])
                            'Girl  5连珠'
                            Boy_Step_Set(Index_Boy,:) = temp;
                            success = 1;
                            break;
                        end
                    end

                    if success == 1
                        break;
                    end

                    if Index_Boy >= 3
                        
                        for index = 1:size(available_points,1)
                            temp = available_points(index,:);
                            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Boy  活4   连 珠   %%%%%%%%%%%%%%%%%%%%%%%%%%%%
                            if is_huo4([Boy_Step_Set;temp],Girl_Step_Set)
                                'Boy 活4'
                                Boy_Step_Set(Index_Boy,:) = temp;
                                success = 1;
                                break;
                            end
                        end
                        
                        if success == 1
                            break;
                        end
                        
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Girl已经存在两个活3   连 珠   %%%%%%%%%%%%%%%%%%%%%%%%%%%%                 
                        if is_double_huo3([0 0],Girl_Step_Set,Boy_Step_Set)       
                            'Girl已经存在两个活3'
%                             [is_mian5_flag is_mian5_temp] = is_mian5(available_points,Girl_Step_Set,Boy_Step_Set);
%                             if  is_huo4([temp;Girl_Step_Set],Boy_Step_Set) && is_mian5_flag
%                                 Boy_Step_Set(Index_Boy,:) = is_mian5_temp;
%                                 success = 1;
%                                 break;
%                             end
%                             
                            for index = 1:size(available_points,1)
                                temp = available_points(index,:);
                                if   is_huo4([temp;Girl_Step_Set],Boy_Step_Set) && ...
                                   ( is_mian4([temp;Boy_Step_Set],Girl_Step_Set) || is_special_mian4(temp,Boy_Step_Set,Girl_Step_Set) || is_mian5(available_points,[Girl_Step_Set;temp],Boy_Step_Set))
                                    Boy_Step_Set(Index_Boy,:) = temp;
                                    success = 1;
                                    break;
                                end
                            end
                            
%                             if is_mian5_flag
%                                 Boy_Step_Set(Index_Boy,:) = is_mian5_temp;
%                                 success = 1;
%                                 break;
%                             end
                                
                            for index = 1:size(available_points,1)
                                temp = available_points(index,:);
                                if  is_mian4([temp;Boy_Step_Set],Girl_Step_Set) || is_special_mian4(temp,Boy_Step_Set,Girl_Step_Set) || is_mian5(available_points,[Girl_Step_Set;temp],Boy_Step_Set)
                                    Boy_Step_Set(Index_Boy,:) = temp;
                                    success = 1;
                                    break;
                                end
                            end
                        end
                        
                        if success == 1
                            break;
                        end
                        
                        for index = 1:size(available_points,1)
                            temp = available_points(index,:);
                            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Girl  活4   连 珠   %%%%%%%%%%%%%%%%%%%%%%%%%%%%
                            if is_huo4([Girl_Step_Set;temp],Boy_Step_Set)
                                'Girl 活4'
                                Boy_Step_Set(Index_Boy,:) = temp;
                                success = 1;
                                break;
                            end
                        end
                        
                        if success == 1
                            break;
                        end
                        
                        for index = 1:size(available_points,1)
                            temp = available_points(index,:);
                            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Boy  有空格的 活4   连 珠   %%%%%%%%%%%%%%%%%%%%%%%%%%%%
                            if is_special_huo4(temp,Boy_Step_Set,Girl_Step_Set)
                                'Boy  有空格的 活4'
                                Boy_Step_Set(Index_Boy,:) = temp;
                                success = 1;
                                break;
                            end
                        end
                        
                        if success == 1
                            break;
                        end
                        
                        for index = 1:size(available_points,1)
                            temp = available_points(index,:);
                            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Girl 有空格的 活4   连 珠   %%%%%%%%%%%%%%%%%%%%%%%%%%%%
                            if is_special_huo4(temp,Girl_Step_Set,Boy_Step_Set)
                                'Girl  有空格的 活4'
                                Boy_Step_Set(Index_Boy,:) = temp;
                                success = 1;
                                break;
                            end
                        end
                        
                        if success == 1
                            break;
                        end
                        
                        for index = 1:size(available_points,1)
                            temp = available_points(index,:);
                            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Boy   眠4 且 活3  连 珠   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                            if is_mian4_and_huo3(temp,Boy_Step_Set,Girl_Step_Set)
                                'Boy 眠4且活3 或者 两个眠4'
                                Boy_Step_Set(Index_Boy,:) = temp;
                                success = 1;
                                break;
                            end
                        end
                        if success == 1
                            break;
                        end
                        
                        for index = 1:size(available_points,1)
                            temp = available_points(index,:);
                            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Girl   眠4 且 活3  连 珠   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                            if is_mian4_and_huo3(temp,Girl_Step_Set,Boy_Step_Set)
                                'Girl 眠4且活3 或者 两个眠4'
                                Boy_Step_Set(Index_Boy,:) = temp;
                                success = 1;
                                break;
                            end
                        end
                        if success == 1
                            break;
                        end
                        
                        for index = 1:size(available_points,1)
                            temp = available_points(index,:);
                            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Boy   两个活3 连 珠   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                            if  is_double_huo3(temp,Boy_Step_Set,Girl_Step_Set)
                                'Boy 两个活3'
                                Boy_Step_Set(Index_Boy,:) = temp;
                                success = 1;
                                break;
                            end
                        end
                        if success == 1
                            break;
                        end
                                                
                        
                        for index = 1:size(available_points,1)
                            temp = available_points(index,:);
                            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Girl   两个活3 连 珠   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                            if  is_double_huo3(temp,Girl_Step_Set,Boy_Step_Set)
                                'Girl 两个活3'
                                Boy_Step_Set(Index_Boy,:) = temp;
                                success = 1;
                                break;
                            end
                        end
                        if success == 1
                            break;
                        end
                    end
                    
                    if mode == 2 && Index_Boy >= 5
                        %%%%%%%%%%%%%%%%%%%%%   Girl  已经存在两个眠3   连 珠   %%%%%%% 仅在 difficult mode 执行  %%%%%%%%
                        [is_double_mian3_flag temp] = is_double_mian3(available_points,Girl_Step_Set,Boy_Step_Set);                            
                        if  is_double_mian3_flag
                            'Girl  已经存在两个眠3 '
                            Boy_Step_Set(Index_Boy,:) = temp;
                            success = 1;
                            break;
                        end
                        if success == 1
                            break;
                        end
                    end

                    if Index_Boy >= 2
                        
                        for index = 1:size(available_points,1)
                            temp = available_points(index,:);
                            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Boy   活3   连 珠   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                            if  is_huo3([Boy_Step_Set;temp],Girl_Step_Set) && ~is_mian4([Boy_Step_Set;temp],Girl_Step_Set)
                                'Boy 活3 '
%                                 is_huo3_q =is_huo3([Boy_Step_Set;temp],Girl_Step_Set)
%                                 is_special_huo3_q =is_special_huo3(temp,Boy_Step_Set,Girl_Step_Set)
%                                 is_mian4_q =is_mian4([Boy_Step_Set;temp],Girl_Step_Set)
%                                 is_special_mian4_q =is_special_mian4(temp,Boy_Step_Set,Girl_Step_Set)
                                Boy_Step_Set(Index_Boy,:) = temp;
                                success = 1;
                                break;
                            end
                        end
                        if success == 1
                            break;
                        end
                        if mode == 2 || mode == 3
                            for index = 1:size(available_points,1)
                                temp = available_points(index,:);
                                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Girl    眠4   连 珠   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                if  is_mian4([Girl_Step_Set;temp],Boy_Step_Set) || is_special_mian4(temp,Girl_Step_Set,Boy_Step_Set)
                                    'Girl  眠4'
                                    Boy_Step_Set(Index_Boy,:) = temp;
                                    success = 1;
                                    break;
                                end
                            end
                            if success == 1
                                break;
                            end
                            for index = 1:size(available_points,1)
                                temp = available_points(index,:);
                                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Girl    眠5   连 珠   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                if  is_mian5(available_points,[Girl_Step_Set;temp],Boy_Step_Set)
                                    'Girl  眠5'
                                    Boy_Step_Set(Index_Boy,:) = temp;
                                    success = 1;
                                    break;
                                end
                            end
                            if success == 1
                                break;
                            end

                            for index = 1:size(available_points,1)
                                temp = available_points(index,:);
                                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Girl   活3  连 珠   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                if  is_huo3([Girl_Step_Set;temp],Boy_Step_Set)
                                    'Girl 活3 '
                                    Boy_Step_Set(Index_Boy,:) = temp;
                                    success = 1;
                                    break;
                                end
                            end
                            if success == 1
                                break;
                            end
                        end
                        
                        for index = 1:size(available_points,1)
                            temp = available_points(index,:);
                            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Boy   眠4   连 珠   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                            if  is_mian4([Boy_Step_Set;temp],Girl_Step_Set) || is_special_mian4(temp,Boy_Step_Set,Girl_Step_Set)
                                'Boy  眠4'
                                Boy_Step_Set(Index_Boy,:) = temp;
                                success = 1;
                                break;
                            end
                        end
                        if success == 1
                            break;
                        end
                    end

                    if Index_Boy >= 1
                        for index = 1:size(available_points,1)
                            temp = available_points(index,:);
                            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Boy  2   连 珠   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                            if is_huo2([Boy_Step_Set;temp],Girl_Step_Set)
                                'Boy 活 2'

                                Boy_Step_Set(Index_Boy,:) = temp;
                                success = 1;
                                break;
                            end
                        end
                        if success == 1
                            break;
                        end
                    end
                end

                if success == 0
                    if (Index_Boy == 1)
                        temp_index = randi([1 8],1);
                        temp = available_points(temp_index,:);
                    else
                        temp = available_points(1,:);
                    end
                    Boy_Step_Set(Index_Boy,:) = temp;
                end
                if Index_Boy >= 2
                    BoyPlay(Boy_Step_Set(Index_Boy - 1,:));
                end
                BoyPlay(Boy_Step_Set(Index_Boy,:),[],1);
                available_points = available_points_update(available_points,Boy_Step_Set(Index_Boy,:));

                toc
                Boy_Turn = 0;
                Index_Boy = Index_Boy + 1;
                if is_win(Boy_Step_Set)                                  % 判断是否五连珠
                    msgbox([player_g 'is the winner']);
                    GameOver = 1;
                    score_g = score_g + 1;
                    if score_g > 10
                        text(19.7,2.4,' +1','FontSize',22,'Color','g');
                    else
                        text(19.6,2.4,'+1','FontSize',22,'Color','g');
                    end
                    isPlaying = 0;
                end
            end
        end
    end    
end






