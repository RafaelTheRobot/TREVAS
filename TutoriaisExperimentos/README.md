# Tutoriais para Conduzir Experimentos
## Utilizando o Pioneer 3DX com ROSARIA 

- Conectar micro-USB e USB na Raspberry no Pioneer 
- Ligar o pioneer, com a frente virada para a parede que tem janelas
- Ligar o switch do optitrack
- Abrir Putty e tentar comunicar com a Raspberry via SSH usando o IP da respectiva placa
  - Caso não consiga conectar, tente ligar um teclado à placa e digitar:
  ```
    ubuntu
    ENTER
  ```
  - Caso ainda não funcione, chame alguém que saiba usar Ubuntu e/ou ROS
- Inicializar ROSARIA no terminal SSH do Putty:
```
rosrun rosaria RosAria
```
- Você deverá ouvir um beep alegre do Pioneer, avisando que está conectado com a Rasp
- Executar código do experimento 
- Para um exemplo de código de experimento, veja nessa pasta o script "experimentoTutorial.m"
- Possiveis comandos de teste (via Matlab):
```
P.pSC.Ud = [0.2,0];
P.rCommand;

P.pSC.Ud = [0,0];
P.rCommand;
``` 

## Problemas comuns
- É possivel que o ROS não tenha sido inicializado quando a Raspberry foi ligada
- Quando isso acontece, ao inicializar o ROSARIA, o seguinte erro será apresentado:
```
[ERROR] [NÚMERO-CÓDIGO]: [registerPublisher] Failed to contact master at [IP-DA-PLACA:11311]. Retrying...
```
![](https://raw.githubusercontent.com/Alexandre-Caldeira/TREVAS/main/TutoriaisExperimentos/erroSemMestre.png)

- Para solucionar esse problema, basta inicializar o ROS na placa através do comando ``` roscore ```
- Para isso, será necessario abrir outra janela (designada apenas para executar o roscore) no Putty:
 ![](https://github.com/Alexandre-Caldeira/TREVAS/blob/main/TutoriaisExperimentos/rodandoROSCORE.png)

