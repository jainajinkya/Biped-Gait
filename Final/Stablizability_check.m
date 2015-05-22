clc
for i=1:251
   co = ctrb(A(:,:,i),B(:,:,i));
   rk = rank(co);
   [m1,m2] = qr(co);
   Ah(:,:,i) = m1'*A(:,:,i)*m1;
   Bh= m1'*B(:,:,i);
   EI = eig(Ah(:,:,i));
   for j = 1:10
      if((j>rk)&&(real(EI(j))>1e-10))
          i
          j
      end
   end
 end