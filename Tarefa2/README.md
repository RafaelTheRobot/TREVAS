TAREFA 2
========

## INTRO
De onde vem AuRoRA? Do que se alimenta? Como se reproduz? 

O AuRoRA (explicação da sigla?) é uma plataforma de hardware-in-the-loop [1] cada vez maior, devido ao número de colaboradores. Na presente tarefa serão discutidas as principais convenções e direcionamentos essenciais para contribuir com novos módulos, sejam estes funções, objetos ou até mesmos classes inteiras que venham a surgir do **seu próprio** projeto de pesquisa :wink:. Em seguida, vamos analisar a diferença entre os termos *posição*,*pose*, *caminho* e *trajetória* em exemplos e um rápido exercício. Por fim, deixei algumas dicas 

[1] [Pizetta, I. H. B., Brandao, A. S., & Sarcinelli-Filho, M. (2016). A hardware-in-the-loop platform for rotary-wing unmanned aerial vehicles. Journal of Intelligent & Robotic Systems, 84(1-4), 725-743.](https://doi.org/10.1109/ICUAS.2014.6842369) 

## OBJETIVOS
Entender a plataforma AuRoRA do ponto de vista abstrato, funcional e de projeto; 

Compreender e aplicar as tarefas de posicionamento, seguimento de caminho e trajetória;

Executar as tarefas estudadas e reportar o resultado através de gráficos;

## CONTEXTO
Durante anos, lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et ...

## EXEMPLOS
### Variáveis padrão 

No NERo, são adotadas notações de acordo com a literatura vigente em livros e artigos de revistas no campo de Robótica, adotando portanto as seguintes diretrizes:

* Variáveis minúsculas do alfabeto latino representam variáveis unidimensionais, sejam elas discretas ou contínuas. Não é incomum que estas sejam consideradas implicitamente variáveis que variam em função do tempo. Além disso, o subíndice se refere a ... e o superíndice se refere a... Por exemplo:
    - x,y,z são variáveis contínuas unidimensionais que serão frequentemente usadas para descrever a posição de um 

* Variáveis em **negrito**, quando minúsculas e do alfabeto latino representam vetores. Por exemplo:
    - Seja <img src="https://latex.codecogs.com/svg.latex?\mathbf{p}=[x_c,y_c,z_c,a]^T" width="125"> o vetor que representa as coordenadas cartesianas do baricentro de um robô, em que "a" é a distância entre esse baricentro e o ponto de referência para controle.

* Variáveis em **negrito**, quando MAIÚSCULAS e do alfabeto latino representam matrizes. Por exemplo:
    - A matriz <img src="https://latex.codecogs.com/svg.latex?\mathbf{C}_r" width="25"> normalmente representa os efeitos [Coriolis](https://www.smartereveryday.com/toiletswirl) em um modelo dinâmico.
    - Seja <img src="https://latex.codecogs.com/svg.latex?\mathbf{K}=[k_{p\upsilon},k_{p\omega};k_{d\upsilon},k_{d\omega}]" width="170"> uma matriz de ganhos proporcionais e derivativos em velocidade linear e angular.

* Variáveis minúsculas do alfabeto grego representam ângulos ou vetores notáveis (eu sei, confuso, mas alguns trabalhos diferem entre si portanto achei melhor apresentar todas as possibilidades aqui). Por exemplo:
    - O vetor de orientação em coordenadas [**esféricas**](https://en.wikipedia.org/wiki/Euler_angles) é dado por: <img src="https://latex.codecogs.com/svg.latex?\eta=[\phi,\theta,\psi]^T" width="110"> 
    - O vetor de posição em coordenadas **cartesianas** é dado por: <img src="https://latex.codecogs.com/svg.latex?\xi=[x,y,z]^T\in\mathbb{R}" width="125"> 

* Derivadas temporais são representadas através de pontos sobre as variáveis, ao passo que derivadas com relação são representadas explicitamente (<img src="https://latex.codecogs.com/svg.latex?\partial\dot{x}/\partial\psi" width="65">). Por exemplo:
    - <img src="https://latex.codecogs.com/svg.latex?\dot{\tilde{\phi}}=\dot{\phi}_d-\dot{\phi}" width="95" > é a primeira derivada temporal do erro na variável angular que representa rotações em torno do eixo x. 


### Propriedades importantes
Na plataforma AuRoRA, os módulos mais utilizados com certeza são os que representam robôs móveis terrestres (classe Pioneer 3DX) e aéreos (classe ArDrone) os quais são dados por objetos com métodos e propriedades immportantes definidas em suas respectivas pastas de código fonte. Por exemplo, o vetor de estado que representa um robô no sistema AuRoRA pode ser encontrado em ROBO.pPos.X, contendo os seguintes valores:

| X(1) | X(2) | X(3) | X(4) | X(5)  | X(6) | X(7) | X(8) | X(9) | X(10) | X(11)  | X(12) |
|------|------|------|------|-------|------|------|------|------|-------|--------|-------|
|<img src="https://latex.codecogs.com/svg.latex?x " width="20" >|<img src="https://latex.codecogs.com/svg.latex?y " width="20">|<img src="https://latex.codecogs.com/svg.latex?z " width="20">|<img src="https://latex.codecogs.com/svg.latex?\phi " width="20">|<img src="https://latex.codecogs.com/svg.latex?\theta " width="20">|<img src="https://latex.codecogs.com/svg.latex?\psi " width="20">|<img src="https://latex.codecogs.com/svg.latex?\dot{x} " width="20">|<img src="https://latex.codecogs.com/svg.latex?\dot{y} " width="20">|<img src="https://latex.codecogs.com/svg.latex?\dot{z}" width="20">|<img src="https://latex.codecogs.com/svg.latex?\dot{\phi} " width="20">|<img src="https://latex.codecogs.com/svg.latex?\dot{\theta} " width="20">|<img src="https://latex.codecogs.com/svg.latex?\dot{\psi} " width="20">|

(...) :construction:

### Posicionamento e pose

Posição é cartesiana, pose incorpora orientação.

(...) :construction:

### Caminho e trajetória

Caminho são poses ordenadas e trajetória é um caminho cujas poses devem ser alcançadas em um momento bem determinado.

(...) :construction:

### Análise de controle

Na Tarefa1 foi possível perceber que diferentes controles implicam em ganhos diferentes e a lei de controle interfere na "flexibilidade" do seu sistema. Algumas funções matématicas conferirão um maior grau de precisão no ajuste dos ganhos em relação ao resultado observado durante experimentos e simulações. Portanto, a(s) função(ões) que descrevem sua lei de controle tem grande impacto no resultado final, erro cometido e 

<p align="center">
  <img src="https://mathworld.wolfram.com/images/interactive/TanhReal.gif" />
</p>
<!-- ![](https://mathworld.wolfram.com/images/interactive/TanhReal.gif) -->

## ATIVIDADES

1) Como submeter trabalhos para esse repo? Verifique o README da [página principal do TREVAS](https://github.com/Alexandre-Caldeira/TREVAS). 

2) Siga o roteiro em [Atividade2.pdf]() :construction: nesta pasta, com base na versão live do AuRoRA [disponível aqui](https://github.com/NERO-UFV/AuRoRA). Basta clonar para um local de fácil acesso, abrir no seu MATLAB e seguir o roteiro :smirk:. 

3) Descansar um pouco, você mereceu! Se tiver dúvidas sobre algum dos passos basta perguntar no grupo, pelos [Issues](https://guides.github.com/features/issues/) desse repositório ou até mesmo no meu email. 

Bons estudos e até a próxima!

<!-- <img src="https://latex.codecogs.com/svg.latex?\dot{\tilde{\phi}}=\dot{\phi}_d-\dot{\phi}=" width="150" >  (segunda derivada temporal) -->
<!-- https://gist.github.com/rxaviers/7360908 -->
