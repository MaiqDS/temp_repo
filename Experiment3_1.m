format compact
clc,clear,ep=1e-4;
fun=@(x) sin(x.^2)./x;  %�����������壬sin(x^2)/x,�������Ƿ���
[t,T]=Experiment3_Romberg(fun,ep,1,ep);%����������������������T��ͻ��ֽ��
disp('���������T������:');
digits(7);B=vpa(T);%T����ÿ�����ݱ���7λ��Ч����
disp(B);%�������7λ��Ч���ֵ�T��
y1=vpa(t);  %���ֽ������7λ��Ч����
y2=vpa(integral(fun,0,1));%��Ϊ��ȷֵ�ο�
disp('�����������ʽ������:');
fprintf('%c', 8); %ɾ��disp�Ļ���
disp(y1);
disp('            ��ȷֵ�ο�:');fprintf('%c', 8);
disp(y2);
