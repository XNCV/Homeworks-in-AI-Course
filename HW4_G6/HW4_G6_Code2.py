import numpy as np
from scipy import signal

# Forward Propagation function
def forwardconv_func(l_in, kernel, bias):
	(r_lin, c_lin) = l_in.shape
	(r_ker, c_ker) = kernel.shape
	r_lout = r_lin-r_ker+1
	c_lout = c_lin-c_ker+1
	l_out = np.zeros((r_lout, c_lout))
	for r in range(r_lout):
		for c in range(c_lout):
			overlap = l_in[r:r+r_ker, c:c+c_ker]
			l_out[r, c] = np.sum(overlap*kernel)

	cache = (l_in, kernel, bias)
	return l_out, cache

# Forward Propagation for fully connected layer
def forwardfully_func(l_in, weight):
	c_in = np.reshape(l_in, (1, 4))
	y1 = np.sum(c_in*weight[:,0])
	y2 = np.sum(c_in*weight[:,1])
	return y1, y2

# Back Propagation function
def backconv_func(dl_out, cache):
	(l_in, kernel, bias) = cache
	(r_lin, c_lin) = l_in.shape
	(r_dlout, c_dlout) = dl_out.shape
	(r_ker, c_ker) = kernel.shape
	dl_in = np.zeros(l_in.shape)
	dkernel = np.zeros(kernel.shape)
	dl_in = signal.convolve2d(dl_out, np.rot90(np.rot90(kernel)))
	for r in range(r_ker):
		for c in range(c_ker):
			overlap = l_in[r:r+r_dlout, c:c+c_dlout]
			dkernel[r, c] = np.sum(overlap*dl_out)

	dbias = np.sum(dl_out)
	return dl_in, dkernel, dbias

# Back Propagation for fully connected layer
def backfully_func(derror, weight):
	dl_in = np.zeros((2,2))
	num = 0
	for r in range(2):
		for c in range(2):
			overlap = weight[num, :]
			dl_in[r, c] = np.sum(overlap*derror)
			num += 1

	return dl_in