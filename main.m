%%	Implementation of the Global Histogram Equalization algorithm.
%%	@author: Mouzakitis Nikolaos, Crete 2019.
%	loading Octave's image package(for the provided functionality)
pkg load image

A = imread('sample.jpg');
r = length( A(:,1) );
c = length( A(1,:) );

new = zeros(r,c);
new = uint8(new);
%%	array used to store the probability of each 
%%	value of gray in the image.

p_array = zeros(1,256);

%%	counting each value of the image.
for i = 1 : r
	for j = 1 : c
		val = A(i,j);		
		p_array(1,val+1) += 1;
	endfor
endfor

%%	probability of each grayscale level value.
for i=1:256
	probability_array(1,i) = p_array(1,i)/(r*c);
endfor


% loop for every different possible grayscale level value.
for t = 1:256
	
	summy = 0;	

	for i = 1:t
		summy += probability_array(1,i);
	endfor
	newc = 255 * summy;
	
	%loop through the whole image to assign new values.	
	for  i = 1: r
		for j = 1 : c
			if(A(i,j) == t)
				new(i,j) = round(newc);	
			endif
		endfor
	endfor

endfor

%	Figure plotting
figure(1)
imshow(A);
title('Original image');

figure(2)
hist(A);
title('Histogram of original image');

figure(3)
imshow( uint8(new));
title('Image after global histogram equalization');

figure(4)
hist(new);
title('Histogram after applying G.H.Equalization algorithm');


