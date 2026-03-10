function[l,posicion_oprtima,pto_salida,Ec_salida]=mejor_orbita(dt,dv,m_nave,vmax,vmin,rango,r_tierra,rven,rmer,rjupiter,rmarte,rsaturno,rurano,rneptuno,rpluton,v_tierra,tt,r0_nave)

%Función que calcula la órbita con menor energía cinética inicial para una
%nave en el sistema solar.
%Utiliza el mismo sistema que el bucle creado en el archivo
%Proyecto_final_orbitas_asistidas salvo que por razones que no sabemos
%explicar realizar los calculos mediante esta función es mucho más lento.

v_variable=zeros(tt,3);
K=(vmax-vmin)/dv;
Ec_salida=zeros(K,1); 
G=6.672e-11;  
m_tierra=5.98E24;
m_venus=m_tierra*0.82;
m_mercurio=m_tierra*0.06;
m_jupiter=1.8986e27;
m_saturno=5.6846E26;
m_marte=6.4185e23;
m_urano=8.6832e25;
m_neptuno=1.0243e26;
m_pluton=1.3105E22;
M=2e30;
a_nave_sol=zeros(tt,3);
a_nave_tierra=zeros(tt,3);
a_nave_venus=zeros(tt,3);
a_nave_mercurio=zeros(tt,3);
a_nave_marte=zeros(tt,3);
a_nave_jupiter=zeros(tt,3);
a_nave_saturno=zeros(tt,3);
a_nave_urano=zeros(tt,3);
a_nave_neptuno=zeros(tt,3);
a_nave_pluton=zeros(tt,3);
r_nave(tt,:)=r0_nave;

function[a]=calcula_aceleracion(m,r,G,j) 
      a=((-G*m)/(norm(r)^2))*(r(j)/norm(r));
end

for l=1:K
    v_variable(tt,:)=[0,vmin+(dv*l),0];
    for i=tt:-1:2
        for j=1:3
       


        %aceleracion sufrida por la nave total;
        a(i-1,j)=a_nave_sol(i,j) + a_nave_tierra(i,j) + a_nave_venus(i,j) + a_nave_mercurio(i,j) +a_nave_marte(i,j) +a_nave_jupiter(i,j)+a_nave_saturno(i,j)+a_nave_urano(i,j)+a_nave_neptuno(i,j)+a_nave_pluton(i,j);
        
       



        [a_nave_sol(i-1,j)]=calcula_aceleracion(M,(r_nave(i,:)),G,j);
        [a_nave_tierra(i-1,j)]=calcula_aceleracion(m_tierra,(r_nave(i,:)-r_tierra(i,:)),G,j);
        [a_nave_venus(i-1,j)]=calcula_aceleracion(m_venus,(r_nave(i,:)-rven(i,:)),G,j);
        [a_nave_mercurio(i-1,j)]=calcula_aceleracion(m_mercurio,(r_nave(i,:)-rmer(i,:)),G,j);
        [a_nave_marte(i-1,j)]=calcula_aceleracion(m_marte,(r_nave(i,:)-rmarte(i,:)),G,j);
        [a_nave_jupiter(i-1,j)]=calcula_aceleracion(m_jupiter,(r_nave(i,:)-rjupiter(i,:)),G,j);
        [a_nave_saturno(i-1,j)]=calcula_aceleracion(m_saturno,(r_nave(i,:)-rsaturno(i,:)),G,j);
        [a_nave_urano(i-1,j)]=calcula_aceleracion(m_urano,(r_nave(i,:)-rurano(i,:)),G,j);
        [a_nave_neptuno(i-1,j)]=calcula_aceleracion(m_neptuno,(r_nave(i,:)-rneptuno(i,:)),G,j);
        [a_nave_pluton(i-1,j)]=calcula_aceleracion(m_pluton,(r_nave(i,:)-rpluton(i,:)),G,j);
        

       

      

        v_variable(i-1,j)=v_variable(i,j)+a(i-1,j)*dt;
     
        r_nave(i-1,j)=r_nave(i,j)+v_variable(i-1,j)*dt+0.5*a(i-1,j)*(dt^2);
        end
        if norm(r_nave(i-1,:)-r_tierra(i-1,:)) < rango
            pto_salida=r_nave(i,:);
            break 
        elseif r_nave(i-1,1) < -1e12
            break
        end
       
    end
    if norm(r_nave(i-1,:)-r_tierra(i-1,:)) < rango
        v_salida=-v_variable(i,:)-v_tierra(i,:);
        Ec_salida(l,1)=0.5*m_nave*(norm(v_salida))^2;
    else
        Ec_salida(l,1)=1e20;
    end

end
[posicion_oprtima,l]=min(Ec_salida);


end





