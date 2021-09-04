function yt = f(t,y)
global m M M1 l c g;
    dx1=y(3);
    dx2=y(4);
    dx3=(-1*((M*y(3)^2-(m*y(4)^2)/2)*sin(2*y(1)))-(m+M)*g*sin(y(1))/l-8*c*sin(y(1))*sin(y(1)/2)^2)/(m+2*M*sin(y(1))^2);
    dx4=(M1-2*m*l*l*y(4)*y(3)*sin(2*y(1)))/(2*m*l*l*sin(y(1))^2);
    yt = [dx1; dx2 ;dx3; dx4];
end
