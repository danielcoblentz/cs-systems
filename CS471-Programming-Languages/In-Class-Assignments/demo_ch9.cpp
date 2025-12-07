#include <iostream>
using namespace std;
int fun(int *k){
	*k += 4;
	return 3 * (*k) - 1;
}
int main(){
	int i = 10, j = 10, sum1, sum2;

	// Predictions for the original (undefined-behavior) expressions:
	// a) If operands are evaluated left-to-right:
	//    sum1 = (i/2) + fun(&i)  -> (10/2)=5 then fun makes i=14 -> 41 => sum1 = 5 + 41 = 46
	//    sum2 = fun(&j) + (j/2)  -> fun makes j=14 -> 41 then (14/2)=7 => sum2 = 41 + 7 = 48
	// b) If operands are evaluated right-to-left:
	//    sum1 -> fun first: i->14 returns 41, then (14/2)=7 => sum1 = 7 + 41 = 48
	//    sum2 -> (j/2)=5 then fun makes j=14 returns 41 => sum2 = 41 + 5 = 46
	// c) If functions are evaluated first (both cases):
	//    sum1 = 48, sum2 = 48
	// d) Typical g++ result (note: behavior is undefined and can vary):
	//    On common g++ builds you'll usually see: sum1 = 48, sum2 = 46

	// restore original (unspecified-order) expressions
	sum1 = (i/2) + fun(&i);
	sum2 = fun(&j) + (j/2);

	cout << sum1 << endl;
	cout << sum2 << endl;
	return 0;
}