%ʵ��2_2���ֶ�����(��������)Hermite��ֵ��
format compact
clc,clear,grid on,hold on
fun=@(x)1./(1+3*x.^2);
fplot(fun,[-4,4]);  %����ԭ��������
axis([-4 4 -0.1 1.2])%���������᷶Χ
%�ֶ�����Hermite��ֵ��
x=-4:1:4;n=length(x);y=fun(x);  %��ֵ��
x_i=-4:0.1:4;m=length(x_i);y_i=zeros(1,m);  %��ͼ��
syms xx  %���ű���������
fname=1/(1+xx^2*3);  %���ŷ��̣��Ǻ���
dfname=diff(fname);   %diff����һ�׵�������
ydot=subs(dfname,x);  %subs������ֵ���뷽�̼���ԭ���̵���ֵ
% ydot=gradient(y,x);  %��һ���󵼷�����ͨ�������ݶ�(һ�ײ���)������һ�׵���
for i=1:m
    xi=x_i(i);
    for k=1:n-1
      if x(k)<=xi&&xi<=x(k+1)% ��ͼ�������xi��������[x(k),x(k+1)]
       %�̲�41ҳ����ʽ5.3��ע�⹫ʽ̫������˼�" ..."��Ϊ���У�����ǰ��һ�ո�   
       yi=y(k)*(1-2*(xi-x(k))/(x(k)-x(k+1)))*(xi-x(k+1))^2/(x(k)-x(k+1))^2 ...
       +y(k+1)*(1-2*(xi-x(k+1))/(x(k+1)-x(k)))*(xi-x(k))^2/(x(k+1)-x(k))^2 ...
       +ydot(k)*(xi-x(k))*(xi-x(k+1))^2/(x(k)-x(k+1))^2 ...
       +ydot(k+1)*(xi-x(k+1))*(xi-x(k))^2/(x(k+1)-x(k))^2; % ��ʽ5.3�����һ��
      end
    end
    y_i(i)=yi;
end
plot(x_i,y_i,'red--'); % plot�������Ʒֶ�����Hermite��ֵ����ͼ�����ߺ�ɫ������Ϊ����--
set(get(gca,'Children'),'linewidth',1.5);%����ͼ���߿�1.5��
legend('ԭ����','�ֶ����ΰ������ز�ֵ')
ylabel('y=1/(1+3x^2)')%�����������ע
