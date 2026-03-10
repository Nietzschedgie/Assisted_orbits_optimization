function[a,v,r]=calculaorbitas(r0,v0,tt,dt)%Función que calcula la trayectoria de un cuerpo sometido a un campo gravitatorio mediante un euler sencillo.


G=6.672E-11;
M=2E30;

a=zeros(tt,3);
v=zeros(tt,3);
r=zeros(tt,3);
v(1,:)=v0;
r(1,:)=r0;
Fg_const=-G*M;


for i=1:tt
    for j=1:3
    a(i+1,j)=(Fg_const/((norm(r(i,:))))^2)*(r(i,j)/norm(r(i,:)));

    v(i+1,j)=v(i,j)+a(i,j)*dt;
    
    r(i+1,j)=r(i,j)+v(i,j)*dt+0.5*a(i,j)*(dt^2);
    
    
    
    end
    


end



end