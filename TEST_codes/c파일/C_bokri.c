#include <stdio.h>
float bokri(float money, float year, float interest);
float interestCalc(float money, float interest)
int main(){
	float r;
	r = bokri(100.0,100,0.066);
	printf("%d\n",r);
	return 0;
}

float bokri(float money, float year, float interest){
		for (int i = 1; i <= year; i++) {// 백년동안
			money = money + interestCalc(money, interest);
		}
		System.out.println(money);
}

float interestCalc(float money, float interest) {
		return money * (interest / 100);
	}