import sys

def space(x): return x != ''
def tab(x): return x != '\t'
def nline(x): return x.replace('\n', '')
def rtab(x): return x.replace('\t','')

#standard input
#data = sys.stdin.readlines()

data = {
	
	'0': [],
	'1': [],
	'2': [],
	'3': [],
	's': [],
	'z': []
}

f = open('size.txt', 'r')
for index, line in enumerate(f):
	filtered = list(filter(space, map(nline, map(rtab, line.split(' ')))))
	if (index+1)%3 == 0:
		print (filtered[-1])
		print (sum([int(i) for i in filtered[0:-1]]))
		print ('\n') 

