A=imread('C:\Users\Daniel\Documents\Vivado\Spam3\arquitectureDAN\1a.pgm');
B=reshape(A',256,1);
C=zeros(48,6);
A
i=1;
j=1;
r=1;
while i<251
    C(j,:)=B(i:i+5);
    if (r==3)
        i= i+8;
        r=0;
        r=r+1;
    else
        i=i+4;
        r=r+1;
    end
    j=j+1;
end
C

fid = fopen('C:\Users\Daniel\Documents\Vivado\SRM_6X6\system\imagen6X6.txt', 'w');
for i=1:48
    z=[decimalToBinaryVector(C(i,1),8) decimalToBinaryVector(C(i,2),8) decimalToBinaryVector(C(i,3),8) decimalToBinaryVector(C(i,4),8) decimalToBinaryVector(C(i,5),8) decimalToBinaryVector(C(i,6),8)]
    
    %D(i)=bi2de(z)
    %dlmwrite('imagen.txt', bi2de(z), 'newline', 'pc', 'precision', 'uint', '-append');
    %aux = binaryVectorToDecimal(z);
    %disp(aux);
    fprintf(fid,'%u\r\n', binaryVectorToDecimal(z));
    %fprintf(fid,'\n');
end


fclose(fid);