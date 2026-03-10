clc;
clear all;
tic
radiotierra=6.371E6;
G=6.672E-11;% N m^2/kg
M=2E30; %input('Masa objeto 1:');

vxi =2.978E4; %str2double(input('vx: ', 's'));
vyi =0;% str2double(input('vy: ', 's'));
vzi =0;% str2double(input('vz: ', 's'));
rxi =0;% str2double(input('rx: ', 's'));
ryi =1.4970E11;% str2double(input('ry: ', 's'));
rzi =0;% str2double(input('rz: ', 's'));
r0= [rxi, ryi,rzi];
tiempo=1.976e9;   %input('Tiempo:');
dt=input('Detalle:');
frecuencia_drawnow=100;
m_tierra=5.98E24;
m_venus=m_tierra*0.82;
m_mercurio=m_tierra*0.06;
m_jupiter=1.8986e27;
m_saturno=5.6846E26;
m_marte=6.4185e23;
m_urano=8.6832e25;
m_neptuno=1.0243e26;
m_pluton=1.3105E22;
v0=[vxi,vyi,vzi];

Fg_const = -G * M ;

tt=round(tiempo/dt);


r0mer=[0,5.789E10,0];
v0mer=[4.7E4,0,0];

r0ven=[0,1.08203E11,0];
v0ven=[3.502E4,0,0];

r0marte=[0,2.27925e11,0];
v0marte=[2.4077e4,0,0];

r0jupiter=[0,-7.78371e11,0];
v0jupiter=[-1.30697e4,0,0];

r0saturno=[0,1.42665E12,0];
v0saturno=[9620.24,0,0];

r0neptuno=[0,4.49802E12,0];
v0neptuno=[5477.8,0,0];

r0urano=[0,2.87082E12,0];
v0urano=[6810,0,0];

r0pluton=[0,5.913e12,0];
v0pluton=[4700,0,0];

%tierra:
%Calcular la trayectoria previamente:
v=zeros(tt,3);
a=zeros(tt,3);
r=zeros(tt,3);
modr=zeros(tt,1);
r(1,:)=r0;
v(1,:)=v0;
vmer=zeros(tt,3);
amer=zeros(tt,3);
rmer=zeros(tt,3);
modrmer=zeros(tt,1);
rmer(1,:)=r0mer;
vmer(1,:)=v0mer;

vmarte=zeros(tt,3);
amarte=zeros(tt,3);
rmarte=zeros(tt,3);
vjupiter=zeros(tt,3);
ajupiter=zeros(tt,3);
rjupiter=zeros(tt,3);
vsaturno=zeros(tt,3);
asaturno=zeros(tt,3);
rsaturno=zeros(tt,3);
vurano=zeros(tt,3);
aurano=zeros(tt,3);
rurano=zeros(tt,3);
vneptuno=zeros(tt,3);
aneptuno=zeros(tt,3);
rneptuno=zeros(tt,3);
vpluton=zeros(tt,3);
apluton=zeros(tt,3);
rpluton=zeros(tt,3);

modrmarte=zeros(tt,1);
modrjupiter=zeros(tt,1);
modrsaturno=zeros(tt,1);
modrurano=zeros(tt,1);
modrneptuno=zeros(tt,1);
modrpluton=zeros(tt,1);
rmarte(1,:)=r0marte;
vmarte(1,:)=v0marte;
rjupiter(1,:)=r0jupiter;
vjupiter(1,:)=v0jupiter;
rurano(1,:)=r0urano;
vurano(1,:)=v0urano;
rneptuno(1,:)=r0neptuno;
vneptuno(1,:)=v0neptuno;
rsaturno(1,:)=r0saturno;
vsaturno(1,:)=v0saturno;
rpluton(1,:)=r0pluton;
vpluton(1,:)=v0pluton;




%Venus:
%Calcular la trayectoria previamente:
vven=zeros(tt,3);
aven=zeros(tt,3);
rven=zeros(tt,3);
modrven=zeros(tt,1);
rven(1,:)=r0ven;
vven(1,:)=v0ven;


for i=1:tt
    
    modr(i+1)=r(i,1)^2+r(i,2)^2+r(i,3)^2;
    a(i+1,1)=(Fg_const/modr(i+1))*(r(i,1)/sqrt(modr(i+1)));
    a(i+1,2)=(Fg_const/modr(i+1))*(r(i,2)/sqrt(modr(i+1)));
    a(i+1,3)=(Fg_const/modr(i+1))*(r(i,3)/sqrt(modr(i+1)));
    v(i+1,1)=v(i,1)+a(i+1,1)*dt;
    v(i+1,2)=v(i,2)+a(i+1,2)*dt;
    v(i+1,3)=v(i,3)+a(i+1,3)*dt;
    r(i+1,1)=r(i,1)+v(i,1)*dt+0.5*a(i,1)*(dt^2);
    r(i+1,2)=r(i,2)+v(i,2)*dt+0.5*a(i,2)*(dt^2);
    r(i+1,3)=r(i,3)+v(i,3)*dt+0.5*a(i,3)*(dt^2);
    


end

%Representar la trayectoria como una linea roja:











%Mercurio:
%Calcular la trayectoria previamente:
% 
% for i=1:tt
% 
%     modrmer(i+1)=rmer(i,1)^2+rmer(i,2)^2+rmer(i,3)^2;
%     amer(i+1,1)=(Fg_const/modrmer(i+1))*(rmer(i,1)/sqrt(modrmer(i+1)));
%     amer(i+1,2)=(Fg_const/modrmer(i+1))*(rmer(i,2)/sqrt(modrmer(i+1)));
%     amer(i+1,3)=(Fg_const/modrmer(i+1))*(rmer(i,3)/sqrt(modrmer(i+1)));
%     vmer(i+1,1)=vmer(i,1)+amer(i+1,1)*dt;
%     vmer(i+1,2)=vmer(i,2)+amer(i+1,2)*dt;
%     vmer(i+1,3)=vmer(i,3)+amer(i+1,3)*dt;
%     rmer(i+1,1)=rmer(i,1)+vmer(i,1)*dt+0.5*amer(i,1)*(dt^2);
%     rmer(i+1,2)=rmer(i,2)+vmer(i,2)*dt+0.5*amer(i,2)*(dt^2);
%     rmer(i+1,3)=rmer(i,3)+vmer(i,3)*dt+0.5*amer(i,3)*(dt^2);
% 
% 
% 
% end
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% for i=1:tt
% 
%     modrven(i+1)=rven(i,1)^2+rven(i,2)^2+rven(i,3)^2;
%     aven(i+1,1)=(Fg_const/modrven(i+1))*(rven(i,1)/sqrt(modrven(i+1)));
%     aven(i+1,2)=(Fg_const/modrven(i+1))*(rven(i,2)/sqrt(modrven(i+1)));
%     aven(i+1,3)=(Fg_const/modrven(i+1))*(rven(i,3)/sqrt(modrven(i+1)));
%     vven(i+1,1)=vven(i,1)+aven(i+1,1)*dt;
%     vven(i+1,2)=vven(i,2)+aven(i+1,2)*dt;
%     vven(i+1,3)=vven(i,3)+aven(i+1,3)*dt;
%     rven(i+1,1)=rven(i,1)+vven(i,1)*dt+0.5*aven(i,1)*(dt^2);
%     rven(i+1,2)=rven(i,2)+vven(i,2)*dt+0.5*aven(i,2)*(dt^2);
%     rven(i+1,3)=rven(i,3)+vven(i,3)*dt+0.5*aven(i,3)*(dt^2);
% 
% 
% 
% end
% 
% %Representar la trayectoria como una linea roja:
% 
% 
% for i=1:tt
%     modrmarte(i+1)=rmarte(i,1)^2+rmarte(i,2)^2+rmarte(i,3)^2;
%     amarte(i+1,1)=(Fg_const/modrmarte(i+1))*(rmarte(i,1)/sqrt(modrmarte(i+1)));
%     amarte(i+1,2)=(Fg_const/modrmarte(i+1))*(rmarte(i,2)/sqrt(modrmarte(i+1)));
%     amarte(i+1,3)=(Fg_const/modrmarte(i+1))*(rmarte(i,3)/sqrt(modrmarte(i+1)));
%     vmarte(i+1,1)=vmarte(i,1)+amarte(i+1,1)*dt;
%     vmarte(i+1,2)=vmarte(i,2)+amarte(i+1,2)*dt;
%     vmarte(i+1,3)=vmarte(i,3)+amarte(i+1,3)*dt;
%     rmarte(i+1,1)=rmarte(i,1)+vmarte(i,1)*dt+0.5*amarte(i,1)*(dt^2);
%     rmarte(i+1,2)=rmarte(i,2)+vmarte(i,2)*dt+0.5*amarte(i,2)*(dt^2);
%     rmarte(i+1,3)=rmarte(i,3)+vmarte(i,3)*dt+0.5*amarte(i,3)*(dt^2);
% 
% 
% 
% end



for i=1:tt
    modrjupiter(i+1)=rjupiter(i,1)^2+rjupiter(i,2)^2+rjupiter(i,3)^2;
    ajupiter(i+1,1)=(Fg_const/modrjupiter(i+1))*(rjupiter(i,1)/sqrt(modrjupiter(i+1)));
    ajupiter(i+1,2)=(Fg_const/modrjupiter(i+1))*(rjupiter(i,2)/sqrt(modrjupiter(i+1)));
    ajupiter(i+1,3)=(Fg_const/modrjupiter(i+1))*(rjupiter(i,3)/sqrt(modrjupiter(i+1)));
    vjupiter(i+1,1)=vjupiter(i,1)+ajupiter(i+1,1)*dt;
    vjupiter(i+1,2)=vjupiter(i,2)+ajupiter(i+1,2)*dt;
    vjupiter(i+1,3)=vjupiter(i,3)+ajupiter(i+1,3)*dt;
    rjupiter(i+1,1)=rjupiter(i,1)+vjupiter(i,1)*dt+0.5*ajupiter(i,1)*(dt^2);
    rjupiter(i+1,2)=rjupiter(i,2)+vjupiter(i,2)*dt+0.5*ajupiter(i,2)*(dt^2);
    rjupiter(i+1,3)=rjupiter(i,3)+vjupiter(i,3)*dt+0.5*ajupiter(i,3)*(dt^2);



end


% 
% for i=1:tt
% 
%     modrsaturno(i+1)=rsaturno(i,1)^2+rsaturno(i,2)^2+rsaturno(i,3)^2;
%     asaturno(i+1,1)=(Fg_const/modrsaturno(i+1))*(rsaturno(i,1)/sqrt(modrsaturno(i+1)));
%     asaturno(i+1,2)=(Fg_const/modrsaturno(i+1))*(rsaturno(i,2)/sqrt(modrsaturno(i+1)));
%     asaturno(i+1,3)=(Fg_const/modrsaturno(i+1))*(rsaturno(i,3)/sqrt(modrsaturno(i+1)));
%     vsaturno(i+1,1)=vsaturno(i,1)+asaturno(i+1,1)*dt;
%     vsaturno(i+1,2)=vsaturno(i,2)+asaturno(i+1,2)*dt;
%     vsaturno(i+1,3)=vsaturno(i,3)+asaturno(i+1,3)*dt;
%     rsaturno(i+1,1)=rsaturno(i,1)+vsaturno(i,1)*dt+0.5*asaturno(i,1)*(dt^2);
%     rsaturno(i+1,2)=rsaturno(i,2)+vsaturno(i,2)*dt+0.5*asaturno(i,2)*(dt^2);
%     rsaturno(i+1,3)=rsaturno(i,3)+vsaturno(i,3)*dt+0.5*asaturno(i,3)*(dt^2);
% 
% 
% 
% end
% 
% 
% for i=1:tt
% 
%     modrurano(i+1)=rurano(i,1)^2+rurano(i,2)^2+rurano(i,3)^2;
%     aurano(i+1,1)=(Fg_const/modrurano(i+1))*(rurano(i,1)/sqrt(modrurano(i+1)));
%     aurano(i+1,2)=(Fg_const/modrurano(i+1))*(rurano(i,2)/sqrt(modrurano(i+1)));
%     aurano(i+1,3)=(Fg_const/modrurano(i+1))*(rurano(i,3)/sqrt(modrurano(i+1)));
%     vurano(i+1,1)=vurano(i,1)+aurano(i+1,1)*dt;
%     vurano(i+1,2)=vurano(i,2)+aurano(i+1,2)*dt;
%     vurano(i+1,3)=vurano(i,3)+aurano(i+1,3)*dt;
%     rurano(i+1,1)=rurano(i,1)+vurano(i,1)*dt+0.5*aurano(i,1)*(dt^2);
%     rurano(i+1,2)=rurano(i,2)+vurano(i,2)*dt+0.5*aurano(i,2)*(dt^2);
%     rurano(i+1,3)=rurano(i,3)+vurano(i,3)*dt+0.5*aurano(i,3)*(dt^2);
% 
% 
% 
% end
% 
% 
% for i=1:tt
% 
%     modrneptuno(i+1)=rneptuno(i,1)^2+rneptuno(i,2)^2+rneptuno(i,3)^2;
%     aneptuno(i+1,1)=(Fg_const/modrneptuno(i+1))*(rneptuno(i,1)/sqrt(modrneptuno(i+1)));
%     aneptuno(i+1,2)=(Fg_const/modrneptuno(i+1))*(rneptuno(i,2)/sqrt(modrneptuno(i+1)));
%     aneptuno(i+1,3)=(Fg_const/modrneptuno(i+1))*(rneptuno(i,3)/sqrt(modrneptuno(i+1)));
%     vneptuno(i+1,1)=vneptuno(i,1)+aneptuno(i+1,1)*dt;
%     vneptuno(i+1,2)=vneptuno(i,2)+aneptuno(i+1,2)*dt;
%     vneptuno(i+1,3)=vneptuno(i,3)+aneptuno(i+1,3)*dt;
%     rneptuno(i+1,1)=rneptuno(i,1)+vneptuno(i,1)*dt+0.5*aneptuno(i,1)*(dt^2);
%     rneptuno(i+1,2)=rneptuno(i,2)+vneptuno(i,2)*dt+0.5*aneptuno(i,2)*(dt^2);
%     rneptuno(i+1,3)=rneptuno(i,3)+vneptuno(i,3)*dt+0.5*aneptuno(i,3)*(dt^2);
% 
% 
% 
% end


for i=1:tt

    modrpluton(i+1)=rpluton(i,1)^2+rpluton(i,2)^2+rpluton(i,3)^2;
    apluton(i+1,1)=(Fg_const/modrpluton(i+1))*(rpluton(i,1)/sqrt(modrpluton(i+1)));
    apluton(i+1,2)=(Fg_const/modrpluton(i+1))*(rpluton(i,2)/sqrt(modrpluton(i+1)));
    apluton(i+1,3)=(Fg_const/modrpluton(i+1))*(rpluton(i,3)/sqrt(modrpluton(i+1)));
    vpluton(i+1,1)=vpluton(i,1)+apluton(i+1,1)*dt;
    vpluton(i+1,2)=vpluton(i,2)+apluton(i+1,2)*dt;
    vpluton(i+1,3)=vpluton(i,3)+apluton(i+1,3)*dt;
    rpluton(i+1,1)=rpluton(i,1)+vpluton(i,1)*dt+0.5*apluton(i,1)*(dt^2);
    rpluton(i+1,2)=rpluton(i,2)+vpluton(i,2)*dt+0.5*apluton(i,2)*(dt^2);
    rpluton(i+1,3)=rpluton(i,3)+vpluton(i,3)*dt+0.5*apluton(i,3)*(dt^2);



end


% primero el cálculo:


v_nave=zeros(tt,3);
a_nave=zeros(tt,3);
r_nave=zeros(tt,3);
modr_nave_sol=zeros(tt,1);







modr_nave_tierra=zeros(tt,1);
modr_nave_tierra(1)=1;
modr_nave_venus=zeros(tt,1);
modr_nave_mercurio=zeros(tt,1);
modr_nave_marte=zeros(tt,1);
modr_nave_jupiter=zeros(tt,1);
modr_nave_saturno=zeros(tt,1);
modr_nave_urano=zeros(tt,1);
modr_nave_neptuno=zeros(tt,1);
modr_nave_pluton=zeros(tt,1);

a_nave_tierra=zeros(tt,3);
a_nave_venus=zeros(tt,3);
a_nave_mercurio=zeros(tt,3);
a_nave_marte=zeros(tt,3);
a_nave_jupiter=zeros(tt,3);
a_nave_saturno=zeros(tt,3);
a_nave_neptuno=zeros(tt,3);
a_nave_urano=zeros(tt,3);
a_nave_pluton=zeros(tt,3);


plot3(0,0,0,'o','MarkerSize',10,'MarkerFaceColor','y')

hold on
plot3(r(:, 1), r(:, 2), r(:, 3), 'r','LineWidth',0.5);
hold off

%Representar dicha trayectoria en movimiento:
hold on
bola = plot3(r(1, 1), r(1, 2), r(1, 3), 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'b');
xlabel('Posición X');
ylabel('Posición Y');
zlabel('Posición Z');
title('Movimiento de la Partícula');
grid on;
N=6e12;
axis([-N,N,-N,N,-N,N]);
color_rgb_marte=[0.6350 0.0780 0.1840];
color_rgb_jupiter=[0.8500 0.3250 0.0980];
color_rgb_saturno=[0.9290 0.6940 0.1250];
color_rgb_urano=[0.3010 0.7450 0.9330];
color_rgb_neptuno=[0 0.4470 0.7410];
color_rgb_pluton=[1 0 1];
hold off
hold on
plot3(rmer(:, 1), rmer(:, 2), rmer(:, 3), 'r','LineWidth',0.5);
hold off

%Representar dicha trayectoria en movimiento:
hold on
bolamer = plot3(rmer(1, 1), rmer(1, 2), rmer(1, 3), 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'g');
hold off


hold on
%trayectorias
% plot3(rven(:, 1), rven(:, 2), rven(:, 3), 'r','LineWidth',0.5);
% plot3(rmarte(:, 1), rmarte(:, 2), rmarte(:, 3), 'Color', color_rgb_marte, 'LineWidth', 0.5);
plot3(rjupiter(:, 1), rjupiter(:, 2), rjupiter(:, 3), 'Color', color_rgb_jupiter','LineWidth',0.5);
% plot3(rsaturno(:, 1), rsaturno(:, 2), rsaturno(:, 3), 'Color', color_rgb_saturno,'LineWidth',0.5);
% plot3(rurano(:, 1), rurano(:, 2), rurano(:, 3),'Color', color_rgb_urano,'LineWidth',0.5);
% plot3(rneptuno(:, 1), rneptuno(:, 2), rneptuno(:, 3), 'Color', color_rgb_neptuno,'LineWidth',0.5);
plot3(rpluton(:, 1), rpluton(:, 2), rpluton(:, 3), 'Color', color_rgb_pluton,'LineWidth',0.5);


%movimiento de las pelotas:
% bolaven = plot3(rven(1, 1), rven(1, 2), rven(1, 3), 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'r');
% bolamarte = plot3(rmarte(1, 1), rmarte(1, 2), rmarte(1, 3), 'o', 'MarkerSize', 5, 'MarkerFaceColor', color_rgb_marte);
bolajupiter = plot3(rjupiter(1, 1), rjupiter(1, 2), rjupiter(1, 3), 'o', 'MarkerSize', 5, 'MarkerFaceColor',  color_rgb_jupiter');
% bolasaturno = plot3(rsaturno(1, 1), rsaturno(1, 2), rsaturno(1, 3), 'o', 'MarkerSize', 5, 'MarkerFaceColor',  color_rgb_saturno);
% bolaurano = plot3(rurano(1, 1), rurano(1, 2), rurano(1, 3), 'o', 'MarkerSize', 5, 'MarkerFaceColor',  color_rgb_urano);
% bolaneptuno = plot3(rneptuno(1, 1), rneptuno(1, 2), rneptuno(1, 3), 'o', 'MarkerSize', 5, 'MarkerFaceColor',  color_rgb_neptuno);
bolapluton = plot3(rpluton(1, 1), rpluton(1, 2), rpluton(1, 3), 'o', 'MarkerSize', 5, 'MarkerFaceColor',  color_rgb_pluton);


hold off

r_nave(tt,1)=rpluton(tt,1)+9.154034e6;
r_nave(tt,2)=rpluton(tt,2);
r_nave(tt,3)=rpluton(tt,3);
rango=1.5e10;



dv=1; %aqui esta el programa que me calcularía la mejor velocidad final guardándolo en una variable l
vmax=3e3;
vmin=0;
K=(vmax-vmin)/dv;
Ec_salida=zeros(K,1);
for l=1:K
    v_nave(tt,:)=[0,vmin+(dv*l),0];
    for i=tt:-1:2

        a_nave(i-1,1)=((Fg_const/modr_nave_sol(i-1))*(r_nave(i,1)/sqrt(modr_nave_sol(i-1)))) + a_nave_tierra(i,1) + a_nave_venus(i,1) + a_nave_mercurio(i,1) +a_nave_marte(i,1) +a_nave_jupiter(i,1)+a_nave_saturno(i,1)+a_nave_urano(i,1)+a_nave_neptuno(i,1)+a_nave_pluton(i,1);
        a_nave(i-1,2)=(Fg_const/modr_nave_sol(i-1))*(r_nave(i,2)/sqrt(modr_nave_sol(i-1))) + a_nave_tierra(i,2)+ a_nave_venus(i,2)+ a_nave_mercurio(i,2)+a_nave_marte(i,2) +a_nave_jupiter(i,2)+a_nave_saturno(i,2)+a_nave_urano(i,2)+a_nave_neptuno(i,2)+a_nave_pluton(i,2);
        a_nave(i-1,3)=(Fg_const/modr_nave_sol(i-1))*(r_nave(i,3)/sqrt(modr_nave_sol(i-1)))  + a_nave_tierra(i,3)+ a_nave_venus(i,3)+ a_nave_mercurio(i,3)+a_nave_marte(i,3) +a_nave_jupiter(i,3)+a_nave_saturno(i,3)+a_nave_urano(i,3)+a_nave_neptuno(i,3)+a_nave_pluton(i,3);




        modr_nave_sol(i-1)=r_nave(i,1)^2+r_nave(i,2)^2+r_nave(i,3)^2;
        modr_nave_tierra(i-1)=(r_nave(i,1)-r(i,1))^2+(r_nave(i,2)-r(i,2))^2+(r_nave(i,3)-r(i,3))^2+radiotierra;
        % modr_nave_venus(i-1)=(r_nave(i,1)-rven(i,1))^2+(r(i,2)-rven(i,2))^2+(r_nave(i,3)-rven(i,3))^2;
        % modr_nave_mercurio(i-1)=(r_nave(i,1)-rmer(i,1))^2+(r_nave(i,2)-rmer(i,2))^2+(r_nave(i,3)-rmer(i,3))^2;
        % modr_nave_marte(i-1)=(r_nave(i,1)-rmarte(i,1))^2+(r_nave(i,2)-rmarte(i,2))^2+(r_nave(i,3)-rmarte(i,3))^2;
        modr_nave_jupiter(i-1)=(r_nave(i,1)-rjupiter(i,1))^2+(r_nave(i,2)-rjupiter(i,2))^2+(r_nave(i,3)-rjupiter(i,3))^2;
        % modr_nave_saturno(i-1)=(r_nave(i,1)-rsaturno(i,1))^2+(r_nave(i,2)-rsaturno(i,2))^2+(r_nave(i,3)-rsaturno(i,3))^2;
        % modr_nave_urano(i-1)=(r_nave(i,1)-rurano(i,1))^2+(r_nave(i,2)-rurano(i,2))^2+(r_nave(i,3)-rurano(i,3))^2;
        % modr_nave_neptuno(i-1)=(r_nave(i,1)-rneptuno(i,1))^2+(r_nave(i,2)-rneptuno(i,2))^2+(r_nave(i,3)-rneptuno(i,3))^2;
        modr_nave_pluton(i-1)=(r_nave(i,1)-rpluton(i,1))^2+(r_nave(i,2)-rpluton(i,2))^2+(r_nave(i,3)-rpluton(i,3))^2;


        %aceleracion sufrida por la nave total;
        a_nave(i-1,1)=((Fg_const/modr_nave_sol(i-1))*(r_nave(i,1)/sqrt(modr_nave_sol(i-1)))) + a_nave_tierra(i,1) + a_nave_venus(i,1) + a_nave_mercurio(i,1) +a_nave_marte(i,1) +a_nave_jupiter(i,1)+a_nave_saturno(i,1)+a_nave_urano(i,1)+a_nave_neptuno(i,1)+a_nave_pluton(i,1);
        a_nave(i-1,2)=(Fg_const/modr_nave_sol(i-1))*(r_nave(i,2)/sqrt(modr_nave_sol(i-1))) + a_nave_tierra(i,2)+ a_nave_venus(i,2)+ a_nave_mercurio(i,2)+a_nave_marte(i,2) +a_nave_jupiter(i,2)+a_nave_saturno(i,2)+a_nave_urano(i,2)+a_nave_neptuno(i,2)+a_nave_pluton(i,2);
        a_nave(i-1,3)=(Fg_const/modr_nave_sol(i-1))*(r_nave(i,3)/sqrt(modr_nave_sol(i-1)))  + a_nave_tierra(i,3)+ a_nave_venus(i,3)+ a_nave_mercurio(i,3)+a_nave_marte(i,3) +a_nave_jupiter(i,3)+a_nave_saturno(i,3)+a_nave_urano(i,3)+a_nave_neptuno(i,3)+a_nave_pluton(i,3);

        %Como le afecta la tierra:
        a_nave_tierra(i-1,1)=((-G*m_tierra)/modr_nave_tierra(i-1))*((r_nave(i,1)-r(i,1))/sqrt(modr_nave_tierra(i-1)));
        a_nave_tierra(i-1,2)=((-G*m_tierra)/modr_nave_tierra(i-1))*((r_nave(i,2)-r(i,2))/sqrt(modr_nave_tierra(i-1)));
        a_nave_tierra(i-1,3)=((-G*m_tierra)/modr_nave_tierra(i-1))*((r_nave(i,3)-r(i,3))/sqrt(modr_nave_tierra(i-1)));

        %Como le afecta venus a la nave:
       %  a_nave_venus(i-1,1)=((-G*m_venus)/modr_nave_venus(i-1))*((r_nave(i,1)-rven(i,1))/sqrt(modr_nave_venus(i-1)));
       %  a_nave_venus(i-1,2)=((-G*m_venus)/modr_nave_venus(i-1))*((r_nave(i,2)-rven(i,2))/sqrt(modr_nave_venus(i-1)));
       %  a_nave_venus(i-1,3)=((-G*m_venus)/modr_nave_venus(i-1))*((r_nave(i,3)-rven(i,3))/sqrt(modr_nave_venus(i-1)));
       % 
       % %  %como le afecta mercurio a la nave:
       %  a_nave_mercurio(i-1,1)=((-G*m_mercurio)/modr_nave_mercurio(i-1))*((r_nave(i,1)-rmer(i,1))/sqrt(modr_nave_mercurio(i-1)));
       %  a_nave_mercurio(i-1,2)=((-G*m_mercurio)/modr_nave_mercurio(i-1))*((r_nave(i,2)-rmer(i,2))/sqrt(modr_nave_mercurio(i-1)));
       %  a_nave_mercurio(i-1,3)=((-G*m_mercurio)/modr_nave_mercurio(i-1))*((r_nave(i,3)-rmer(i,3))/sqrt(modr_nave_mercurio(i-1)));
       % 
       % 
       % %  %como le afecta marte a la nave;
       %  a_nave_marte(i-1,1)=((-G*m_marte)/modr_nave_marte(i-1))*((r_nave(i,1)-rmarte(i,1))/sqrt(modr_nave_marte(i-1)));
       %  a_nave_marte(i-1,2)=((-G*m_marte)/modr_nave_marte(i-1))*((r_nave(i,2)-rmarte(i,2))/sqrt(modr_nave_marte(i-1)));
       %  a_nave_marte(i-1,3)=((-G*m_marte)/modr_nave_marte(i-1))*((r_nave(i,3)-rmarte(i,3))/sqrt(modr_nave_marte(i-1)));


       %  %como le afecta jupiter a la nave:
        a_nave_jupiter(i-1,1)=((-G*m_jupiter)/modr_nave_jupiter(i-1))*((r_nave(i,1)-rjupiter(i,1))/sqrt(modr_nave_jupiter(i-1)));
        a_nave_jupiter(i-1,2)=((-G*m_jupiter)/modr_nave_jupiter(i-1))*((r_nave(i,2)-rjupiter(i,2))/sqrt(modr_nave_jupiter(i-1)));
        a_nave_jupiter(i-1,3)=((-G*m_jupiter)/modr_nave_jupiter(i-1))*((r_nave(i,3)-rjupiter(i,3))/sqrt(modr_nave_jupiter(i-1)));

       %  %como le afecta saturno a la nave:
       % a_nave_saturno(i-1,1)=((-G*m_saturno)/modr_nave_saturno(i-1))*((r_nave(i,1)-rsaturno(i,1))/sqrt(modr_nave_saturno(i-1)));
       % a_nave_saturno(i-1,2)=((-G*m_saturno)/modr_nave_saturno(i-1))*((r_nave(i,2)-rsaturno(i,2))/sqrt(modr_nave_saturno(i-1)));
       % a_nave_saturno(i-1,3)=((-G*m_saturno)/modr_nave_saturno(i-1))*((r_nave(i,3)-rsaturno(i,3))/sqrt(modr_nave_saturno(i-1)));
       % 
       % % %como le afecta urano a la nave:
       % a_nave_urano(i-1,1)=((-G*m_urano)/modr_nave_urano(i-1))*((r_nave(i,1)-rurano(i,1))/sqrt(modr_nave_urano(i-1)));
       % a_nave_urano(i-1,2)=((-G*m_urano)/modr_nave_urano(i-1))*((r_nave(i,2)-rurano(i,2))/sqrt(modr_nave_urano(i-1)));
       % a_nave_urano(i-1,3)=((-G*m_urano)/modr_nave_urano(i-1))*((r_nave(i,3)-rurano(i,3))/sqrt(modr_nave_urano(i-1)));
       % 
       % % %como le afecta neptuno a la nave:
       % a_nave_neptuno(i-1,1)=((-G*m_neptuno)/modr_nave_neptuno(i-1))*((r_nave(i,1)-rneptuno(i,1))/sqrt(modr_nave_neptuno(i-1)));
       % a_nave_neptuno(i-1,2)=((-G*m_neptuno)/modr_nave_neptuno(i-1))*((r_nave(i,2)-rneptuno(i,2))/sqrt(modr_nave_neptuno(i-1)));
       % a_nave_neptuno(i-1,3)=((-G*m_neptuno)/modr_nave_neptuno(i-1))*((r_nave(i,3)-rneptuno(i,3))/sqrt(modr_nave_neptuno(i-1)));


       % %como le afecta plutón a la nave:
       a_nave_pluton(i-1,1)=((-G*m_pluton)/modr_nave_pluton(i-1))*((r_nave(i,1)-rpluton(i,1))/sqrt(modr_nave_pluton(i-1)));
       a_nave_pluton(i-1,2)=((-G*m_pluton)/modr_nave_pluton(i-1))*((r_nave(i,2)-rpluton(i,2))/sqrt(modr_nave_pluton(i-1)));
       a_nave_pluton(i-1,3)=((-G*m_pluton)/modr_nave_pluton(i-1))*((r_nave(i,3)-rpluton(i,3))/sqrt(modr_nave_pluton(i-1)));





        v_nave(i-1,1)=v_nave(i,1)+a_nave(i-1,1)*dt;
        v_nave(i-1,2)=v_nave(i,2)+a_nave(i-1,2)*dt;
        v_nave(i-1,3)=v_nave(i,3)+a_nave(i-1,3)*dt;
        r_nave(i-1,1)=r_nave(i,1)+v_nave(i,1)*dt+0.5*a_nave(i,1)*(dt^2);
        r_nave(i-1,2)=r_nave(i,2)+v_nave(i,2)*dt+0.5*a_nave(i,2)*(dt^2);
        r_nave(i-1,3)=r_nave(i,3)+v_nave(i,3)*dt+0.5*a_nave(i,3)*(dt^2);
        if norm(r_nave(i-1,:)-rjupiter(i-1,:)) < rango && 0 < r_nave(i-1,2) && r_nave(i-1,2) < rango + 7.78371e11
            pto_salida=r_nave(i,:);
            break 
        elseif r_nave(i-1,1) < -1e12
            break
        end

     end
    if 0 < r_nave(i-1,2) && r_nave(i-1,2) < rango + 7.78371e11
        break
    end
    m_nave=2e3;%kg
    if norm(r_nave(i-1,:)-rjupiter(i-1,:)) < rango
        v_salida=-v_nave(i,:)-vjupiter(i,:);
        Ec_salida(l,1)=0.5*m_nave*(norm(v_salida))^2;
    else
        Ec_salida(l,1)=1e90;
    end
 
end
[posicion_oprtima2,l]=min(Ec_salida);


a_nave=zeros(tt,3);
v_nave=zeros(tt,3);
% dv=10;
% l=190;
v_nave(tt,:)=[0,(dv*l),0]; 
r_nave=zeros(tt,3);
r_nave(tt,1)=rpluton(tt,1)+9.154034e6;
r_nave(tt,2)=rpluton(tt,2);
r_nave(tt,3)=rpluton(tt,3);
for i=tt:-1:2

        a_nave(i-1,1)=((Fg_const/modr_nave_sol(i-1))*(r_nave(i,1)/sqrt(modr_nave_sol(i-1)))) + a_nave_tierra(i,1) + a_nave_venus(i,1) + a_nave_mercurio(i,1) +a_nave_marte(i,1) +a_nave_jupiter(i,1)+a_nave_saturno(i,1)+a_nave_urano(i,1)+a_nave_neptuno(i,1)+a_nave_pluton(i,1);
        a_nave(i-1,2)=(Fg_const/modr_nave_sol(i-1))*(r_nave(i,2)/sqrt(modr_nave_sol(i-1))) + a_nave_tierra(i,2)+ a_nave_venus(i,2)+ a_nave_mercurio(i,2)+a_nave_marte(i,2) +a_nave_jupiter(i,2)+a_nave_saturno(i,2)+a_nave_urano(i,2)+a_nave_neptuno(i,2)+a_nave_pluton(i,2);
        a_nave(i-1,3)=(Fg_const/modr_nave_sol(i-1))*(r_nave(i,3)/sqrt(modr_nave_sol(i-1)))  + a_nave_tierra(i,3)+ a_nave_venus(i,3)+ a_nave_mercurio(i,3)+a_nave_marte(i,3) +a_nave_jupiter(i,3)+a_nave_saturno(i,3)+a_nave_urano(i,3)+a_nave_neptuno(i,3)+a_nave_pluton(i,3);




        modr_nave_sol(i-1)=r_nave(i,1)^2+r_nave(i,2)^2+r_nave(i,3)^2;
        modr_nave_tierra(i-1)=(r_nave(i,1)-r(i,1))^2+(r_nave(i,2)-r(i,2))^2+(r_nave(i,3)-r(i,3))^2+radiotierra;
        % modr_nave_venus(i-1)=(r_nave(i,1)-rven(i,1))^2+(r(i,2)-rven(i,2))^2+(r_nave(i,3)-rven(i,3))^2;
        % modr_nave_mercurio(i-1)=(r_nave(i,1)-rmer(i,1))^2+(r_nave(i,2)-rmer(i,2))^2+(r_nave(i,3)-rmer(i,3))^2;
        % modr_nave_marte(i-1)=(r_nave(i,1)-rmarte(i,1))^2+(r_nave(i,2)-rmarte(i,2))^2+(r_nave(i,3)-rmarte(i,3))^2;
        modr_nave_jupiter(i-1)=(r_nave(i,1)-rjupiter(i,1))^2+(r_nave(i,2)-rjupiter(i,2))^2+(r_nave(i,3)-rjupiter(i,3))^2;
        % modr_nave_saturno(i-1)=(r_nave(i,1)-rsaturno(i,1))^2+(r_nave(i,2)-rsaturno(i,2))^2+(r_nave(i,3)-rsaturno(i,3))^2;
        % modr_nave_urano(i-1)=(r_nave(i,1)-rurano(i,1))^2+(r_nave(i,2)-rurano(i,2))^2+(r_nave(i,3)-rurano(i,3))^2;
        % modr_nave_neptuno(i-1)=(r_nave(i,1)-rneptuno(i,1))^2+(r_nave(i,2)-rneptuno(i,2))^2+(r_nave(i,3)-rneptuno(i,3))^2;
        modr_nave_pluton(i-1)=(r_nave(i,1)-rpluton(i,1))^2+(r_nave(i,2)-rpluton(i,2))^2+(r_nave(i,3)-rpluton(i,3))^2;


        %aceleracion sufrida por la nave total;
        a_nave(i-1,1)=((Fg_const/modr_nave_sol(i-1))*(r_nave(i,1)/sqrt(modr_nave_sol(i-1)))) + a_nave_tierra(i,1) + a_nave_venus(i,1) + a_nave_mercurio(i,1) +a_nave_marte(i,1) +a_nave_jupiter(i,1)+a_nave_saturno(i,1)+a_nave_urano(i,1)+a_nave_neptuno(i,1)+a_nave_pluton(i,1);
        a_nave(i-1,2)=(Fg_const/modr_nave_sol(i-1))*(r_nave(i,2)/sqrt(modr_nave_sol(i-1))) + a_nave_tierra(i,2)+ a_nave_venus(i,2)+ a_nave_mercurio(i,2)+a_nave_marte(i,2) +a_nave_jupiter(i,2)+a_nave_saturno(i,2)+a_nave_urano(i,2)+a_nave_neptuno(i,2)+a_nave_pluton(i,2);
        a_nave(i-1,3)=(Fg_const/modr_nave_sol(i-1))*(r_nave(i,3)/sqrt(modr_nave_sol(i-1)))  + a_nave_tierra(i,3)+ a_nave_venus(i,3)+ a_nave_mercurio(i,3)+a_nave_marte(i,3) +a_nave_jupiter(i,3)+a_nave_saturno(i,3)+a_nave_urano(i,3)+a_nave_neptuno(i,3)+a_nave_pluton(i,3);

        %Como le afecta la tierra:
        % a_nave_tierra(i-1,1)=((-G*m_tierra)/modr_nave_tierra(i-1))*((r_nave(i,1)-r(i,1))/sqrt(modr_nave_tierra(i-1)));
        % a_nave_tierra(i-1,2)=((-G*m_tierra)/modr_nave_tierra(i-1))*((r_nave(i,2)-r(i,2))/sqrt(modr_nave_tierra(i-1)));
        % a_nave_tierra(i-1,3)=((-G*m_tierra)/modr_nave_tierra(i-1))*((r_nave(i,3)-r(i,3))/sqrt(modr_nave_tierra(i-1)));

       %  %Como le afecta venus a la nave:
       %  a_nave_venus(i-1,1)=((-G*m_venus)/modr_nave_venus(i-1))*((r_nave(i,1)-rven(i,1))/sqrt(modr_nave_venus(i-1)));
       %  a_nave_venus(i-1,2)=((-G*m_venus)/modr_nave_venus(i-1))*((r_nave(i,2)-rven(i,2))/sqrt(modr_nave_venus(i-1)));
       %  a_nave_venus(i-1,3)=((-G*m_venus)/modr_nave_venus(i-1))*((r_nave(i,3)-rven(i,3))/sqrt(modr_nave_venus(i-1)));
       % 
       % %  %como le afecta mercurio a la nave:
       %  a_nave_mercurio(i-1,1)=((-G*m_mercurio)/modr_nave_mercurio(i-1))*((r_nave(i,1)-rmer(i,1))/sqrt(modr_nave_mercurio(i-1)));
       %  a_nave_mercurio(i-1,2)=((-G*m_mercurio)/modr_nave_mercurio(i-1))*((r_nave(i,2)-rmer(i,2))/sqrt(modr_nave_mercurio(i-1)));
       %  a_nave_mercurio(i-1,3)=((-G*m_mercurio)/modr_nave_mercurio(i-1))*((r_nave(i,3)-rmer(i,3))/sqrt(modr_nave_mercurio(i-1)));
       % 
       % 
       % %  %como le afecta marte a la nave;
       %  a_nave_marte(i-1,1)=((-G*m_marte)/modr_nave_marte(i-1))*((r_nave(i,1)-rmarte(i,1))/sqrt(modr_nave_marte(i-1)));
       %  a_nave_marte(i-1,2)=((-G*m_marte)/modr_nave_marte(i-1))*((r_nave(i,2)-rmarte(i,2))/sqrt(modr_nave_marte(i-1)));
       %  a_nave_marte(i-1,3)=((-G*m_marte)/modr_nave_marte(i-1))*((r_nave(i,3)-rmarte(i,3))/sqrt(modr_nave_marte(i-1)));
       % 

       %  %como le afecta jupiter a la nave:
        a_nave_jupiter(i-1,1)=((-G*m_jupiter)/modr_nave_jupiter(i-1))*((r_nave(i,1)-rjupiter(i,1))/sqrt(modr_nave_jupiter(i-1)));
        a_nave_jupiter(i-1,2)=((-G*m_jupiter)/modr_nave_jupiter(i-1))*((r_nave(i,2)-rjupiter(i,2))/sqrt(modr_nave_jupiter(i-1)));
        a_nave_jupiter(i-1,3)=((-G*m_jupiter)/modr_nave_jupiter(i-1))*((r_nave(i,3)-rjupiter(i,3))/sqrt(modr_nave_jupiter(i-1)));

       %  %como le afecta saturno a la nave:
       % a_nave_saturno(i-1,1)=((-G*m_saturno)/modr_nave_saturno(i-1))*((r_nave(i,1)-rsaturno(i,1))/sqrt(modr_nave_saturno(i-1)));
       % a_nave_saturno(i-1,2)=((-G*m_saturno)/modr_nave_saturno(i-1))*((r_nave(i,2)-rsaturno(i,2))/sqrt(modr_nave_saturno(i-1)));
       % a_nave_saturno(i-1,3)=((-G*m_saturno)/modr_nave_saturno(i-1))*((r_nave(i,3)-rsaturno(i,3))/sqrt(modr_nave_saturno(i-1)));
       % 
       % % %como le afecta urano a la nave:
       % a_nave_urano(i-1,1)=((-G*m_urano)/modr_nave_urano(i-1))*((r_nave(i,1)-rurano(i,1))/sqrt(modr_nave_urano(i-1)));
       % a_nave_urano(i-1,2)=((-G*m_urano)/modr_nave_urano(i-1))*((r_nave(i,2)-rurano(i,2))/sqrt(modr_nave_urano(i-1)));
       % a_nave_urano(i-1,3)=((-G*m_urano)/modr_nave_urano(i-1))*((r_nave(i,3)-rurano(i,3))/sqrt(modr_nave_urano(i-1)));
       % 
       % % %como le afecta neptuno a la nave:
       % a_nave_neptuno(i-1,1)=((-G*m_neptuno)/modr_nave_neptuno(i-1))*((r_nave(i,1)-rneptuno(i,1))/sqrt(modr_nave_neptuno(i-1)));
       % a_nave_neptuno(i-1,2)=((-G*m_neptuno)/modr_nave_neptuno(i-1))*((r_nave(i,2)-rneptuno(i,2))/sqrt(modr_nave_neptuno(i-1)));
       % a_nave_neptuno(i-1,3)=((-G*m_neptuno)/modr_nave_neptuno(i-1))*((r_nave(i,3)-rneptuno(i,3))/sqrt(modr_nave_neptuno(i-1)));


       % %como le afecta plutón a la nave:
       a_nave_pluton(i-1,1)=((-G*m_pluton)/modr_nave_pluton(i-1))*((r_nave(i,1)-rpluton(i,1))/sqrt(modr_nave_pluton(i-1)));
       a_nave_pluton(i-1,2)=((-G*m_pluton)/modr_nave_pluton(i-1))*((r_nave(i,2)-rpluton(i,2))/sqrt(modr_nave_pluton(i-1)));
       a_nave_pluton(i-1,3)=((-G*m_pluton)/modr_nave_pluton(i-1))*((r_nave(i,3)-rpluton(i,3))/sqrt(modr_nave_pluton(i-1)));





        v_nave(i-1,1)=v_nave(i,1)+a_nave(i-1,1)*dt;
        v_nave(i-1,2)=v_nave(i,2)+a_nave(i-1,2)*dt;
        v_nave(i-1,3)=v_nave(i,3)+a_nave(i-1,3)*dt;
        r_nave(i-1,1)=r_nave(i,1)+v_nave(i,1)*dt+0.5*a_nave(i,1)*(dt^2);
        r_nave(i-1,2)=r_nave(i,2)+v_nave(i,2)*dt+0.5*a_nave(i,2)*(dt^2);
        r_nave(i-1,3)=r_nave(i,3)+v_nave(i,3)*dt+0.5*a_nave(i,3)*(dt^2);
        if norm(r_nave(i-1,:)-rjupiter(i-1,:)) < rango && 0 < r_nave(i-1,2) && r_nave(i-1,2) < rango + 7.78371e11
            pto_salida=r_nave(i,:);
            break 
        elseif r_nave(i-1,1) < -1e12
            break
        end
end
m_nave=2e3;%kg
v_salida_jupiter=-v_nave(i,:)-vjupiter(i,:);
Ec_salida_jupiter=0.5*m_nave*(norm(v_salida_jupiter))^2; 




%Aqui va la segunda integral desde júpiter a la tierra

rango_tierra=0.1e10;

dv=10; %aqui esta el programa que me calcularía la mejor velocidad final guardándolo en una variable l
vmax=1e4;
vmin=-1e4;
K=(vmax-vmin)/dv;
Ec_salida_tierra=zeros(K,1);
r_nave(1,:)=r0;
for L=1:K
    v_nave(1,:)=v(1,:);
    u=round(3.15576e7/dt)/2;
    
for w=1:1:i-2

        a_nave(w+1,1)=((Fg_const/modr_nave_sol(w+1))*(r_nave(w,1)/sqrt(modr_nave_sol(w+1)))) + a_nave_tierra(w,1) + a_nave_venus(w,1) + a_nave_mercurio(w,1) +a_nave_marte(w,1) +a_nave_jupiter(w,1)+a_nave_saturno(w,1)+a_nave_urano(w,1)+a_nave_neptuno(w,1)+a_nave_pluton(w,1);
        a_nave(w+1,2)=(Fg_const/modr_nave_sol(w+1))*(r_nave(w,2)/sqrt(modr_nave_sol(w+1))) + a_nave_tierra(w,2)+ a_nave_venus(w,2)+ a_nave_mercurio(w,2)+a_nave_marte(w,2) +a_nave_jupiter(w,2)+a_nave_saturno(w,2)+a_nave_urano(w,2)+a_nave_neptuno(w,2)+a_nave_pluton(w,2);
        a_nave(w+1,3)=(Fg_const/modr_nave_sol(w+1))*(r_nave(w,3)/sqrt(modr_nave_sol(w+1)))  + a_nave_tierra(w,3)+ a_nave_venus(w,3)+ a_nave_mercurio(w,3)+a_nave_marte(w,3) +a_nave_jupiter(w,3)+a_nave_saturno(w,3)+a_nave_urano(w,3)+a_nave_neptuno(w,3)+a_nave_pluton(w,3);




        modr_nave_sol(w+1)=r_nave(w,1)^2+r_nave(w,2)^2+r_nave(w,3)^2;
        modr_nave_tierra(w+1)=(r_nave(w,1)-r(w,1))^2+(r_nave(w,2)-r(w,2))^2+(r_nave(w,3)-r(w,3))^2+radiotierra;
        % modr_nave_venus(i-1)=(r_nave(i,1)-rven(i,1))^2+(r(i,2)-rven(i,2))^2+(r_nave(i,3)-rven(i,3))^2;
        % modr_nave_mercurio(i-1)=(r_nave(i,1)-rmer(i,1))^2+(r_nave(i,2)-rmer(i,2))^2+(r_nave(i,3)-rmer(i,3))^2;
        % modr_nave_marte(i-1)=(r_nave(i,1)-rmarte(i,1))^2+(r_nave(i,2)-rmarte(i,2))^2+(r_nave(i,3)-rmarte(i,3))^2;
        modr_nave_jupiter(w+1)=(r_nave(w,1)-rjupiter(w,1))^2+(r_nave(w,2)-rjupiter(w,2))^2+(r_nave(w,3)-rjupiter(w,3))^2;
        % modr_nave_saturno(i-1)=(r_nave(i,1)-rsaturno(i,1))^2+(r_nave(i,2)-rsaturno(i,2))^2+(r_nave(i,3)-rsaturno(i,3))^2;
        % modr_nave_urano(i-1)=(r_nave(i,1)-rurano(i,1))^2+(r_nave(i,2)-rurano(i,2))^2+(r_nave(i,3)-rurano(i,3))^2;
        % modr_nave_neptuno(i-1)=(r_nave(i,1)-rneptuno(i,1))^2+(r_nave(i,2)-rneptuno(i,2))^2+(r_nave(i,3)-rneptuno(i,3))^2;
        modr_nave_pluton(w+1)=(r_nave(w,1)-rpluton(w,1))^2+(r_nave(w,2)-rpluton(w,2))^2+(r_nave(w,3)-rpluton(w,3))^2;


        %aceleracion sufrida por la nave total;
        a_nave(w+1,1)=((Fg_const/modr_nave_sol(w+1))*(r_nave(w,1)/sqrt(modr_nave_sol(w+1)))) + a_nave_tierra(w,1) + a_nave_venus(w,1) + a_nave_mercurio(w,1) +a_nave_marte(w,1) +a_nave_jupiter(w,1)+a_nave_saturno(w,1)+a_nave_urano(w,1)+a_nave_neptuno(w,1)+a_nave_pluton(w,1);
        a_nave(w+1,2)=(Fg_const/modr_nave_sol(w+1))*(r_nave(w,2)/sqrt(modr_nave_sol(w+1))) + a_nave_tierra(w,2)+ a_nave_venus(w,2)+ a_nave_mercurio(w,2)+a_nave_marte(w,2) +a_nave_jupiter(w,2)+a_nave_saturno(w,2)+a_nave_urano(w,2)+a_nave_neptuno(w,2)+a_nave_pluton(w,2);
        a_nave(w+1,3)=(Fg_const/modr_nave_sol(w+1))*(r_nave(w,3)/sqrt(modr_nave_sol(w+1)))  + a_nave_tierra(w,3)+ a_nave_venus(w,3)+ a_nave_mercurio(w,3)+a_nave_marte(w,3) +a_nave_jupiter(w,3)+a_nave_saturno(w,3)+a_nave_urano(w,3)+a_nave_neptuno(w,3)+a_nave_pluton(w,3);

        %Como le afecta la tierra:
        % a_nave_tierra(w+1,1)=((-G*m_tierra)/modr_nave_tierra(w+1))*((r_nave(w,1)-r(w,1))/sqrt(modr_nave_tierra(w+1)));
        % a_nave_tierra(w+1,2)=((-G*m_tierra)/modr_nave_tierra(w+1))*((r_nave(w,2)-r(w,2))/sqrt(modr_nave_tierra(w+1)));
        % a_nave_tierra(w+1,3)=((-G*m_tierra)/modr_nave_tierra(w+1))*((r_nave(w,3)-r(w,3))/sqrt(modr_nave_tierra(w+1)));

       %  %Como le afecta venus a la nave:
       %  a_nave_venus(i-1,1)=((-G*m_venus)/modr_nave_venus(i-1))*((r_nave(i,1)-rven(i,1))/sqrt(modr_nave_venus(i-1)));
       %  a_nave_venus(i-1,2)=((-G*m_venus)/modr_nave_venus(i-1))*((r_nave(i,2)-rven(i,2))/sqrt(modr_nave_venus(i-1)));
       %  a_nave_venus(i-1,3)=((-G*m_venus)/modr_nave_venus(i-1))*((r_nave(i,3)-rven(i,3))/sqrt(modr_nave_venus(i-1)));
       % 
       % %  %como le afecta mercurio a la nave:
       %  a_nave_mercurio(i-1,1)=((-G*m_mercurio)/modr_nave_mercurio(i-1))*((r_nave(i,1)-rmer(i,1))/sqrt(modr_nave_mercurio(i-1)));
       %  a_nave_mercurio(i-1,2)=((-G*m_mercurio)/modr_nave_mercurio(i-1))*((r_nave(i,2)-rmer(i,2))/sqrt(modr_nave_mercurio(i-1)));
       %  a_nave_mercurio(i-1,3)=((-G*m_mercurio)/modr_nave_mercurio(i-1))*((r_nave(i,3)-rmer(i,3))/sqrt(modr_nave_mercurio(i-1)));
       % 
       % 
       % %  %como le afecta marte a la nave;
       %  a_nave_marte(i-1,1)=((-G*m_marte)/modr_nave_marte(i-1))*((r_nave(i,1)-rmarte(i,1))/sqrt(modr_nave_marte(i-1)));
       %  a_nave_marte(i-1,2)=((-G*m_marte)/modr_nave_marte(i-1))*((r_nave(i,2)-rmarte(i,2))/sqrt(modr_nave_marte(i-1)));
       %  a_nave_marte(i-1,3)=((-G*m_marte)/modr_nave_marte(i-1))*((r_nave(i,3)-rmarte(i,3))/sqrt(modr_nave_marte(i-1)));
       % 

       %  %como le afecta jupiter a la nave:
        a_nave_jupiter(w+1,1)=((-G*m_jupiter)/modr_nave_jupiter(w+1))*((r_nave(w,1)-rjupiter(w,1))/sqrt(modr_nave_jupiter(w+1)));
        a_nave_jupiter(w+1,2)=((-G*m_jupiter)/modr_nave_jupiter(w+1))*((r_nave(w,2)-rjupiter(w,2))/sqrt(modr_nave_jupiter(w+1)));
        a_nave_jupiter(w+1,3)=((-G*m_jupiter)/modr_nave_jupiter(w+1))*((r_nave(w,3)-rjupiter(w,3))/sqrt(modr_nave_jupiter(w+1)));

       %  %como le afecta saturno a la nave:
       % a_nave_saturno(i-1,1)=((-G*m_saturno)/modr_nave_saturno(i-1))*((r_nave(i,1)-rsaturno(i,1))/sqrt(modr_nave_saturno(i-1)));
       % a_nave_saturno(i-1,2)=((-G*m_saturno)/modr_nave_saturno(i-1))*((r_nave(i,2)-rsaturno(i,2))/sqrt(modr_nave_saturno(i-1)));
       % a_nave_saturno(i-1,3)=((-G*m_saturno)/modr_nave_saturno(i-1))*((r_nave(i,3)-rsaturno(i,3))/sqrt(modr_nave_saturno(i-1)));
       % 
       % % %como le afecta urano a la nave:
       % a_nave_urano(i-1,1)=((-G*m_urano)/modr_nave_urano(i-1))*((r_nave(i,1)-rurano(i,1))/sqrt(modr_nave_urano(i-1)));
       % a_nave_urano(i-1,2)=((-G*m_urano)/modr_nave_urano(i-1))*((r_nave(i,2)-rurano(i,2))/sqrt(modr_nave_urano(i-1)));
       % a_nave_urano(i-1,3)=((-G*m_urano)/modr_nave_urano(i-1))*((r_nave(i,3)-rurano(i,3))/sqrt(modr_nave_urano(i-1)));
       % 
       % % %como le afecta neptuno a la nave:
       % a_nave_neptuno(i-1,1)=((-G*m_neptuno)/modr_nave_neptuno(i-1))*((r_nave(i,1)-rneptuno(i,1))/sqrt(modr_nave_neptuno(i-1)));
       % a_nave_neptuno(i-1,2)=((-G*m_neptuno)/modr_nave_neptuno(i-1))*((r_nave(i,2)-rneptuno(i,2))/sqrt(modr_nave_neptuno(i-1)));
       % a_nave_neptuno(i-1,3)=((-G*m_neptuno)/modr_nave_neptuno(i-1))*((r_nave(i,3)-rneptuno(i,3))/sqrt(modr_nave_neptuno(i-1)));


       % %como le afecta plutón a la nave:
       a_nave_pluton(w+1,1)=((-G*m_pluton)/modr_nave_pluton(w+1))*((r_nave(w,1)-rpluton(w,1))/sqrt(modr_nave_pluton(w+1)));
       a_nave_pluton(w+1,2)=((-G*m_pluton)/modr_nave_pluton(w+1))*((r_nave(w,2)-rpluton(w,2))/sqrt(modr_nave_pluton(w+1)));
       a_nave_pluton(w+1,3)=((-G*m_pluton)/modr_nave_pluton(w+1))*((r_nave(w,3)-rpluton(w,3))/sqrt(modr_nave_pluton(w+1)));





        v_nave(w+1,1)=v_nave(w,1)+a_nave(w+1,1)*dt;
        v_nave(w+1,2)=v_nave(w,2)+a_nave(w+1,2)*dt;
        v_nave(w+1,3)=v_nave(w,3)+a_nave(w+1,3)*dt;
        v_nave(u,:)=v(u,:)+[vmin+(dv*L),0,0];
        r_nave(w+1,1)=r_nave(w,1)+v_nave(w,1)*dt+0.5*a_nave(w,1)*(dt^2);
        r_nave(w+1,2)=r_nave(w,2)+v_nave(w,2)*dt+0.5*a_nave(w,2)*(dt^2);
        r_nave(w+1,3)=r_nave(w,3)+v_nave(w,3)*dt+0.5*a_nave(w,3)*(dt^2);
        if norm(r_nave(w+1,:)-r_nave(i,:)) < rango_tierra
            pto_salida=r_nave(w,:);
            break 
        elseif r_nave(w+1,1) < -1e12
            break
        end
end
    m_nave=2e3;%kg
    if norm(r_nave(w+1,:)-r_nave(i,:)) < rango_tierra
        v_salida_tierra=v_nave(w,:)-v_nave(i,:);
        Ec_salida_tierra(L,1)=0.5*m_nave*(norm(v_salida_tierra))^2;
    else
        Ec_salida_tierra(L,1)=1e90;
    end

end
[posicion_oprtima,L]=min(Ec_salida_tierra);

v_nave(1,:)=[0,vmin+(dv*L),0];
for w=2:1:i-2

        a_nave(w+1,1)=((Fg_const/modr_nave_sol(w+1))*(r_nave(w,1)/sqrt(modr_nave_sol(w+1)))) + a_nave_tierra(w,1) + a_nave_venus(w,1) + a_nave_mercurio(w,1) +a_nave_marte(w,1) +a_nave_jupiter(w,1)+a_nave_saturno(w,1)+a_nave_urano(w,1)+a_nave_neptuno(w,1)+a_nave_pluton(w,1);
        a_nave(w+1,2)=(Fg_const/modr_nave_sol(w+1))*(r_nave(w,2)/sqrt(modr_nave_sol(w+1))) + a_nave_tierra(w,2)+ a_nave_venus(w,2)+ a_nave_mercurio(w,2)+a_nave_marte(w,2) +a_nave_jupiter(w,2)+a_nave_saturno(w,2)+a_nave_urano(w,2)+a_nave_neptuno(w,2)+a_nave_pluton(w,2);
        a_nave(w+1,3)=(Fg_const/modr_nave_sol(w+1))*(r_nave(w,3)/sqrt(modr_nave_sol(w+1)))  + a_nave_tierra(w,3)+ a_nave_venus(w,3)+ a_nave_mercurio(w,3)+a_nave_marte(w,3) +a_nave_jupiter(w,3)+a_nave_saturno(w,3)+a_nave_urano(w,3)+a_nave_neptuno(w,3)+a_nave_pluton(w,3);




        modr_nave_sol(w+1)=r_nave(w,1)^2+r_nave(w,2)^2+r_nave(w,3)^2;
        modr_nave_tierra(w+1)=(r_nave(w,1)-r(w,1))^2+(r_nave(w,2)-r(w,2))^2+(r_nave(w,3)-r(w,3))^2+radiotierra;
        % modr_nave_venus(i-1)=(r_nave(i,1)-rven(i,1))^2+(r(i,2)-rven(i,2))^2+(r_nave(i,3)-rven(i,3))^2;
        % modr_nave_mercurio(i-1)=(r_nave(i,1)-rmer(i,1))^2+(r_nave(i,2)-rmer(i,2))^2+(r_nave(i,3)-rmer(i,3))^2;
        % modr_nave_marte(i-1)=(r_nave(i,1)-rmarte(i,1))^2+(r_nave(i,2)-rmarte(i,2))^2+(r_nave(i,3)-rmarte(i,3))^2;
        modr_nave_jupiter(w+1)=(r_nave(w,1)-rjupiter(w,1))^2+(r_nave(w,2)-rjupiter(w,2))^2+(r_nave(w,3)-rjupiter(w,3))^2;
        % modr_nave_saturno(i-1)=(r_nave(i,1)-rsaturno(i,1))^2+(r_nave(i,2)-rsaturno(i,2))^2+(r_nave(i,3)-rsaturno(i,3))^2;
        % modr_nave_urano(i-1)=(r_nave(i,1)-rurano(i,1))^2+(r_nave(i,2)-rurano(i,2))^2+(r_nave(i,3)-rurano(i,3))^2;
        % modr_nave_neptuno(i-1)=(r_nave(i,1)-rneptuno(i,1))^2+(r_nave(i,2)-rneptuno(i,2))^2+(r_nave(i,3)-rneptuno(i,3))^2;
        modr_nave_pluton(w+1)=(r_nave(w,1)-rpluton(w,1))^2+(r_nave(w,2)-rpluton(w,2))^2+(r_nave(w,3)-rpluton(w,3))^2;


        %aceleracion sufrida por la nave total;
        a_nave(w+1,1)=((Fg_const/modr_nave_sol(w+1))*(r_nave(w,1)/sqrt(modr_nave_sol(w+1)))) + a_nave_tierra(w,1) + a_nave_venus(w,1) + a_nave_mercurio(w,1) +a_nave_marte(w,1) +a_nave_jupiter(w,1)+a_nave_saturno(w,1)+a_nave_urano(w,1)+a_nave_neptuno(w,1)+a_nave_pluton(w,1);
        a_nave(w+1,2)=(Fg_const/modr_nave_sol(w+1))*(r_nave(w,2)/sqrt(modr_nave_sol(w+1))) + a_nave_tierra(w,2)+ a_nave_venus(w,2)+ a_nave_mercurio(w,2)+a_nave_marte(w,2) +a_nave_jupiter(w,2)+a_nave_saturno(w,2)+a_nave_urano(w,2)+a_nave_neptuno(w,2)+a_nave_pluton(w,2);
        a_nave(w+1,3)=(Fg_const/modr_nave_sol(w+1))*(r_nave(w,3)/sqrt(modr_nave_sol(w+1)))  + a_nave_tierra(w,3)+ a_nave_venus(w,3)+ a_nave_mercurio(w,3)+a_nave_marte(w,3) +a_nave_jupiter(w,3)+a_nave_saturno(w,3)+a_nave_urano(w,3)+a_nave_neptuno(w,3)+a_nave_pluton(w,3);

        %Como le afecta la tierra:
        % a_nave_tierra(w+1,1)=((-G*m_tierra)/modr_nave_tierra(w+1))*((r_nave(w,1)-r(w,1))/sqrt(modr_nave_tierra(w+1)));
        % a_nave_tierra(w+1,2)=((-G*m_tierra)/modr_nave_tierra(w+1))*((r_nave(w,2)-r(w,2))/sqrt(modr_nave_tierra(w+1)));
        % a_nave_tierra(w+1,3)=((-G*m_tierra)/modr_nave_tierra(w+1))*((r_nave(w,3)-r(w,3))/sqrt(modr_nave_tierra(w+1)));

       %  %Como le afecta venus a la nave:
       %  a_nave_venus(i-1,1)=((-G*m_venus)/modr_nave_venus(i-1))*((r_nave(i,1)-rven(i,1))/sqrt(modr_nave_venus(i-1)));
       %  a_nave_venus(i-1,2)=((-G*m_venus)/modr_nave_venus(i-1))*((r_nave(i,2)-rven(i,2))/sqrt(modr_nave_venus(i-1)));
       %  a_nave_venus(i-1,3)=((-G*m_venus)/modr_nave_venus(i-1))*((r_nave(i,3)-rven(i,3))/sqrt(modr_nave_venus(i-1)));
       % 
       % %  %como le afecta mercurio a la nave:
       %  a_nave_mercurio(i-1,1)=((-G*m_mercurio)/modr_nave_mercurio(i-1))*((r_nave(i,1)-rmer(i,1))/sqrt(modr_nave_mercurio(i-1)));
       %  a_nave_mercurio(i-1,2)=((-G*m_mercurio)/modr_nave_mercurio(i-1))*((r_nave(i,2)-rmer(i,2))/sqrt(modr_nave_mercurio(i-1)));
       %  a_nave_mercurio(i-1,3)=((-G*m_mercurio)/modr_nave_mercurio(i-1))*((r_nave(i,3)-rmer(i,3))/sqrt(modr_nave_mercurio(i-1)));
       % 
       % 
       % %  %como le afecta marte a la nave;
       %  a_nave_marte(i-1,1)=((-G*m_marte)/modr_nave_marte(i-1))*((r_nave(i,1)-rmarte(i,1))/sqrt(modr_nave_marte(i-1)));
       %  a_nave_marte(i-1,2)=((-G*m_marte)/modr_nave_marte(i-1))*((r_nave(i,2)-rmarte(i,2))/sqrt(modr_nave_marte(i-1)));
       %  a_nave_marte(i-1,3)=((-G*m_marte)/modr_nave_marte(i-1))*((r_nave(i,3)-rmarte(i,3))/sqrt(modr_nave_marte(i-1)));
       % 

       %  %como le afecta jupiter a la nave:
        a_nave_jupiter(w+1,1)=((-G*m_jupiter)/modr_nave_jupiter(w+1))*((r_nave(w,1)-rjupiter(w,1))/sqrt(modr_nave_jupiter(w+1)));
        a_nave_jupiter(w+1,2)=((-G*m_jupiter)/modr_nave_jupiter(w+1))*((r_nave(w,2)-rjupiter(w,2))/sqrt(modr_nave_jupiter(w+1)));
        a_nave_jupiter(w+1,3)=((-G*m_jupiter)/modr_nave_jupiter(w+1))*((r_nave(w,3)-rjupiter(w,3))/sqrt(modr_nave_jupiter(w+1)));

       %  %como le afecta saturno a la nave:
       % a_nave_saturno(i-1,1)=((-G*m_saturno)/modr_nave_saturno(i-1))*((r_nave(i,1)-rsaturno(i,1))/sqrt(modr_nave_saturno(i-1)));
       % a_nave_saturno(i-1,2)=((-G*m_saturno)/modr_nave_saturno(i-1))*((r_nave(i,2)-rsaturno(i,2))/sqrt(modr_nave_saturno(i-1)));
       % a_nave_saturno(i-1,3)=((-G*m_saturno)/modr_nave_saturno(i-1))*((r_nave(i,3)-rsaturno(i,3))/sqrt(modr_nave_saturno(i-1)));
       % 
       % % %como le afecta urano a la nave:
       % a_nave_urano(i-1,1)=((-G*m_urano)/modr_nave_urano(i-1))*((r_nave(i,1)-rurano(i,1))/sqrt(modr_nave_urano(i-1)));
       % a_nave_urano(i-1,2)=((-G*m_urano)/modr_nave_urano(i-1))*((r_nave(i,2)-rurano(i,2))/sqrt(modr_nave_urano(i-1)));
       % a_nave_urano(i-1,3)=((-G*m_urano)/modr_nave_urano(i-1))*((r_nave(i,3)-rurano(i,3))/sqrt(modr_nave_urano(i-1)));
       % 
       % % %como le afecta neptuno a la nave:
       % a_nave_neptuno(i-1,1)=((-G*m_neptuno)/modr_nave_neptuno(i-1))*((r_nave(i,1)-rneptuno(i,1))/sqrt(modr_nave_neptuno(i-1)));
       % a_nave_neptuno(i-1,2)=((-G*m_neptuno)/modr_nave_neptuno(i-1))*((r_nave(i,2)-rneptuno(i,2))/sqrt(modr_nave_neptuno(i-1)));
       % a_nave_neptuno(i-1,3)=((-G*m_neptuno)/modr_nave_neptuno(i-1))*((r_nave(i,3)-rneptuno(i,3))/sqrt(modr_nave_neptuno(i-1)));


       % %como le afecta plutón a la nave:
       a_nave_pluton(w+1,1)=((-G*m_pluton)/modr_nave_pluton(w+1))*((r_nave(w,1)-rpluton(w,1))/sqrt(modr_nave_pluton(w+1)));
       a_nave_pluton(w+1,2)=((-G*m_pluton)/modr_nave_pluton(w+1))*((r_nave(w,2)-rpluton(w,2))/sqrt(modr_nave_pluton(w+1)));
       a_nave_pluton(w+1,3)=((-G*m_pluton)/modr_nave_pluton(w+1))*((r_nave(w,3)-rpluton(w,3))/sqrt(modr_nave_pluton(w+1)));





        v_nave(w+1,1)=v_nave(w,1)+a_nave(w+1,1)*dt;
        v_nave(w+1,2)=v_nave(w,2)+a_nave(w+1,2)*dt;
        v_nave(w+1,3)=v_nave(w,3)+a_nave(w+1,3)*dt;
        v_nave(u,:)=v(u,:)+[vmin+(dv*L),0,0];
        r_nave(w+1,1)=r_nave(w,1)+v_nave(w,1)*dt+0.5*a_nave(w,1)*(dt^2);
        r_nave(w+1,2)=r_nave(w,2)+v_nave(w,2)*dt+0.5*a_nave(w,2)*(dt^2);
        r_nave(w+1,3)=r_nave(w,3)+v_nave(w,3)*dt+0.5*a_nave(w,3)*(dt^2);
        if norm(r_nave(w+1,:)-r_nave(i,:)) < rango_tierra
            pto_salida=r_nave(w,:);
            break 
        elseif r_nave(w+1,1) < -1e12
            break
        end
end


m_nave=2e3;%kg
v_salida_tierra2=v_nave(w,:)-v(w,:);
Ec_salida_tierra2=0.5*m_nave*(norm(v_salida_tierra2))^2; 














r_nave_dibujo=zeros(tt-(i-w),3);
for k=1:tt-1
    if k <= w

    r_nave_dibujo(k,:)=r_nave(k,:);
    elseif k > w && k <= tt-(i-w)
    r_nave_dibujo(k,:)=r_nave(k+(i-w),:);
    end

end















tarda=toc;
disp(tarda)


























hold on
plot3(r_nave_dibujo(:, 1), r_nave_dibujo(:, 2), r_nave_dibujo(:, 3), 'b','LineWidth',0.5);

hold off
hold on
bola_nave = plot3(r_nave_dibujo(1, 1), r_nave_dibujo(1, 2), r_nave_dibujo(1, 3), 'o', 'MarkerSize', 3, 'MarkerFaceColor', 'black');
hold off


% Actualizar la posición de la bola en cada paso
W=dt/1000;
q=input('s');
hold on

for p = 1:W:tt
    set(bola, 'XData', r(p, 1), 'YData', r(p, 2), 'ZData', r(p, 3));
    % set(bolaven, 'XData', rven(p, 1), 'YData', rven(p, 2), 'ZData', rven(p, 3));
    % set(bolamer, 'XData', rmer(p, 1), 'YData', rmer(p, 2), 'ZData', rmer(p, 3));
    % set(bolamarte, 'XData', rmarte(p, 1), 'YData', rmarte(p, 2), 'ZData', rmarte(p, 3));
    set(bolajupiter, 'XData', rjupiter(p, 1), 'YData', rjupiter(p, 2), 'ZData', rjupiter(p, 3));
    % set(bolasaturno, 'XData', rsaturno(p, 1), 'YData', rsaturno(p, 2), 'ZData', rsaturno(p, 3));
    % 
    % set(bolaurano, 'XData', rurano(p, 1), 'YData', rurano(p, 2), 'ZData', rurano(p, 3));
    % set(bolaneptuno, 'XData', rneptuno(p, 1), 'YData', rneptuno(p, 2),
    % 'ZData', rneptuno(p, 3));
    set(bolapluton, 'XData', rpluton(p, 1), 'YData', rpluton(p, 2), 'ZData', rpluton(p, 3));
    if p > (i-w)
        set(bola_nave, 'XData', r_nave_dibujo(p-(i-w), 1), 'YData', r_nave_dibujo(p-(i-w), 2), 'ZData', r_nave_dibujo(p-(i-w), 3));
    
    end

    pause(1/1e6);
    drawnow;
end
hold off











