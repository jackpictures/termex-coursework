global m M M1 l c g;
m = 1;
M = 2;
M1 = 10;
l = 1;
c = 5;
g = 9.81;
tstep = 0.01;
tfin = 10;
tout = 0:tstep:tfin;
start_cond = [pi/6;0;0;0.5];
[t,y]=ode45(@f,tout,start_cond);
phi = y(:,1);
theta = y(:,2);
phit = y(:,3);
thetat = y(:,4);
for i=1:length(t)
  Res = f(t(i),y(i,:));  
  phitt(i,1) = Res(3);    
  thetatt(i,1) = Res(4);  
end

T1=m.*((l./2).*thetat.^2+(1/2).*(g./cos(phi))+l.*(phit.^2-phitt.*cot(2.*phi)))
T3=m.*((l./2).*thetat.^2-(1/2).*(g./cos(phi))-(l.*phitt./sin(2.*phi)))

figure
subplot(4,1,1)
plot(t,phi)
title('phi(t)')
subplot(4,1,2)
plot(t,theta)
title('theta(t)')
subplot(4,1,3)
plot(t,T1)
title('T1(t)')
subplot(4,1,4)
plot(t,T3)
xlim([0 10])
ylim([0 2000])
title('T3(t)')


for i=1:length(phi)
    if phi(i)>pi/2
        phi(i)=pi/2
    end
end
b=5;
x0=3;
q=pi/4;
x=x0+phi; %задаём закон изменения координат


l=3; %длина маятника



figure %принудительное создание окна

xlim([-10 10]) %задание пределов по x

ylim([-10 10]) 

zlim([-10 10])

xlim manual 
ylim manual 
zlim manual

axis manual 

hold on 

xA=l.*sin(phi).*cos(theta); %левый груз
yA=-l.*cos(phi);
zA=-l.*sin(theta).*sin(phi);%координаты точки A
xB=-l.*sin(phi).*cos(theta); %правый груз
yB=-l.*cos(phi);
zB=l.*sin(theta).*sin(phi);
xO=0;%верхняя точка
yO=0;
zO=0;
xC = 0;
yC=-2.*l.*cos(phi);
zC=0;%нижняя точка
%ось вращения
OC = plot3([0 0],[3  -8],[0 0],'-.','color',[0 0 255]/255);
OA = plot3([xA(1)-xO(1)],[yA(1)-yO(1)],[zA(1)-zO(1)],'color',[255 0 0]/255);
disp(OA);
OB = plot3([xB(1) xO(1)],[yB(1) yO(1)],[zB(1) zO(1)],'color',[0 255 0]/255);
BC = plot3([xB(1) xC(1)],[yB(1) yC(1)],[zB(1) zC(1)],'color',[0 0 0]);
AC = plot3([xA(1) xC(1)],[yA(1) yC(1)],[zA(1) zC(1)],'color',[0 0 0]);
%грузы
Gruz1=plot3(0+xA(1),0+yA(1),0+zA(1),'o','MarkerSize',15,'color',[0 0 0]);
Gruz2=plot3(0+xB(1),0+yB(1),0+zB(1),'o','MarkerSize',15,'color',[0 0 0]);
%точка крепления
plot3(0,0,0,'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5])

for i=1:length(t)
     set(OA,'Xdata',[xA(i) xO(1)],'Ydata',[yA(i) yO(1)],'Zdata', [zA(i) zO(1)]);
     set(OB,'Xdata',[xB(i) xO(1)],'Ydata',[yB(i) yO(1)],'Zdata', [zB(i) zO(1)]);
     set(BC,'Xdata',[xB(i) xC(1)],'Ydata',[yB(i) yC(i)],'Zdata', [zB(i) zC(1)]);
     set(AC,'Xdata',[xA(i) xC(1)],'Ydata',[yA(i) yC(i)],'Zdata', [zA(i) zC(1)]);
     set(Gruz1,'Xdata',0+xA(i),'Ydata',0+yA(i),'Zdata',0+zA(i));
     set(Gruz2,'Xdata',0+xB(i),'Ydata',0+yB(i),'Zdata',0+zB(i));
     pause(0.01);
end

