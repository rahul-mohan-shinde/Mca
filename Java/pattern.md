// check armstrong property
class armstrong {
	public static void main(String []args){
		int n = 9;
int r;
int sum=0;
int n1=n;
		while(n>0){
			r = n%10;
			sum = sum + (r*r*r);
			n=n/10;
			if (n1 == sum){
				System.out.println("num is Armstrong");
			}
			else
				System.out.println("num is not Armstrong");
	
		}
		
	}
}

// print pattern
class pattern {
	public static void main(String[] args) {
		int a = 1 ;
		for (int i = 1; i<=5; i++) {
			for ( int j=1; j <=i; j++){
				System.out.print(i + " ");
			}
			System.out.println();
		}
	}
}

// @ and # pattern
class pattern2{
	public static void main(String[] args){
	int num = 5;
	for ( int i = 1; i <= 5; i++){
		for (int j=1; j<=i; j++){
			if (j%2==0){System.out.print("#");}
			else {System.out.print("@");}
		}
		System.out.println();
		}
	}
}

//revers pattern
class pattern3 {
	public static void main(String[] args){
	int num = 5;
		for ( int i = 5; i >= 1; i--){
			for (int j=1; j<=i; j++){
			if (j%2==0){System.out.print("#");}
			else 
			{System.out.print("@");}
			}
			System.out.println();
		}
	}

	
}

// print square
/*

1****
22***
333**
4444*
55555

*/
class pattern4 {
	public static void main(String[] args){
	int num = 5;
		for ( int i = 1; i <= 5; i++){
			for (int j=1; j<=i; j++){
				System.out.print(j);
				
			}
			for(int k=1; k<=5-i; k++){
				System.out.print("*");
			
			}
			System.out.println();
		}
	}

	
}















