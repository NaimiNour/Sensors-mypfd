clear;
xm=100;
ym=100;
n=100;
 %Creation of random SN
 for i=1:1:n
     S(i).id=i;
     S(i).xd=rand(1,1)*xm;      %j'associe aux neuods sensors des x
     XR(i)=S(i).xd;              %l'axe
     S(i).yd=rand(1,1)*ym;
     YR(i)=S(i).yd;
    plot(S(i).xd,S(i).yd,'o');
    hold on  
 end
 %Calcule de la distance
 for i=1:1:n 
   for j=1:1:n 
      ecld(i,j)=sqrt((S(i).xd-S(j).xd)^2 + (S(i).yd-S(j).yd)^2); 
   end
 end
  %Calcule de Max et Min
      max=0;
      min=intmax;
 for i=1:1:n
   for j=1:1:n 
       if ecld(i,j)>max
           max=ecld(i,j);
           X=[i,j];
           Y=[S(i).xd,S(i).yd];
           Z=[S(j).xd,S(j).yd]; 
       end
   end
 end 
 disp(X);                               %pour TESTER
  disp(Y);
   disp(Z);
       plot(Y(1) ,Y(2),'x');
       plot(Z(1),Z(2),'x');
          hold on          
    
         
   for i=1:1:n
   for j=i+1:1:n-1
       if ecld(i,j)<min
           min=ecld(i,j);
         L=[i,j];  
          W=[S(i).xd,S(i).yd];
          Q=[S(j).xd,S(j).yd]; 
        
       end
   end
   end
 disp(L);           %pour TESTER
  disp(W);
   disp(Q);
        plot(W(1),W(2),'+');
        plot(Q(1),Q(2),'+');
           hold on 
       
  %Calcule de la distance moyenne et seuil avec k=3   
 
     Dis_may=( max+min)/2;
 k=3;     
       Dist_seuil=Dis_may/k;
       
   %Création de la matrice de transition      
   for i=1:1:n
   for j=1:1:n 
       Matr_trans(i,i)=1;                  %adding loop 
       if ecld(i,j)<= Dist_seuil
           Matr_trans(i,j)=1;
       else
            Matr_trans(i,j)=0; 
       end 
   end
   end
   %First normalisation
    dinv = diag(1./sum(Matr_trans));
    Markov= Matr_trans * dinv;
   %Calcule MCL 
   
     Ma=mclsimple(Markov);
   
     %Trouver attracteur5 
     figure(1);
     a=0; 
     for i=1:1:n  
      if   Ma(i,:)~=zeros(1,n) |  Ma(i,i)~=0    
          %attr=i 
            a=a+1;   
            
            %disp("Attracteur"+a+":")
    Attracteur{a}=i;
      end
      
     for j=1:1:n
         if Ma(i,j)~=0
             Clusters{i}=Ma(i,:)
             
         plot(S(i).xd,S(i).yd,'*');
           plot(S(j).xd,S(j).yd,'*');
  hold on;
 
          plot([S(i).xd,S(j).xd],[S(i).yd, S(j).yd])   
         end       
     end  
     end
      for i=1:1:99
       %   Attracteur{1}==S(i).id;
          if i< Attracteur{5}
               S1(i)=S(i) 
          else if i>= Attracteur{1}
                S1(i)=S(i+1) 
              end   
          end
     end
   for i=1:1:99
   for j=1:1:99
      ecld(i,j)=sqrt((S1(i).xd-S1(j).xd)^2 + (S1(i).yd-S1(j).yd)^2); 
   end
 end
  %Calcule de Max et Min
      max=0;
      min=intmax;
 for i=1:1:99
   for j=1:1:99 
       if ecld(i,j)>max
           max=ecld(i,j);
           X=[i,j];
           Y=[S1(i).xd,S1(i).yd];
           Z=[S1(j).xd,S1(j).yd]; 
       end
   end
 end 
 disp(X);                               %pour TESTER
  disp(Y);
   disp(Z);
       plot(Y(1) ,Y(2),'x');
       plot(Z(1),Z(2),'x');
          hold on          
    
         
   for i=1:1:99
   for j=i+1:1:98
       if ecld(i,j)<min
           min=ecld(i,j);
         L=[i,j];  
          W=[S1(i).xd,S1(i).yd];
          Q=[S1(j).xd,S1(j).yd]; 
        
       end
   end
   end
 disp(L);           %pour TESTER
  disp(W);
   disp(Q);
        plot(W(1),W(2),'+');
        plot(Q(1),Q(2),'+');
           hold on 
       
  %Calcule de la distance moyenne et seuil avec k=3   
 
     Dis_may=( max+min)/2;
 k=3;     
       Dist_seuil=Dis_may/k;
       
   %Création de la matrice de transition      
   for i=1:1:99
   for j=1:1:99
       Matr_trans(i,i)=1;                  %adding loop 
       if ecld(i,j)<= Dist_seuil
           Matr_trans(i,j)=1;
       else
            Matr_trans(i,j)=0; 
       end 
   end
   end
   %First normalisation
    dinv = diag(1./sum(Matr_trans));
    Markov= Matr_trans * dinv;
   %Calcule MCL 
   
     Ma=mclsimple(Markov);
     
  figure(2);
     a=0; 
     for i=1:1:99
      if   Ma(i,:)~=zeros(1,n) |  Ma(i,i)~=0    
          %attr=i 
            a=a+1;   
            
            %disp("Attracteur"+a+":")
    Attracteur{a}=i;
  %t=Attracteur{1}; 
      end   
     for j=1:1:99
         if Ma(i,j)~=0
             Clusters{i}=Ma(i,:)
             
         plot(S1(i).xd,S1(i).yd,'*');
           plot(S1(j).xd,S1(j).yd,'*');
  hold on;
 
          plot([S1(i).xd,S1(j).xd],[S1(i).yd, S1(j).yd])   
         end       
     end  
     end