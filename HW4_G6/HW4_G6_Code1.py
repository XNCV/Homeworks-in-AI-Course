import numpy as np
import HW4_G6_Code2 as ip

# Create initial 
A = np.random.random((4, 4))
k1 = np.random.random((2,2))
k2 = np.random.random((2,2))
bias1 = 0.11
bias2 = 0.14
W_full = np.random.random((4,2))

# --------------------------------------------------
# Computing depends on dentaE/dentak
# --------------------------------------------------
# The weights change from -5 to 5 percent of them
denta_k1 = (2*np.random.random((2,2))-1)/20
denta_k2 = (2*np.random.random((2,2))-1)/20
denta_bias1 = (2*np.random.random((1))-1)/20
denta_bias2 = (2*np.random.random((1))-1)/20

k1_after = k1+k1*denta_k1
k2_after = k2+k2*denta_k2
bias1_after = bias1+bias1*denta_bias1
bias2_after = bias2+bias2*denta_bias2

(B, cache1) = ip.forwardconv_func(A, k1, bias1)
(C, cache2) = ip.forwardconv_func(B, k2, bias2)
(y1, y2) = ip.forwardfully_func(C, W_full)

(B_a, cache1_a) = ip.forwardconv_func(A, k1_after, bias1_after)
(C_a, cache2_a) = ip.forwardconv_func(B_a, k2_after, bias2_after)
(y1_a, y2_a) = ip.forwardfully_func(C_a, W_full)

Target1 = 2
Target2 = 2
E1 = 0.5*(Target1-y1)**2 + 0.5*(Target2-y2)**2
E2 = 0.5*(Target1-y1_a)**2 + 0.5*(Target2-y2_a)**2
dentaE = abs(E2-E1)
# print(y1)
# print(y2)
# print(E1)
# print(E2)
# print(dentaE/E1*100)
dentak1 = np.divide(dentaE, abs(denta_k1))
dentak2 = np.divide(dentaE, abs(denta_k2))
dentab1 = np.divide(dentaE, abs(denta_bias1))
dentab2 = np.divide(dentaE, abs(denta_bias2))

print(dentak1)
# print(dentak2)
# print(dentab1)
# print(dentab2)

# --------------------------------------------------
# Computing depends on theory
# --------------------------------------------------
derror = [y1-Target1, y2-Target2]
dC = ip.backfully_func(derror, W_full)
dB, dk2, dbias2 = ip.backconv_func(dC, cache2)
dA, dk1, dbias1 = ip.backconv_func(dB, cache1)

print(dk1)
# print(dk2)
# print(dbias1)
# print(dbias2)