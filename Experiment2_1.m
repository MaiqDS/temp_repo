%实验2_1，牛顿插值与拉格朗日插值法,脚本文件
format compact
clc,clear
fun=@(x)1./(1+3.*x.^2);  % 函数f(x)的代码表示，注意matlab中的“点乘”、“点除”
fplot(fun,[-4,4]);     %绘制f(x)曲线,在区间[-4,4]
grid on,hold on
axis([-4 4 -0.5 1.5])    %确定坐标轴范围

%牛顿插值法
x=-4:1:4;   %[-4,4]上选取等距的9个节点
y=fun(x);
m=length(x);
n=length(y);
if m~=n 
    error('向量x与y的长度必须一致');
end
% 计算差商表
y=fun(x);
cssheet=zeros(n,n+1);  %初始化差商表
cssheet(:,1)=x'; % ':转置，第一列：x
cssheet(:,2)=y'; % 第二列：y
k=2; % 从第2列开始
while k~=n+1 % k!=len(y)+1
    for i=k:n % 假设n=4，则第一次i=2:4，第二次3:4...对每行计数
    %计算差商
     cssheet(i,k+1)=(cssheet(i,k)-cssheet(i-1,k))/(x(i)-x(i-k+1)); 
    end
    k=k+1;
end
k=2;
f(1)=y(1);
% 计算newton插值
x_i=-4:0.1:4;
p=length(x_i); % x长度
yi=zeros(1,p);
for k=1:p
    xi=x_i(k);
cfwh=0;
for i=2:n
    w=1;
    for j=1:i-1
        w=w*(xi-x(j));
    end
    cfwh=cfwh+cssheet(i,i+1)*w;  %差商表对角线元素
end
yi(k)=y(1)+cfwh;
end
plot(x_i,yi,'r')%牛顿插值曲线

%拉格朗日插值法
x=-4:0.5:4;
y=fun(x);
xi=-4:0.1:4;
m=length(x);
n=length(y);
p=length(xi);
if m~=n 
    error('向量x与y的长度必须一致');
end
s=0;
for k=1:n
    t=ones(1,p);
    for j=1:n
        if j~=k
            t=t.*(xi-x(j))/(x(k)-x(j)); %公式2.8，分母部分
        end
    end
    s=s+t.*y(k);
end
yi=s;
plot(xi,yi,'k')%拉格朗日插值曲线
legend('实际曲线','牛顿插值','拉格朗日插值', 'Location','NorthEast');
