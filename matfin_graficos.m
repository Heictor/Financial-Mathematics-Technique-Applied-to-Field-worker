%%
%clc;
disp('=======================================================================================')
fprintf('\n      INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO PARÁ ')
fprintf('\n                       IFPA - CAMPUS ANANINDEUA')
fprintf('\n TÉCNICA DE EDUCAÇÃO FINANCEIRA VIA MÉTODOS COMPUTACIONAIS COMO ')
fprintf('\n           RECURSO ESTRATÉGICO AO PROFISSIONAL DO CAMPO' )
fprintf('\n                         AUTORES DO ARTIGO:' )
fprintf('\n                  DENIS COSTA - denis.costa@ifpa.edu.br')
fprintf('\n                PATRICK FÉLIX  - patrick.felix@ifpa.edu.br')
fprintf('\n                   HEICTOR COSTA  - heictor8@gmail.com')
fprintf('\n          SISTEMAS DE AMORTIZAÇÃO: FRANCÊS, ALEMÃO E AMERICANO')
fprintf('\n                         GRUPO DE PESQUISA:')
fprintf('\n       GRADIENTE DE MODELAGEM MATEMÁTICA E SIMULAÇÃO COMPUTACIONAL')
fprintf('\n                  GM²SC - gm2sc.ananindeua@ifpa.edu.br')
fprintf('\n                     XI SICOOPES & II FECITIS')
fprintf('\n              website: http://ananindeua.ifpa.edu.br\n\n')
disp('=======================================================================================')
%%
nper=[1 2 3 4 5 6];
pgto=[5373.33 5200.00 5026.67 4853.33 4680.00 4506.67];
juros=[1040.00 866.67 693.33 520.00 346.67 173.33];
amort=[4333.33 4333.33 4333.33 4333.33 4333.33 4333.33];
sd=[21666.67 17333.33 13000.00 8666.67 4333.33 00.00];
% Interpolação
nper1 = [0: 0.1 :6];
pgto1 = spline(nper,pgto,nper1);
juros1=spline(nper,juros,nper1);
amort1=spline(nper,amort,nper1);
sd1=spline(nper,sd,nper1);
figure(1)
plot (nper,pgto,'dr',nper1,pgto1,'r',nper,juros,'*k',nper1,juros1,'k',...
    nper,amort,'sb',nper1,amort1,'-.b');
xlabel('nper (mês)')
ylabel('pgto, juros, amort (R$)')
title('Variáveis Financeiras')
%legend('pgto1','juros1','amort1')
axis([0,6,0,6000]);
grid on


figure(2)
plot (nper,sd,'<k',nper1,sd1,'k');
xlabel('nper (mês)')
ylabel('Saldo Devedor (R$)')
title('Variável Financeira')
legend('Sd')
axis([0,6,0,30000]);
grid on