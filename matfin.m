%%
%clc;
disp('=======================================================================================')
fprintf('\n      INSTITUTO FEDERAL DE EDUCA��O, CI�NCIA E TECNOLOGIA DO PAR� ')
fprintf('\n                       IFPA - CAMPUS ANANINDEUA')
fprintf('\n T�CNICA DE EDUCA��O FINANCEIRA VIA M�TODOS COMPUTACIONAIS COMO ')
fprintf('\n           RECURSO ESTRAT�GICO AO PROFISSIONAL DO CAMPO' )
fprintf('\n                         AUTORES DO ARTIGO:' )
fprintf('\n                  DENIS COSTA - denis.costa@ifpa.edu.br')
fprintf('\n                PATRICK F�LIX  - patrick.felix@ifpa.edu.br')
fprintf('\n                   HEICTOR COSTA  - heictor8@gmail.com')
fprintf('\n          SISTEMAS DE AMORTIZA��O: FRANC�S, ALEM�O E AMERICANO')
fprintf('\n                         GRUPO DE PESQUISA:')
fprintf('\n       GRADIENTE DE MODELAGEM MATEM�TICA E SIMULA��O COMPUTACIONAL')
fprintf('\n                  GM�SC - gm2sc.ananindeua@ifpa.edu.br')
fprintf('\n                     XI SICOOPES & II FECITIS')
fprintf('\n              website: http://ananindeua.ifpa.edu.br\n\n')
disp('=======================================================================================')
%%
K=menu('SISTEMAS DE AMORTIZA��O - IFPA - GM�SC',...
       'SISTEMA PRICE - FRANC�S', ...
       'SISTEMA DE AMORTIZA��O CONSTANTE - SAC',...
       'SISTEMA DE AMORTIZA��O AMERICANA - SAA',...
       'FIM - PROGRAMA');
% RESUMO SOBRE OS SISTEMAS DE AMORTIZA��O
%
% Tabela Price - Sistema de Amortiza��o Franc�s
%
% - Presta��es sempre iguais, peri�dicas e sucessivas
% - Juros incidem sobre o saldo devedor e s�o decrescentes
% - Parcelas de amortiza��o do principal assumem valores crescentes
%
% SAC - Sistema de Amortiza��o Constante
%
% - Presta��es decrescentes
% - Juros incidem sobre o saldo devedor e s�o decrescentes
% - Amortiza��es do principal s�o sempre iguais ou constantes em todo
%   o prazo do financiamento
%
% SAA - Sistema de Amortiza��o Americana
%
% - Neste sistema paga-se periodicamente apenas os juros, e na �ltima
%   presta��o paga-se os juros somados ao capital emprestado
%   (juros + principal). Sendo assim, as presta��es s�o constantes,
%   com excess�o da �ltima
% - Juros incidem sobre o saldo devedor e s�o contantes,
%   com excess�o da �ltima
% - Amortiza-se apenas na �ltima presta��o
if K==1
clear
clc
% SISTEMA PRICE (FRANC�S) DE AMORTIZA��O
% PRINCIPAL CARACTER�STICA: PRESTA��ES CONSTANTES
% BASTANTE UTILIZADO NAS COMPRAS COM POUCAS PRESTA��ES
% C�LCULO DA PRESTA��O PELO SISTEMA PRICE
disp(' ')
aviso={'ENTRE COM O CAPITAL:','ENTRE COM A TAXA:','ENTRE COM O PER�ODO:'};
titulo='SISTEMA PRICE - PRESTA��O CONSTANTE';
linhas=1;
resposta=inputdlg(aviso,titulo,linhas);
pv=str2num(char(resposta(1)));
i=str2num(char(resposta(2)));
n=str2num(char(resposta(3)));
format bank
pmt=pv*(i/100*(1+ i/100)^n)/((1+i/100)^n -1);
disp(' -----------------------------------------------------------------------')
disp(' |VALOR EMPRESTADO | N� DE PRESTA��ES| TAXA DE JUROS | VALOR PRESTA��O|')
disp(' -----------------------------------------------------------------------')
sai=[pv n i pmt];
disp(sprintf('%13.2f %15.0f %17.2f %17.2f\n',sai'))
% C�LCULO DA TABELA DE AMORTIZA��O PER�ODO A PER�ODO - PRICE
SaldoDevedor=pv;
%pause(1)
disp('  -----------------------------------------------------------------')
disp('  |PER�ODO|PRESTA��O| JUROS |AMORTIZA��O|SALDO_DEVEDOR|TOTAL GASTO|')
disp('  -----------------------------------------------------------------')
prest=0;
ju=0;
amt=0;
for p=1:n % n�mero de presta��es
Juro=SaldoDevedor*(i/100); % juros de cada periodo
Amort=pmt-Juro; % valor da amortiza��o do per�odo
SaldoDevedor=SaldoDevedor-Amort;  % atualiza��o do saldo devedor
gasto=(pmt*p);
resp=[p pmt  Juro Amort SaldoDevedor gasto];
disp(sprintf('%8.0f %10.2f %8.2f %9.2f %12.2f %12.2f\n',resp'))
pause(1) %prest=prest+pmt;
ju=ju+Juro;
amt=amt+Amort;
end
disp('  ----------------------------------------------')
disp('  |TOTAL PAGO | JUROS PAGOS | AMORTIZA��O TOTAL|')
disp('  ----------------------------------------------')
total=[gasto ju amt];
disp(sprintf('%12.2f %12.2f %15.2f\n',total'))
pause
clc % limpa a tela

%% =======================================================================
elseif K==2
clear
clc
% SISTEMA DE AMORTIZA��O CONSTANTE
% PRICIPAL CARACTER�STICA: AMORTIZA��O CONSTANTE
% CALCULO DO VALOR DA AMORTIZA��O
aviso = {'ENTRE COM O CAPITAL:','ENTRE COM A TAXA:','ENTRE COM O PER�ODO:'};
titulo = 'SAC - AMORTIZA��O CONSTANTE';
linhas=1;
resposta=inputdlg(aviso,titulo,linhas);
pv=str2num(char(resposta(1)));
i=str2num(char(resposta(2)));
n=str2num(char(resposta(3)));
format bank
Amort=pv/n;
disp(' -------------------------------------------------------------------')
disp(' |VALOR EMPRESTADO | N.0 DE PRESTA��O | TAXA DE JUROS | AMORTIZA��O|')
disp(' -------------------------------------------------------------------')
sai=[pv n i Amort];
disp(sprintf('%12.2f %15.0f %17.2f %17.2f\n',sai'))
% C�LCULO DA TABELA DE AMORTIZA��O PER�ODO A PER�ODO - SAC
SaldoDevedor=pv;
% pause(1)
disp('  ------------------------------------------------------------------')
disp('  |PER�ODO|AMORTIZA��O| JUROS  |PRESTA��O|SALDO_DEVEDOR|TOTAL GASTO|')
disp('  ------------------------------------------------------------------')
gasto=0;
amt=0;
ju=0;
for p=1:n % n�mero de presta��es
Juro=SaldoDevedor*(i/100); % juros de cada periodo
pmt=Amort+Juro; % valor da presta��o per�odo
SaldoDevedor=SaldoDevedor-Amort;  % atualiza��o do saldo devedor
gasto=gasto+pmt;
ju=ju+Juro;
amt=amt+Amort;
resposta=[p Amort Juro pmt SaldoDevedor gasto];
disp(sprintf('%9.0f %10.2f %9.2f %9.2f %11.2f %12.2f\n',resposta'))
pause(1)
end
disp('  ----------------------------------------------')
disp('  |AMORTIZA��O TOTAL | JUROS PAGOS |TOTAL PAGO |')
disp('  ----------------------------------------------')
total=[amt ju gasto];
disp(sprintf('%15.2f %15.2f %15.2f\n',total'))
pause
clc % limpa a tela
%=========================================================================%
%=========================================================================%
elseif K==3
clc
clear
% SISTEMA DE AMORTIZA��O AMERICANA - SAA
% PRICIPAL CARACTER�STICA: A CADA PER�ODO PAGA-SE APENAS O JUROS,
% NO �LTIMO PER�ODO PAGA-SE O JUROS + O MONTANTE EMPRESTADO
% PORTANTO O JUROS � SEMPRE CONSTANTE
% CALCULO DO VALOR DO JUROS
aviso={'ENTRE COM O CAPITAL:','ENTRE COM A TAXA:','ENTRE COM O PER�ODO:'};
titulo='SAA - JUROS CONSTANTE';
linhas=1;
resposta=inputdlg(aviso,titulo,linhas);
pv=str2num(char(resposta(1)));
i=str2num(char(resposta(2)));
n=str2num(char(resposta(3)));
format bank
Juro= pv*(i/100);
disp(' ----------------------------------------------------------------')
disp(' |VALOR EMPRESTADO | N.0 DE PRESTA��O | TAXA DE JUROS  |  JUROS |')
disp(' ----------------------------------------------------------------')
sai=[pv n i Juro];
disp(sprintf('%12.2f %15.0f %17.2f %17.2f\n',sai'))
% C�LCULO DA TABELA DE AMORTIZA��O PER�ODO A PER�ODO - SAC
SaldoDevedor=pv;
% pause(1)
disp('  ------------------------------------------------------------------')
disp('  |PER�ODO|  JUROS |PRESTA��O|AMORTIZA��O|SALDO_DEVEDOR|TOTAL GASTO|')
disp('  ------------------------------------------------------------------')
ju=0;
gasto=0;
amt=0;
prest=0;
for p=1:(n-1) % n�mero de presta��es
Juros=pv*(i/100); % juros de cada periodo
pmt=Juros; % valor da presta��o do per�odo
Amort=0;
SaldoDevedor=SaldoDevedor-Amort;  % atualiza��o do saldo devedor
gasto=Juros*p;
resposta=[p Juro pmt Amort SaldoDevedor gasto];
disp(sprintf('%8.0f %9.2f %10.2f %9.2f %11.2f %13.2f\n',resposta'))
pause(1)
end
p=n;
Juros=pv*(i/100); % juros de cada periodo
pmt=Juros+pv; % valor da amortiza��o do per�odo
Amort=pv;
SaldoDevedor=SaldoDevedor-Amort;  % atualiza��o do saldo devedor
gasto=Juros*p+pv;
resposta=[p Juro pmt Amort SaldoDevedor gasto];
disp(sprintf('%8.0f %9.2f %10.2f %9.2f %11.2f %13.2f\n',resposta'))
ju=Juros*n;
amt=pv;
disp('  --------------------------------------------')
disp('  |JUROS PAGOS |TOTAL PAGO |AMORTIZA��O TOTAL|')
disp('  --------------------------------------------')
total=[ju gasto amt];
disp(sprintf('%12.2f %12.2f %13.2f\n',total'))
pause
clc % limpa a tela
%=========================================================================%
%=========================================================================%
% sair do programa
disp(' ')
disp(' ----------------------------')
disp(' ALUNO:..... |')
disp(' ----------------------------')
disp(' ')
clc % limpa a tela
end


