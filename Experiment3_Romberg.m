function [t,T]=Experiment3_Romberg(fname,a,b,e)
% t=romberg(fname,a,b,e) fname Ϊ��������,a,bΪ����������,eΪ����(Ĭ��ֵΪ1e-4)
format long
if nargin<4,e=1e-4;end
i=1;j=1;h=b-a;
T(i,1)=h/2*(fname(a)+fname(b)); %һ����������ļ��㣬�� 
T(i+1,1)=T(i,1)/2+sum(feval(fname,a+h/2:b-h/2+0.001*h))*h/2;  %0.001*h,�˴���Ϊ�˱����ڼ��������ȡ����b-h/2�㣬��Ϊ������������
T(i+1,j+1)=4^j*T(i+1,j)/(4^j-1)-T(i,j)/(4^j-1);
while abs(T(i+1,i+1)-T(i,i))>e
    i=i+1;h=h/2;
    T(i+1,1)=T(i,1)/2+sum(feval(fname,a+h/2:h:b-h/2+0.001*h))*h/2;
    for j=1:i
        T(i+1,j+1)=4^j*T(i+1,j)/(4^j-1)-T(i,j)/(4^j-1);%�̲�112ҳ����ʽ4.11
    end
end
t=T(i+1,j+1);
