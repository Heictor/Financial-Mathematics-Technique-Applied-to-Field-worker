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
K=menu('SISTEMAS DE AMORTIZAÇÃO - IFPA - GM²SC',...
       'SISTEMA PRICE - FRANCÊS', ...
       'SISTEMA DE AMORTIZAÇÃO CONSTANTE - SAC',...
       'SISTEMA DE AMORTIZAÇÃO AMERICANA - SAA',...
       'FIM - PROGRAMA');
% RESUMO SOBRE OS SISTEMAS DE AMORTIZAÇÃO
%
% Tabela Price - Sistema de Amortização Francês
%
% - Prestações sempre iguais, periódicas e sucessivas
% - Juros incidem sobre o saldo devedor e são decrescentes
% - Parcelas de amortização do principal assumem valores crescentes
%
% SAC - Sistema de Amortização Constante
%
% - Prestações decrescentes
% - Juros incidem sobre o saldo devedor e são decrescentes
% - Amortizações do principal são sempre iguais ou constantes em todo
%   o prazo do financiamento
%
% SAA - Sistema de Amortização Americana
%
% - Neste sistema paga-se periodicamente apenas os juros, e na última
%   prestação paga-se os juros somados ao capital emprestado
%   (juros + principal). Sendo assim, as prestações são constantes,
%   com excessão da última
% - Juros incidem sobre o saldo devedor e são contantes,
%   com excessão da última
% - Amortiza-se apenas na última prestação
if K==1
clear
clc
% SISTEMA PRICE (FRANCÊS) DE AMORTIZAÇÃO
% PRINCIPAL CARACTERÍSTICA: PRESTAÇÕES CONSTANTES
% BASTANTE UTILIZADO NAS COMPRAS COM POUCAS PRESTAÇÕES
% CÁLCULO DA PRESTAÇÃO PELO SISTEMA PRICE
disp(' ')
aviso={'ENTRE COM O CAPITAL:','ENTRE COM A TAXA:','ENTRE COM O PERÍODO:'};
titulo='SISTEMA PRICE - PRESTAÇÃO CONSTANTE';
linhas=1;
resposta=inputdlg(aviso,titulo,linhas);
pv=str2num(char(resposta(1)));
i=str2num(char(resposta(2)));
n=str2num(char(resposta(3)));
format bank
pmt=pv*(i/100*(1+ i/100)^n)/((1+i/100)^n -1);
disp(' -----------------------------------------------------------------------')
disp(' |VALOR EMPRESTADO | Nº DE PRESTAÇÕES| TAXA DE JUROS | VALOR PRESTAÇÃO|')
disp(' -----------------------------------------------------------------------')
sai=[pv n i pmt];
disp(sprintf('%13.2f %15.0f %17.2f %17.2f\n',sai'))
% CÁLCULO DA TABELA DE AMORTIZAÇÃO PERÍODO A PERÍODO - PRICE
SaldoDevedor=pv;
%pause(1)
disp('  -----------------------------------------------------------------')
disp('  |PERÍODO|PRESTAÇÃO| JUROS |AMORTIZAÇÃO|SALDO_DEVEDOR|TOTAL GASTO|')
disp('  -----------------------------------------------------------------')
prest=0;
ju=0;
amt=0;
for p=1:n % número de prestações
Juro=SaldoDevedor*(i/100); % juros de cada periodo
Amort=pmt-Juro; % valor da amortização do período
SaldoDevedor=SaldoDevedor-Amort;  % atualização do saldo devedor
gasto=(pmt*p);
resp=[p pmt  Juro Amort SaldoDevedor gasto];
disp(sprintf('%8.0f %10.2f %8.2f %9.2f %12.2f %12.2f\n',resp'))
pause(1) %prest=prest+pmt;
ju=ju+Juro;
amt=amt+Amort;
end
disp('  ----------------------------------------------')
disp('  |TOTAL PAGO | JUROS PAGOS | AMORTIZAÇÃO TOTAL|')
disp('  ----------------------------------------------')
total=[gasto ju amt];
disp(sprintf('%12.2f %12.2f %15.2f\n',total'))
pause
clc % limpa a tela

%% =======================================================================
elseif K==2
clear
clc
% SISTEMA DE AMORTIZAÇÃO CONSTANTE
% PRICIPAL CARACTERÍSTICA: AMORTIZAÇÃO CONSTANTE
% CALCULO DO VALOR DA AMORTIZAÇÃO
aviso = {'ENTRE COM O CAPITAL:','ENTRE COM A TAXA:','ENTRE COM O PERÍODO:'};
titulo = 'SAC - AMORTIZAÇÃO CONSTANTE';
linhas=1;
resposta=inputdlg(aviso,titulo,linhas);
pv=str2num(char(resposta(1)));
i=str2num(char(resposta(2)));
n=str2num(char(resposta(3)));
format bank
Amort=pv/n;
disp(' -------------------------------------------------------------------')
disp(' |VALOR EMPRESTADO | N.0 DE PRESTAÇÃO | TAXA DE JUROS | AMORTIZAÇÃO|')
disp(' -------------------------------------------------------------------')
sai=[pv n i Amort];
disp(sprintf('%12.2f %15.0f %17.2f %17.2f\n',sai'))
% CÁLCULO DA TABELA DE AMORTIZAÇÃO PERÍODO A PERÍODO - SAC
SaldoDevedor=pv;
% pause(1)
disp('  ------------------------------------------------------------------')
disp('  |PERÍODO|AMORTIZAÇÃO| JUROS  |PRESTAÇÃO|SALDO_DEVEDOR|TOTAL GASTO|')
disp('  ------------------------------------------------------------------')
gasto=0;
amt=0;
ju=0;
for p=1:n % número de prestações
Juro=SaldoDevedor*(i/100); % juros de cada periodo
pmt=Amort+Juro; % valor da prestação período
SaldoDevedor=SaldoDevedor-Amort;  % atualização do saldo devedor
gasto=gasto+pmt;
ju=ju+Juro;
amt=amt+Amort;
resposta=[p Amort Juro pmt SaldoDevedor gasto];
disp(sprintf('%9.0f %10.2f %9.2f %9.2f %11.2f %12.2f\n',resposta'))
pause(1)
end
disp('  ----------------------------------------------')
disp('  |AMORTIZAÇÃO TOTAL | JUROS PAGOS |TOTAL PAGO |')
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
% SISTEMA DE AMORTIZAÇÃO AMERICANA - SAA
% PRICIPAL CARACTERÍSTICA: A CADA PERÍODO PAGA-SE APENAS O JUROS,
% NO ÚLTIMO PERÍODO PAGA-SE O JUROS + O MONTANTE EMPRESTADO
% PORTANTO O JUROS É SEMPRE CONSTANTE
% CALCULO DO VALOR DO JUROS
aviso={'ENTRE COM O CAPITAL:','ENTRE COM A TAXA:','ENTRE COM O PERÍODO:'};
titulo='SAA - JUROS CONSTANTE';
linhas=1;
resposta=inputdlg(aviso,titulo,linhas);
pv=str2num(char(resposta(1)));
i=str2num(char(resposta(2)));
n=str2num(char(resposta(3)));
format bank
Juro= pv*(i/100);
disp(' ----------------------------------------------------------------')
disp(' |VALOR EMPRESTADO | N.0 DE PRESTAÇÃO | TAXA DE JUROS  |  JUROS |')
disp(' ----------------------------------------------------------------')
sai=[pv n i Juro];
disp(sprintf('%12.2f %15.0f %17.2f %17.2f\n',sai'))
% CÁLCULO DA TABELA DE AMORTIZAÇÃO PERÍODO A PERÍODO - SAC
SaldoDevedor=pv;
% pause(1)
disp('  ------------------------------------------------------------------')
disp('  |PERÍODO|  JUROS |PRESTAÇÃO|AMORTIZAÇÃO|SALDO_DEVEDOR|TOTAL GASTO|')
disp('  ------------------------------------------------------------------')
ju=0;
gasto=0;
amt=0;
prest=0;
for p=1:(n-1) % número de prestações
Juros=pv*(i/100); % juros de cada periodo
pmt=Juros; % valor da prestação do período
Amort=0;
SaldoDevedor=SaldoDevedor-Amort;  % atualização do saldo devedor
gasto=Juros*p;
resposta=[p Juro pmt Amort SaldoDevedor gasto];
disp(sprintf('%8.0f %9.2f %10.2f %9.2f %11.2f %13.2f\n',resposta'))
pause(1)
end
p=n;
Juros=pv*(i/100); % juros de cada periodo
pmt=Juros+pv; % valor da amortização do período
Amort=pv;
SaldoDevedor=SaldoDevedor-Amort;  % atualização do saldo devedor
gasto=Juros*p+pv;
resposta=[p Juro pmt Amort SaldoDevedor gasto];
disp(sprintf('%8.0f %9.2f %10.2f %9.2f %11.2f %13.2f\n',resposta'))
ju=Juros*n;
amt=pv;
disp('  --------------------------------------------')
disp('  |JUROS PAGOS |TOTAL PAGO |AMORTIZAÇÃO TOTAL|')
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


