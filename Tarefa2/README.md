TAREFA 2
========

## INTRO
De onde vem o AuRoRA? Do que se alimenta? Como se reproduz? 

O AuRoRA (explicação da sigla?) é uma plataforma de hardware-in-the-loop cada vez mais abstrata, devido ao número de colaboradores. Na presente apresentação serão discutidas as principais convenções e direcionamentos essenciais para contribuir com novos módulos, sejam estes funções, objetos ou até mesmos classes inteiras que venham a surgir do **seu** próprio projeto de pesquisa :wink:. Em seguida, vamos analisar a diferença entre os termos *posição* 

[1] [Pizetta, I. H. B., Brandao, A. S., & Sarcinelli-Filho, M. (2016). A hardware-in-the-loop platform for rotary-wing unmanned aerial vehicles. Journal of Intelligent & Robotic Systems, 84(1-4), 725-743.](https://doi.org/10.1109/ICUAS.2014.6842369) 

## OBJETIVOS

## MÉTODOS

## EXEMPLOS
### Variáveis padrão 

No NERo, são adotadas notações de acordo com a literatura vigente em livros e artigos de revistas no campo de Robótica, adotando portanto as seguintes diretrizes:

* Variáveis minúsculas do alfabeto latino representam variáveis unidimensionais, sejam elas discretas ou contínuas. Não é incomum que estas sejam consideradas implicitamente variáveis que variam em função do tempo. Além disso, o subíndice se refere a ... e o superíndice se refere a... Por exemplo:
    - x,y,z são variáveis contínuas unidimensionais que serão frequentemente usadas para descrever a posição de um 

* Variáveis em **negrito**, quando minúsculas e do alfabeto latino representam vetores. Por exemplo:
    - Seja <img src="https://latex.codecogs.com/svg.latex?\mathbf{P}=(x_c,y_c,z_c,a)" width="125"> o vetor que representa as coordenadas cartesianas do baricentro de um robô, em que "a" é a distância entre esse baricentro e o ponto de referência para controle.

* Variáveis minúsculas do alfabeto grego representam ângulos ou vetores notáveis (eu sei, confuso, mas alguns trabalhos diferem entre si portanto achei melhor apresentar todas as possibilidades aqui). Por exemplo:
    - O vetor de orientação em coordenadas [**esféricas**](https://en.wikipedia.org/wiki/Euler_angles) é dado por: <img src="https://latex.codecogs.com/svg.latex?\eta=(\phi,\theta,\psi)" width="95"> 
    - O vetor de posição em coordenadas **cartesianas** é dado por: <img src="https://latex.codecogs.com/svg.latex?\xi=(x,y,z)" width="95"> 


| X(1) | X(2) | X(3) | X(4) | X(5)  | X(6) | X(7) | X(8) | X(9) | X(10) | X(11)  | X(12) |
|------|------|------|------|-------|------|------|------|------|-------|--------|-------|
|<img src="https://latex.codecogs.com/svg.latex?x " width="20" >|<img src="https://latex.codecogs.com/svg.latex?y " width="20">|<img src="https://latex.codecogs.com/svg.latex?z " width="20">|<img src="https://latex.codecogs.com/svg.latex?\phi " width="20">|<img src="https://latex.codecogs.com/svg.latex?\theta " width="20">|<img src="https://latex.codecogs.com/svg.latex?\psi " width="20">|<img src="https://latex.codecogs.com/svg.latex?\dot{x} " width="20">|<img src="https://latex.codecogs.com/svg.latex?\dot{y} " width="20">|<img src="https://latex.codecogs.com/svg.latex?\dot{z}" width="20">|<img src="https://latex.codecogs.com/svg.latex?\dot{\phi} " width="20">|<img src="https://latex.codecogs.com/svg.latex?\dot{\theta} " width="20">|<img src="https://latex.codecogs.com/svg.latex?\dot{\psi} " width="20">|


 <img src="https://latex.codecogs.com/svg.latex?\dot{\tilde{\phi}}=\dot{\phi}_d-\dot{\phi}=" width="150" > 

## ATIVIDADES

<!-- <img src="https://latex.codecogs.com/svg.latex?\dot{\tilde{\phi}}=\dot{\phi}_d-\dot{\phi}=" width="150" >  (segunda derivada temporal) -->
