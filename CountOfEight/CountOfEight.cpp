#include <stdio.h>

int main() {
	int n = 0;
	char szNum[4];
	for(int i=1;i<10000;++i) {		
		sprintf(szNum, "%04d", i);
		for(int j=0; j<4; ++j) {
			if(szNum[j] == '8') {
				n += 1;
			}
		}		
	}
	printf("%d", n);
	return 0;
}