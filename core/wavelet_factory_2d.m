% wavelet_factory_2d: Create wavelet cascade from filters
% Usage
%    [Wop, filters] = wavelet_factory_2d(N, options)
% Input
%    N: The size of the signals to be transformed.
%    options: The filter and wavelet transform options, same as for 
%       morlet_filter_bank_2d and wavelet_layer_1d/wavelet_1d.
% Output
%    Wop: A cell array of wavelet transforms needed for the scattering trans-
%       form.
%    filters: A cell array of the filters used in defining the wavelets.

function [Wop, filters] = wavelet_factory_2d(size_in, options)
	options.null = 1;
	options = fill_struct(options, 'nb_layer', 3);
	
	% filters :
	filters = morlet_filter_bank_2d(size_in, options);
	
	% wavelet transforms :
	for m = 1:options.nb_layer
		Wop{m} = @(x)(wavelet_layer_2d(x, filters, options));
	end
end