clc;
clear all;

tic %Medir el tiempo que tarda en realizarse el cálculo.

radiotierra=6.371E6;
G=6.672E-11;
M=2E30; %masa del sol.



tiempo=1.976e9;  %Tiempo total de la simulación. 
dt=input('Detalle:');%Tiempo entre iteraciones (funciona entre valores de 1000~10000)

m_tierra=5.98E24; %Masa de los planetas.
m_venus=m_tierra*0.82;
m_mercurio=m_tierra*0.06;
m_jupiter=1.8986e27; 
m_saturno=5.6846E26;
m_marte=6.4185e23;
m_urano=8.6832e25;
m_neptuno=1.0243e26;
m_pluton=1.3105E22;


Fg_const = -G * M ;

tt=round(tiempo/dt);%Numero total de iteraciones.

r0_tierra= [0,1.4970e11,0];%Condiciones iniciales de los planetas.
v0_tierra=[2.978e4,0,0];

r0mer=[0,5.789E10,0];
v0mer=[4.7E4,0,0];

r0ven=[0,1.08203E11,0];
v0ven=[3.502E4,0,0];

r0marte=[0,2.27925e11,0];
v0marte=[2.4077e4,0,0];

r0jupiter=[7.78371e11,0,0];
v0jupiter=[0,-1.30697e4,0];

r0saturno=[0,1.42665E12,0];
v0saturno=[9620.24,0,0];

r0neptuno=[0,4.49802E12,0];
v0neptuno=[5477.8,0,0];

r0urano=[0,2.87082E12,0];
v0urano=[6810,0,0];

r0pluton=[0,5.913e12,0];
v0pluton=[4700,0,0];


%Calculo la órbita de cada planeta utilizando una función:
[a_tierra,v_tierra,r_tierra]=calculaorbitas(r0_tierra,v0_tierra,tt,dt);
[amer,vmer,rmer]=calculaorbitas(r0mer,v0mer,tt,dt);
[aven,vven,rven]=calculaorbitas(r0ven,v0ven,tt,dt); 
[amarte,vmarte,rmarte]=calculaorbitas(r0marte,v0marte,tt,dt);
[ajupiter,vjupiter,rjupiter]=calculaorbitas(r0jupiter,v0jupiter,tt,dt);
[asaturno,vsaturno,rsaturno]=calculaorbitas(r0saturno,v0saturno,tt,dt);
[aurano,vurano,rurano]=calculaorbitas(r0urano,v0urano,tt,dt);
[aneptuno,vneptuno,rneptuno]=calculaorbitas(r0neptuno,v0neptuno,tt,dt);
[apluton,vpluton,rpluton]=calculaorbitas(r0pluton,v0pluton,tt,dt);


%Buscamos calcular la órbita de menor energía cinética inicial mediante dos
%métodos o bien la función siguiente o el bucle:

%[l,posicion_oprtima,pto_salida,Ec_salida]=mejor_orbita(dt,dv,m_nave,vmax,vmin,rango,r_tierra,rven,rmer,rjupiter,rmarte,rsaturno,rurano,rneptuno,rpluton,v_tierra,tt,r0_nave);





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




rango=1e10;%Que tanto se tiene que acercar a la tierra para que se detenga la simulación y se de como válida la trayectoria.



dv=100;%Salto entre los diferentes valores de velocidad final que consideramos.(Funciona entre valores de 10~100)
vmax=5e3;%Velocidades máximas y mínimas que consideramos.
vmin=-5e3;
m_nave=2e3;
tic;


r_nave(tt,1)=rpluton(tt,1)+9.154034e6;%Condiciones finales de la nave de donde partiremos para realizar la integral con diferencial de tiempo negativo.
r_nave(tt,2)=rpluton(tt,2);
r_nave(tt,3)=rpluton(tt,3);
K=(vmax-vmin)/dv; %Número de iteraciones que realizara el siguiente bucle
Ec_salida=zeros(K,1);
for l=1:K
    v_nave(tt,:)=[0,vmin+(dv*l),0];%Velocidad final que consideramos.
    for i=tt:-1:2%Euler inverso

        a_nave(i-1,1)=((Fg_const/modr_nave_sol(i-1))*(r_nave(i,1)/sqrt(modr_nave_sol(i-1)))) + a_nave_tierra(i,1) + a_nave_venus(i,1) + a_nave_mercurio(i,1) +a_nave_marte(i,1) +a_nave_jupiter(i,1)+a_nave_saturno(i,1)+a_nave_urano(i,1)+a_nave_neptuno(i,1)+a_nave_pluton(i,1);
        a_nave(i-1,2)=(Fg_const/modr_nave_sol(i-1))*(r_nave(i,2)/sqrt(modr_nave_sol(i-1))) + a_nave_tierra(i,2)+ a_nave_venus(i,2)+ a_nave_mercurio(i,2)+a_nave_marte(i,2) +a_nave_jupiter(i,2)+a_nave_saturno(i,2)+a_nave_urano(i,2)+a_nave_neptuno(i,2)+a_nave_pluton(i,2);
        a_nave(i-1,3)=(Fg_const/modr_nave_sol(i-1))*(r_nave(i,3)/sqrt(modr_nave_sol(i-1)))  + a_nave_tierra(i,3)+ a_nave_venus(i,3)+ a_nave_mercurio(i,3)+a_nave_marte(i,3) +a_nave_jupiter(i,3)+a_nave_saturno(i,3)+a_nave_urano(i,3)+a_nave_neptuno(i,3)+a_nave_pluton(i,3);



        %Distancia de la nave a los distintos cuerpos. Sería más limpio
        %utilizar la función ya inegrada en matlab de norm() pero el
        %proceso sería más lento (por razón desconocida).

        modr_nave_sol(i-1)=r_nave(i,1)^2+r_nave(i,2)^2+r_nave(i,3)^2;
        modr_nave_tierra(i-1)=(r_nave(i,1)-r_tierra(i,1))^2+(r_nave(i,2)-r_tierra(i,2))^2+(r_nave(i,3)-r_tierra(i,3))^2+radiotierra;
        modr_nave_venus(i-1)=(r_nave(i,1)-rven(i,1))^2+(r_nave(i,2)-rven(i,2))^2+(r_nave(i,3)-rven(i,3))^2;
        modr_nave_mercurio(i-1)=(r_nave(i,1)-rmer(i,1))^2+(r_nave(i,2)-rmer(i,2))^2+(r_nave(i,3)-rmer(i,3))^2;
        modr_nave_marte(i-1)=(r_nave(i,1)-rmarte(i,1))^2+(r_nave(i,2)-rmarte(i,2))^2+(r_nave(i,3)-rmarte(i,3))^2;
        modr_nave_jupiter(i-1)=(r_nave(i,1)-rjupiter(i,1))^2+(r_nave(i,2)-rjupiter(i,2))^2+(r_nave(i,3)-rjupiter(i,3))^2;
        modr_nave_saturno(i-1)=(r_nave(i,1)-rsaturno(i,1))^2+(r_nave(i,2)-rsaturno(i,2))^2+(r_nave(i,3)-rsaturno(i,3))^2;
        modr_nave_urano(i-1)=(r_nave(i,1)-rurano(i,1))^2+(r_nave(i,2)-rurano(i,2))^2+(r_nave(i,3)-rurano(i,3))^2;
        modr_nave_neptuno(i-1)=(r_nave(i,1)-rneptuno(i,1))^2+(r_nave(i,2)-rneptuno(i,2))^2+(r_nave(i,3)-rneptuno(i,3))^2;
        modr_nave_pluton(i-1)=(r_nave(i,1)-rpluton(i,1))^2+(r_nave(i,2)-rpluton(i,2))^2+(r_nave(i,3)-rpluton(i,3))^2;


        %aceleracion sufrida por la nave total;
        a_nave(i-1,1)=((Fg_const/modr_nave_sol(i-1))*(r_nave(i,1)/sqrt(modr_nave_sol(i-1)))) + a_nave_tierra(i,1) + a_nave_venus(i,1) + a_nave_mercurio(i,1) +a_nave_marte(i,1) +a_nave_jupiter(i,1)+a_nave_saturno(i,1)+a_nave_urano(i,1)+a_nave_neptuno(i,1)+a_nave_pluton(i,1);
        a_nave(i-1,2)=(Fg_const/modr_nave_sol(i-1))*(r_nave(i,2)/sqrt(modr_nave_sol(i-1))) + a_nave_tierra(i,2)+ a_nave_venus(i,2)+ a_nave_mercurio(i,2)+a_nave_marte(i,2) +a_nave_jupiter(i,2)+a_nave_saturno(i,2)+a_nave_urano(i,2)+a_nave_neptuno(i,2)+a_nave_pluton(i,2);
        a_nave(i-1,3)=(Fg_const/modr_nave_sol(i-1))*(r_nave(i,3)/sqrt(modr_nave_sol(i-1)))  + a_nave_tierra(i,3)+ a_nave_venus(i,3)+ a_nave_mercurio(i,3)+a_nave_marte(i,3) +a_nave_jupiter(i,3)+a_nave_saturno(i,3)+a_nave_urano(i,3)+a_nave_neptuno(i,3)+a_nave_pluton(i,3);

        %Como le afecta la tierra:
        a_nave_tierra(i-1,1)=((-G*m_tierra)/modr_nave_tierra(i-1))*((r_nave(i,1)-r_tierra(i,1))/sqrt(modr_nave_tierra(i-1)));
        a_nave_tierra(i-1,2)=((-G*m_tierra)/modr_nave_tierra(i-1))*((r_nave(i,2)-r_tierra(i,2))/sqrt(modr_nave_tierra(i-1)));
        a_nave_tierra(i-1,3)=((-G*m_tierra)/modr_nave_tierra(i-1))*((r_nave(i,3)-r_tierra(i,3))/sqrt(modr_nave_tierra(i-1)));

        %Como le afecta venus a la nave:
        a_nave_venus(i-1,1)=((-G*m_venus)/modr_nave_venus(i-1))*((r_nave(i,1)-rven(i,1))/sqrt(modr_nave_venus(i-1)));
        a_nave_venus(i-1,2)=((-G*m_venus)/modr_nave_venus(i-1))*((r_nave(i,2)-rven(i,2))/sqrt(modr_nave_venus(i-1)));
        a_nave_venus(i-1,3)=((-G*m_venus)/modr_nave_venus(i-1))*((r_nave(i,3)-rven(i,3))/sqrt(modr_nave_venus(i-1)));

       %  %como le afecta mercurio a la nave:
        a_nave_mercurio(i-1,1)=((-G*m_mercurio)/modr_nave_mercurio(i-1))*((r_nave(i,1)-rmer(i,1))/sqrt(modr_nave_mercurio(i-1)));
        a_nave_mercurio(i-1,2)=((-G*m_mercurio)/modr_nave_mercurio(i-1))*((r_nave(i,2)-rmer(i,2))/sqrt(modr_nave_mercurio(i-1)));
        a_nave_mercurio(i-1,3)=((-G*m_mercurio)/modr_nave_mercurio(i-1))*((r_nave(i,3)-rmer(i,3))/sqrt(modr_nave_mercurio(i-1)));


       %  %como le afecta marte a la nave;
        a_nave_marte(i-1,1)=((-G*m_marte)/modr_nave_marte(i-1))*((r_nave(i,1)-rmarte(i,1))/sqrt(modr_nave_marte(i-1)));
        a_nave_marte(i-1,2)=((-G*m_marte)/modr_nave_marte(i-1))*((r_nave(i,2)-rmarte(i,2))/sqrt(modr_nave_marte(i-1)));
        a_nave_marte(i-1,3)=((-G*m_marte)/modr_nave_marte(i-1))*((r_nave(i,3)-rmarte(i,3))/sqrt(modr_nave_marte(i-1)));


       %  %como le afecta jupiter a la nave:
        a_nave_jupiter(i-1,1)=((-G*m_jupiter)/modr_nave_jupiter(i-1))*((r_nave(i,1)-rjupiter(i,1))/sqrt(modr_nave_jupiter(i-1)));
        a_nave_jupiter(i-1,2)=((-G*m_jupiter)/modr_nave_jupiter(i-1))*((r_nave(i,2)-rjupiter(i,2))/sqrt(modr_nave_jupiter(i-1)));
        a_nave_jupiter(i-1,3)=((-G*m_jupiter)/modr_nave_jupiter(i-1))*((r_nave(i,3)-rjupiter(i,3))/sqrt(modr_nave_jupiter(i-1)));

        %como le afecta saturno a la nave:
       a_nave_saturno(i-1,1)=((-G*m_saturno)/modr_nave_saturno(i-1))*((r_nave(i,1)-rsaturno(i,1))/sqrt(modr_nave_saturno(i-1)));
       a_nave_saturno(i-1,2)=((-G*m_saturno)/modr_nave_saturno(i-1))*((r_nave(i,2)-rsaturno(i,2))/sqrt(modr_nave_saturno(i-1)));
       a_nave_saturno(i-1,3)=((-G*m_saturno)/modr_nave_saturno(i-1))*((r_nave(i,3)-rsaturno(i,3))/sqrt(modr_nave_saturno(i-1)));

       % %como le afecta urano a la nave:
       a_nave_urano(i-1,1)=((-G*m_urano)/modr_nave_urano(i-1))*((r_nave(i,1)-rurano(i,1))/sqrt(modr_nave_urano(i-1)));
       a_nave_urano(i-1,2)=((-G*m_urano)/modr_nave_urano(i-1))*((r_nave(i,2)-rurano(i,2))/sqrt(modr_nave_urano(i-1)));
       a_nave_urano(i-1,3)=((-G*m_urano)/modr_nave_urano(i-1))*((r_nave(i,3)-rurano(i,3))/sqrt(modr_nave_urano(i-1)));
       % 
       % %como le afecta neptuno a la nave:
       a_nave_neptuno(i-1,1)=((-G*m_neptuno)/modr_nave_neptuno(i-1))*((r_nave(i,1)-rneptuno(i,1))/sqrt(modr_nave_neptuno(i-1)));
       a_nave_neptuno(i-1,2)=((-G*m_neptuno)/modr_nave_neptuno(i-1))*((r_nave(i,2)-rneptuno(i,2))/sqrt(modr_nave_neptuno(i-1)));
       a_nave_neptuno(i-1,3)=((-G*m_neptuno)/modr_nave_neptuno(i-1))*((r_nave(i,3)-rneptuno(i,3))/sqrt(modr_nave_neptuno(i-1)));


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
        if norm(r_nave(i-1,:)-r_tierra(i-1,:)) < rango
            pto_salida=r_nave(i,:);%Rompemos el bucle en el momento que llega a la órbita terrestre.
            break 
        elseif r_nave(i-1,1) < -1e12%O lo rompemos si se vá demasiado lejos.
            break
        end

    end
    m_nave=2e3;%kg
    if norm(r_nave(i-1,:)-r_tierra(i-1,:)) < rango % asignamos un valor de la energía cinética a cada ruta diferenciando claramente aquellas no válidas.
        v_salida=-v_nave(i,:)-v_tierra(i,:);
        Ec_salida(l,1)=0.5*m_nave*(norm(v_salida))^2;
    else
        Ec_salida(l,1)=1e20;
    end

end
[posicion_oprtima,l]=min(Ec_salida);%Seleccionamos la mejor ruta.

tarda_peq=toc;
a_nave=zeros(tt,3);
v_nave=zeros(tt,3);
v_nave(tt,:)=[0,vmin+(dv*l),0];
r_nave=zeros(tt,3);
r_nave(tt,1)=rpluton(tt,1)+9.154034e6;
r_nave(tt,2)=rpluton(tt,2);
r_nave(tt,3)=rpluton(tt,3);
for i=tt:-1:2%Sabiendo el valor de la velocidad final de la mejor ruta(Aquella con menor eCinética inicial) calculamos dicha trayectoria.

        a_nave(i-1,1)=((Fg_const/modr_nave_sol(i-1))*(r_nave(i,1)/sqrt(modr_nave_sol(i-1)))) + a_nave_tierra(i,1) + a_nave_venus(i,1) + a_nave_mercurio(i,1) +a_nave_marte(i,1) +a_nave_jupiter(i,1)+a_nave_saturno(i,1)+a_nave_urano(i,1)+a_nave_neptuno(i,1)+a_nave_pluton(i,1);
        a_nave(i-1,2)=(Fg_const/modr_nave_sol(i-1))*(r_nave(i,2)/sqrt(modr_nave_sol(i-1))) + a_nave_tierra(i,2)+ a_nave_venus(i,2)+ a_nave_mercurio(i,2)+a_nave_marte(i,2) +a_nave_jupiter(i,2)+a_nave_saturno(i,2)+a_nave_urano(i,2)+a_nave_neptuno(i,2)+a_nave_pluton(i,2);
        a_nave(i-1,3)=(Fg_const/modr_nave_sol(i-1))*(r_nave(i,3)/sqrt(modr_nave_sol(i-1)))  + a_nave_tierra(i,3)+ a_nave_venus(i,3)+ a_nave_mercurio(i,3)+a_nave_marte(i,3) +a_nave_jupiter(i,3)+a_nave_saturno(i,3)+a_nave_urano(i,3)+a_nave_neptuno(i,3)+a_nave_pluton(i,3);




        modr_nave_sol(i-1)=r_nave(i,1)^2+r_nave(i,2)^2+r_nave(i,3)^2;
        modr_nave_tierra(i-1)=(r_nave(i,1)-r_tierra(i,1))^2+(r_nave(i,2)-r_tierra(i,2))^2+(r_nave(i,3)-r_tierra(i,3))^2+radiotierra;
        modr_nave_venus(i-1)=(r_nave(i,1)-rven(i,1))^2+(r_nave(i,2)-rven(i,2))^2+(r_nave(i,3)-rven(i,3))^2;
        modr_nave_mercurio(i-1)=(r_nave(i,1)-rmer(i,1))^2+(r_nave(i,2)-rmer(i,2))^2+(r_nave(i,3)-rmer(i,3))^2;
        modr_nave_marte(i-1)=(r_nave(i,1)-rmarte(i,1))^2+(r_nave(i,2)-rmarte(i,2))^2+(r_nave(i,3)-rmarte(i,3))^2;
        modr_nave_jupiter(i-1)=(r_nave(i,1)-rjupiter(i,1))^2+(r_nave(i,2)-rjupiter(i,2))^2+(r_nave(i,3)-rjupiter(i,3))^2;
        modr_nave_saturno(i-1)=(r_nave(i,1)-rsaturno(i,1))^2+(r_nave(i,2)-rsaturno(i,2))^2+(r_nave(i,3)-rsaturno(i,3))^2;
        modr_nave_urano(i-1)=(r_nave(i,1)-rurano(i,1))^2+(r_nave(i,2)-rurano(i,2))^2+(r_nave(i,3)-rurano(i,3))^2;
        modr_nave_neptuno(i-1)=(r_nave(i,1)-rneptuno(i,1))^2+(r_nave(i,2)-rneptuno(i,2))^2+(r_nave(i,3)-rneptuno(i,3))^2;
        modr_nave_pluton(i-1)=(r_nave(i,1)-rpluton(i,1))^2+(r_nave(i,2)-rpluton(i,2))^2+(r_nave(i,3)-rpluton(i,3))^2;


        %aceleracion sufrida por la nave total;
        a_nave(i-1,1)=((Fg_const/modr_nave_sol(i-1))*(r_nave(i,1)/sqrt(modr_nave_sol(i-1)))) + a_nave_tierra(i,1) + a_nave_venus(i,1) + a_nave_mercurio(i,1) +a_nave_marte(i,1) +a_nave_jupiter(i,1)+a_nave_saturno(i,1)+a_nave_urano(i,1)+a_nave_neptuno(i,1)+a_nave_pluton(i,1);
        a_nave(i-1,2)=(Fg_const/modr_nave_sol(i-1))*(r_nave(i,2)/sqrt(modr_nave_sol(i-1))) + a_nave_tierra(i,2)+ a_nave_venus(i,2)+ a_nave_mercurio(i,2)+a_nave_marte(i,2) +a_nave_jupiter(i,2)+a_nave_saturno(i,2)+a_nave_urano(i,2)+a_nave_neptuno(i,2)+a_nave_pluton(i,2);
        a_nave(i-1,3)=(Fg_const/modr_nave_sol(i-1))*(r_nave(i,3)/sqrt(modr_nave_sol(i-1)))  + a_nave_tierra(i,3)+ a_nave_venus(i,3)+ a_nave_mercurio(i,3)+a_nave_marte(i,3) +a_nave_jupiter(i,3)+a_nave_saturno(i,3)+a_nave_urano(i,3)+a_nave_neptuno(i,3)+a_nave_pluton(i,3);

        %Como le afecta la tierra:
        a_nave_tierra(i-1,1)=((-G*m_tierra)/modr_nave_tierra(i-1))*((r_nave(i,1)-r_tierra(i,1))/sqrt(modr_nave_tierra(i-1)));
        a_nave_tierra(i-1,2)=((-G*m_tierra)/modr_nave_tierra(i-1))*((r_nave(i,2)-r_tierra(i,2))/sqrt(modr_nave_tierra(i-1)));
        a_nave_tierra(i-1,3)=((-G*m_tierra)/modr_nave_tierra(i-1))*((r_nave(i,3)-r_tierra(i,3))/sqrt(modr_nave_tierra(i-1)));

        %Como le afecta venus a la nave:
        a_nave_venus(i-1,1)=((-G*m_venus)/modr_nave_venus(i-1))*((r_nave(i,1)-rven(i,1))/sqrt(modr_nave_venus(i-1)));
        a_nave_venus(i-1,2)=((-G*m_venus)/modr_nave_venus(i-1))*((r_nave(i,2)-rven(i,2))/sqrt(modr_nave_venus(i-1)));
        a_nave_venus(i-1,3)=((-G*m_venus)/modr_nave_venus(i-1))*((r_nave(i,3)-rven(i,3))/sqrt(modr_nave_venus(i-1)));

       %  %como le afecta mercurio a la nave:
        a_nave_mercurio(i-1,1)=((-G*m_mercurio)/modr_nave_mercurio(i-1))*((r_nave(i,1)-rmer(i,1))/sqrt(modr_nave_mercurio(i-1)));
        a_nave_mercurio(i-1,2)=((-G*m_mercurio)/modr_nave_mercurio(i-1))*((r_nave(i,2)-rmer(i,2))/sqrt(modr_nave_mercurio(i-1)));
        a_nave_mercurio(i-1,3)=((-G*m_mercurio)/modr_nave_mercurio(i-1))*((r_nave(i,3)-rmer(i,3))/sqrt(modr_nave_mercurio(i-1)));


       %  %como le afecta marte a la nave;
        a_nave_marte(i-1,1)=((-G*m_marte)/modr_nave_marte(i-1))*((r_nave(i,1)-rmarte(i,1))/sqrt(modr_nave_marte(i-1)));
        a_nave_marte(i-1,2)=((-G*m_marte)/modr_nave_marte(i-1))*((r_nave(i,2)-rmarte(i,2))/sqrt(modr_nave_marte(i-1)));
        a_nave_marte(i-1,3)=((-G*m_marte)/modr_nave_marte(i-1))*((r_nave(i,3)-rmarte(i,3))/sqrt(modr_nave_marte(i-1)));


        %como le afecta jupiter a la nave:
        a_nave_jupiter(i-1,1)=((-G*m_jupiter)/modr_nave_jupiter(i-1))*((r_nave(i,1)-rjupiter(i,1))/sqrt(modr_nave_jupiter(i-1)));
        a_nave_jupiter(i-1,2)=((-G*m_jupiter)/modr_nave_jupiter(i-1))*((r_nave(i,2)-rjupiter(i,2))/sqrt(modr_nave_jupiter(i-1)));
        a_nave_jupiter(i-1,3)=((-G*m_jupiter)/modr_nave_jupiter(i-1))*((r_nave(i,3)-rjupiter(i,3))/sqrt(modr_nave_jupiter(i-1)));

        %como le afecta saturno a la nave:
       a_nave_saturno(i-1,1)=((-G*m_saturno)/modr_nave_saturno(i-1))*((r_nave(i,1)-rsaturno(i,1))/sqrt(modr_nave_saturno(i-1)));
       a_nave_saturno(i-1,2)=((-G*m_saturno)/modr_nave_saturno(i-1))*((r_nave(i,2)-rsaturno(i,2))/sqrt(modr_nave_saturno(i-1)));
       a_nave_saturno(i-1,3)=((-G*m_saturno)/modr_nave_saturno(i-1))*((r_nave(i,3)-rsaturno(i,3))/sqrt(modr_nave_saturno(i-1)));

       % %como le afecta urano a la nave:
       a_nave_urano(i-1,1)=((-G*m_urano)/modr_nave_urano(i-1))*((r_nave(i,1)-rurano(i,1))/sqrt(modr_nave_urano(i-1)));
       a_nave_urano(i-1,2)=((-G*m_urano)/modr_nave_urano(i-1))*((r_nave(i,2)-rurano(i,2))/sqrt(modr_nave_urano(i-1)));
       a_nave_urano(i-1,3)=((-G*m_urano)/modr_nave_urano(i-1))*((r_nave(i,3)-rurano(i,3))/sqrt(modr_nave_urano(i-1)));

       % %como le afecta neptuno a la nave:
       a_nave_neptuno(i-1,1)=((-G*m_neptuno)/modr_nave_neptuno(i-1))*((r_nave(i,1)-rneptuno(i,1))/sqrt(modr_nave_neptuno(i-1)));
       a_nave_neptuno(i-1,2)=((-G*m_neptuno)/modr_nave_neptuno(i-1))*((r_nave(i,2)-rneptuno(i,2))/sqrt(modr_nave_neptuno(i-1)));
       a_nave_neptuno(i-1,3)=((-G*m_neptuno)/modr_nave_neptuno(i-1))*((r_nave(i,3)-rneptuno(i,3))/sqrt(modr_nave_neptuno(i-1)));


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
        if norm(r_nave(i-1,:)-r_tierra(i-1,:)) < rango
            %pto_salida=r_nave(i,:);
            break 
        elseif r_nave(i-1,1) < -1e12
            break
        end
end

v_salida=-v_nave(i,:)-v_tierra(i,:);
Ec_salida_2=0.5*m_nave*(norm(v_salida))^2; 

r_nave_dibujo=zeros(tt-i,3);


for k=1:tt-i
 r_nave_dibujo(k,:)=r_nave(i+k,:);%Invertimos la trayectoria para que se represente en el orden correcto.

end

tiempo_salida=i*dt;%Calculamos la información necesaria para el tiempo de salida, la velocidad y dirección.
dias_hasta_salida=floor(tiempo_salida/(24*3600));
anno_salida=2024+floor((dias_hasta_salida+4*30+9)/365);
mes_salida=4+floor((dias_hasta_salida-(floor((dias_hasta_salida+4*30+9)/365)*365))/30);
dia_salida=dias_hasta_salida-((anno_salida-2024)*365+(mes_salida-4)*30);


direccion=(-v_nave(i,:)-v_tierra(i,:))/norm(-v_nave(i,:)-v_tierra(i,:));
velocidad=norm(-v_nave(i,:)-v_tierra(i,:));
disp('La nave deberá ser lanzada el día:')
fprintf('%d/%d/%d\n', dia_salida, mes_salida, anno_salida);
disp('En dirección:(con la tierra como pto de referencia)')
disp(direccion)
disp('Con velocidad:(m/s)')
disp(velocidad);
tarda=toc;
disp(tarda)%Muestra lo que ha tardado en calcular la mejor órbita y en total.
disp(tarda_peq)




%Dibujo todas las trayectorias.
plot3(0,0,0,'o','MarkerSize',10,'MarkerFaceColor','y')

hold on
plot3(r_tierra(:, 1), r_tierra(:, 2), r_tierra(:, 3), 'r','LineWidth',0.5);
hold off


hold on
bola = plot3(r_tierra(1, 1), r_tierra(1, 2), r_tierra(1, 3), 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'b');
xlabel('Posición X (m)');
ylabel('Posición Y (m)');
zlabel('Posición Z (m)');
title('Órbitas');
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
plot3(rven(:, 1), rven(:, 2), rven(:, 3), 'r','LineWidth',0.5);
plot3(rmarte(:, 1), rmarte(:, 2), rmarte(:, 3), 'Color', color_rgb_marte, 'LineWidth', 0.5);
plot3(rjupiter(:, 1), rjupiter(:, 2), rjupiter(:, 3), 'Color', color_rgb_jupiter','LineWidth',0.5);
plot3(rsaturno(:, 1), rsaturno(:, 2), rsaturno(:, 3), 'Color', color_rgb_saturno,'LineWidth',0.5);
plot3(rurano(:, 1), rurano(:, 2), rurano(:, 3),'Color', color_rgb_urano,'LineWidth',0.5);
plot3(rneptuno(:, 1), rneptuno(:, 2), rneptuno(:, 3), 'Color', color_rgb_neptuno,'LineWidth',0.5);
plot3(rpluton(:, 1), rpluton(:, 2), rpluton(:, 3), 'Color', color_rgb_pluton,'LineWidth',0.5);


%movimiento de las pelotas:
bolaven = plot3(rven(1, 1), rven(1, 2), rven(1, 3), 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'r');
bolamarte = plot3(rmarte(1, 1), rmarte(1, 2), rmarte(1, 3), 'o', 'MarkerSize', 5, 'MarkerFaceColor', color_rgb_marte);
bolajupiter = plot3(rjupiter(1, 1), rjupiter(1, 2), rjupiter(1, 3), 'o', 'MarkerSize', 5, 'MarkerFaceColor',  color_rgb_jupiter');
bolasaturno = plot3(rsaturno(1, 1), rsaturno(1, 2), rsaturno(1, 3), 'o', 'MarkerSize', 5, 'MarkerFaceColor',  color_rgb_saturno);
bolaurano = plot3(rurano(1, 1), rurano(1, 2), rurano(1, 3), 'o', 'MarkerSize', 5, 'MarkerFaceColor',  color_rgb_urano);
bolaneptuno = plot3(rneptuno(1, 1), rneptuno(1, 2), rneptuno(1, 3), 'o', 'MarkerSize', 5, 'MarkerFaceColor',  color_rgb_neptuno);
bolapluton = plot3(rpluton(1, 1), rpluton(1, 2), rpluton(1, 3), 'o', 'MarkerSize', 5, 'MarkerFaceColor',  color_rgb_pluton);


hold off


















hold on
plot3(r_nave_dibujo(:, 1), r_nave_dibujo(:, 2), r_nave_dibujo(:, 3), 'b','LineWidth',0.5);

hold off
hold on
bola_nave = plot3(r_nave_dibujo(1, 1), r_nave_dibujo(1, 2), r_nave_dibujo(1, 3), 'o', 'MarkerSize', 3, 'MarkerFaceColor', 'black');
hold off


% Actualizar la posición de la bola en cada paso
W=round(dt/33);
q=input('s');
hold on
%Represento el movimiento de los cuerpos.
for p = 1:W:tt
    set(bola, 'XData', r_tierra(p, 1), 'YData', r_tierra(p, 2), 'ZData', r_tierra(p, 3));
    set(bolaven, 'XData', rven(p, 1), 'YData', rven(p, 2), 'ZData', rven(p, 3));
    set(bolamer, 'XData', rmer(p, 1), 'YData', rmer(p, 2), 'ZData', rmer(p, 3));
    set(bolamarte, 'XData', rmarte(p, 1), 'YData', rmarte(p, 2), 'ZData', rmarte(p, 3));
    set(bolajupiter, 'XData', rjupiter(p, 1), 'YData', rjupiter(p, 2), 'ZData', rjupiter(p, 3));
    set(bolasaturno, 'XData', rsaturno(p, 1), 'YData', rsaturno(p, 2), 'ZData', rsaturno(p, 3));

    set(bolaurano, 'XData', rurano(p, 1), 'YData', rurano(p, 2), 'ZData', rurano(p, 3));
    set(bolaneptuno, 'XData', rneptuno(p, 1), 'YData', rneptuno(p, 2), 'ZData', rneptuno(p, 3));
    set(bolapluton, 'XData', rpluton(p, 1), 'YData', rpluton(p, 2), 'ZData', rpluton(p, 3));
    if p > i
        set(bola_nave, 'XData', r_nave_dibujo(p-i, 1), 'YData', r_nave_dibujo(p-i, 2), 'ZData', r_nave_dibujo(p-i, 3));
    end


    pause(1/1e6);
    drawnow;
end
hold off











