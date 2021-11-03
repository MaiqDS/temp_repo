%ʵ��2_1��ţ�ٲ�ֵ���������ղ�ֵ��,�ű��ļ�
format compact
clc,clear
fun=@(x)1./(1+3.*x.^2);  % ����f(x)�Ĵ����ʾ��ע��matlab�еġ���ˡ����������
fplot(fun,[-4,4]);     %����f(x)����,������[-4,4]
grid on,hold on
axis([-4 4 -0.5 1.5])    %ȷ�������᷶Χ

%ţ�ٲ�ֵ��
x=-4:1:4;   %[-4,4]��ѡȡ�Ⱦ��9���ڵ�
y=fun(x);
m=length(x);
n=length(y);
if m~=n 
    error('����x��y�ĳ��ȱ���һ��');
end
% ������̱�
y=fun(x);
cssheet=zeros(n,n+1);  %��ʼ�����̱�
cssheet(:,1)=x'; % ':ת�ã���һ�У�x
cssheet(:,2)=y'; % �ڶ��У�y
k=2; % �ӵ�2�п�ʼ
while k~=n+1 % k!=len(y)+1
    for i=k:n % ����n=4�����һ��i=2:4���ڶ���3:4...��ÿ�м���
    %�������
     cssheet(i,k+1)=(cssheet(i,k)-cssheet(i-1,k))/(x(i)-x(i-k+1)); 
    end
    k=k+1;
end
k=2;
f(1)=y(1);
% ����newton��ֵ
x_i=-4:0.1:4;
p=length(x_i); % x����
yi=zeros(1,p);
for k=1:p
    xi=x_i(k);
cfwh=0;
for i=2:n
    w=1;
    for j=1:i-1
        w=w*(xi-x(j));
    end
    cfwh=cfwh+cssheet(i,i+1)*w;  %���̱�Խ���Ԫ��
end
yi(k)=y(1)+cfwh;
end
plot(x_i,yi,'r')%ţ�ٲ�ֵ����

%�������ղ�ֵ��
x=-4:0.5:4;
y=fun(x);
xi=-4:0.1:4;
m=length(x);
n=length(y);
p=length(xi);
if m~=n 
    error('����x��y�ĳ��ȱ���һ��');
end
s=0;
for k=1:n
    t=ones(1,p);
    for j=1:n
        if j~=k
            t=t.*(xi-x(j))/(x(k)-x(j)); %��ʽ2.8����ĸ����
        end
    end
    s=s+t.*y(k);
end
yi=s;
plot(xi,yi,'k')%�������ղ�ֵ����
legend('ʵ������','ţ�ٲ�ֵ','�������ղ�ֵ', 'Location','NorthEast');
