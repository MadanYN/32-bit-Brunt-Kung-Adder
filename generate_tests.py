import numpy as np
file_path = "test_vectors.txt"

range = 2**25
p = np.random.randint(0, range, 10)
q = np.random.randint(0, range, 10)

with open(file_path, 'w') as file:
	for n in p:
		file.write(str(n))
		file.write(' ')
	file.write('\n')
	for n in q:
		file.write(str(n))
		file.write(' ')