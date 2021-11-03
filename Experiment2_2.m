%实验2_2，分段三次(两点三次)Hermite插值法
format compact
clc,clear,grid on,hold on
fun=@(x)1./(1+3*x.^2);
fplot(fun,[-4,4]);  %绘制原函数曲线
axis([-4 4 -0.1 1.2])%设置坐标轴范围
%分段三次Hermite插值法
x=-4:1:4;n=length(x);y=fun(x);  %插值点
x_i=-4:0.1:4;m=length(x_i);y_i=zeros(1,m);  %绘图点
syms xx  %符号变量，求导用
fname=1/(1+xx^2*3);  %符号方程，非函数
dfname=diff(fname);   %diff，求一阶导数方程
ydot=subs(dfname,x);  %subs，将数值代入方程计算原方程导数值
% ydot=gradient(y,x);  %另一种求导方法，通过点求梯度(一阶差商)，代替一阶导数
for i=1:m
    xi=x_i(i);
    for k=1:n-1
      if x(k)<=xi&&xi<=x(k+1)% 绘图点横坐标xi属于区间[x(k),x(k+1)]
       %教材41页，公式5.3，注意公式太长，因此加" ..."作为换行，三点前有一空格   
       yi=y(k)*(1-2*(xi-x(k))/(x(k)-x(k+1)))*(xi-x(k+1))^2/(x(k)-x(k+1))^2 ...
       +y(k+1)*(1-2*(xi-x(k+1))/(x(k+1)-x(k)))*(xi-x(k))^2/(x(k+1)-x(k))^2 ...
       +ydot(k)*(xi-x(k))*(xi-x(k+1))^2/(x(k)-x(k+1))^2 ...
       +ydot(k+1)*(xi-x(k+1))*(xi-x(k))^2/(x(k+1)-x(k))^2; % 公式5.3，最后一项
      end
    end
    y_i(i)=yi;
end
plot(x_i,y_i,'red--'); % plot函数绘制分段三次Hermite插值曲线图，曲线红色，线型为虚线--
set(get(gca,'Children'),'linewidth',1.5);%设置图中线宽1.5磅
legend('原函数','分段三次埃尔米特插值')
ylabel('y=1/(1+3x^2)')%设置坐标轴标注
