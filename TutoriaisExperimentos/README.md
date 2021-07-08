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

- Testar comandos (via Matlab):
```
P.pSC.Ud = [0.2,0];
P.rCommand;

P.pSC.Ud = [0,0];
P.rCommand;
``` 
