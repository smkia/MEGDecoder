function dct3Coefs = dct3(data)
%DCT3 function computes 3D-DCT features time-frequency data.
%   dct3Coefs = dct3(data)

%   The CopyRight is reserved by the author.
%   By Seyed Mostafa Kia, January, 2013
[freq,time,chennels]=size(data);
dct3Coefs=zeros(freq,time,chennels);
for i=1:chennels
    tempData=data(:,:,i);
    dct2Coefs=dct2(tempData);
    dct3Coefs(:,:,i)=dct2Coefs;
end
for i=1:freq
    for j=1:time
        tempDCT=[];
        for k=1:chennels
            tempDCT=[tempDCT,dct3Coefs(i,j,k)];
        end
        dctOverdct=dct(tempDCT);
        for k=1:chennels
            dct3Coefs(i,j,k)=dctOverdct(1,k);
        end
    end
end