function result=dct3(input_triple_of_matrix)
%this function is to  realize 3D_DCT by two steps,i.e.,for each page ,dct2 is used 
%firstly,and then dct is used for page orientation 
%now we assume that the operated 3d matrix is input_matrix  
[row,column,page]=size(input_triple_of_matrix); 
coefficients_of_3d_dct=zeros(row,column,page); 
%firstly,dct2 is finished to each page respectively 
for i=1:page 
    middle_2d_matrix=input_triple_of_matrix(:,:,i); 
    dct_coefficients=dct2(middle_2d_matrix); 
    coefficients_of_3d_dct(:,:,i)=dct_coefficients; 
end 
% Now ,the page-oritentation dct is finished as followings 
for i=1:row 
    for j=1:column 
        middle_vector=[]; 
        for k=1:page 
            middle_vector=[middle_vector,coefficients_of_3d_dct(i,j,k)]; 
        end 
        coefficients_of_dct1=dct(middle_vector); 
        for k=1:page 
            coefficients_of_3d_dct(i,j,k)=coefficients_of_dct1(1,k); 
        end 
    end 
end 
result=coefficients_of_3d_dct; 
end