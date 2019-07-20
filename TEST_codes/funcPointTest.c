#include <stdio.h>
float danri(float money, float year, float rate);
float bokri(float money, float year, float rate);
float interestCalc(float money, float interest);
int main(){
	float money = 100;
	float (*fp) (float money, float year, float rate);
	fp = danri;
	money = fp(money, 100, 0.066);
	printf("%f\n",money);
	fp = bokri;
	money = fp(money, 100, 6.6);
	printf("%f\n",money);
	return 0;
}

float danri(float money, float year, float rate){//원금에 대해서만 붙이는 이자
	int i;
	float interest = money * rate;
	for(i = 0; i < year; i++){
		money +=interest;
	}
	return money;
}

float bokri(float money, float year, float rate){
	int i;
	for (i = 1; i <= year; i++) {
			money = money + interestCalc(money, rate);
		}
		return money;
}

float interestCalc(float money, float rate){
	return money * (rate / 100);
}