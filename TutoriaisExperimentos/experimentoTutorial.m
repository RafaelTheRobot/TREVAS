%% boas praticas
clearvars; close all; clc;

%% inicializar objetos 
% Objeto que conecta MATLAB (WINDOWS) ao ROS:
RI = RosInterface; 

% Variáveis de rede do ROS:
IP_DO_MEU_PC = '192.168.0.159';
IP_DA_RASPBERRY = '192.168.0.212';
URI_DO_MESTRE = ['http://',IP_DA_RASPBERRY,':11311'];

% Criando variáveis de sistema para criar nó ROS no MATLAB:
setenv('ROS_IP',IP_DO_MEU_PC) 
setenv('ROS_MASTER_URI',URI_DO_MESTRE)

% Conectar ao ROS da rede NERO (usando RASP como nó mestre):
RI.rConnect(IP_DA_RASPBERRY)

% Objeto Pioneer do ROS:
% nome do nó do ROSARIA (driver) que conectou ao pioneer
no_pioneer = 'RosAria';  

% ID para quando estiver usando mais de 1 pioneer:
id_pioneer = 1; % recomendado usar ID da raspberry (e.g. P1, P2,...)
                % este ID deve ser usado dentro da Motive para identificar
                % o corpo rígido referente ao Pioneer

% Criar Pioneer via ROS:
P = RPioneer(id_pioneer, no_pioneer);

% Objeto que conecta ao Motive / Optitrack:
OPT = OptiTrack; 
OPT.Initialize;  

%% inicializar variáveis de experimento
% atualizar odometria do Pioneer via OptiTrack:
rb = OPT.RigidBody; % Atualizar dados dos corpos rigidos do Motive / OptiTrack:
if rb(id_pioneer).isTracked
    P = getOptHist(rb(id_pioneer),P);
end

tmax = 90; % tempo total de experimento
t = tic; % timer geral
ta = tic; % timer para controle
tplot = tic; % limita tempo plotando 
tparcial = tmax/3; % tempo para controle de posição desejada

Hist = []; % historico dos dados
P.pPar.alpha = 0; % editar depois

% Variáveis de análise de desempenho do controlador
IAE  = 0; ITAE = 0; IASC = 0;
%% desenhar cena
figure(1);
axis([-3 3 -3 3]);
xlabel('Eixo x [m]','FontSize',12,'FontWeight','bold');
ylabel('Eixo y [m]','FontSize',12,'FontWeight','bold');
hold on;
grid on;

P.mCADdel;
P.mCADplot(.7,'r');
p1 = plot(0,0,'r--','LineWidth',2);
p2 = plot(0,0,'b','LineWidth',2);
legend([p1,p2],'X_{d}','X','Location','northwest');
drawnow
pause(1)

%% executar experimento

while toc(t) < tmax+0.2
    if toc(ta) > .1
        ta = tic;

        % Atualizar posição desejada:
        if toc(t) < tparcial
            P.pPos.Xd(1) = 1;
            P.pPos.Xd(2) = 1;
        elseif (tparcial < toc(t)) && (toc(t) < 2*tparcial)
            P.pPos.Xd(1) = 1;
            P.pPos.Xd(2) = 0;
        else
            P.pPos.Xd(1) = 0;
            P.pPos.Xd(2) = 1;
        end
            
        % Atualizar posição atual:
        rb = OPT.RigidBody;
        if rb(id_pioneer).isTracked
            P = getOptHist(rb(id_pioneer),P);
        end
        
        % Calcula sinal de controle:
        P = fDCQuentePelando(P);
        
        % Enviar comando para Pioneer 
        P.rCommand;
        
        Hist = [Hist; [P.pPos.Xd' P.pPos.X' P.pPos.Xtil' P.pSC.U' P.pSC.Ud' P.pSC.Ur' toc(t)]];
        
        IAE = IAE + .1*norm(P.pPos.Xtil([1 2]));
        ITAE = ITAE + toc(t)*.1*norm(P.pPos.Xtil([1 2]));
        IASC = IASC + .1*norm(P.pSC.U);
        
        % Plotar o robô
        if toc(tplot) > .1
            tplot = tic;
            P.mCADdel;
            P.mCADplot(.7,'r');
            
            % Plotar rastros
            try
                delete (fig);
            end

            fig(1) = plot(Hist(:,1),Hist(:,2),'or','LineWidth',2);
            fig(2) = plot(Hist(:,13),Hist(:,14),'b','LineWidth',1);
            legend([p1,p2],'X_{d}','X','Location','northwest');  
            drawnow;
        end
    end
    
end

%% Mostrar variáveis

% Caminho
figure
axis equal
plot(Hist(:,13)',Hist(:,14)','-.','LineWidth',1),hold on;
% plot(Hist(1,13),Hist(1,14),'ko','MarkerSize', 9,'LineWidth',2);
% plot(Hist(end,13),Hist(end,14),'k*','MarkerSize', 9,'LineWidth',2);
xlabel('$x$ [m]','interpreter','Latex')
ylabel('$y$ [m]','interpreter','Latex')
lt1 = legend('Simulado','Experimento','Location','SouthEast');
set(lt1,'Interpreter','latex');
% box on
% axis ([-1 3 -1 3])
grid on
title('Caminho','interpreter','Latex')




