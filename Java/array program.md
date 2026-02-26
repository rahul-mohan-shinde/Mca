import java.util.*;
class scanner{

// to declare array having  5 element find largest from 
  public static void smallNum(){
    int a[] = {44,56,23,55,33};
    int small = a[0];
    for (int i = 0; i < 5; i++){
      if ( small > a[i]) {
        small=a[i];
      }
    } 
    System.out.println("smallest number is : " + small);
  }

    // method to find largest number
    public static void largeNum() {
        int a[] = {44, 56, 23, 55, 33};
        int large = a[0];   
        for (int i = 0; i < a.length; i++) {
            if (large < a[i]) {
                large = a[i];   
            }
        }

        System.out.println("Largest number is: " + large);
    }

  // find smallest n number taken from user
  public static void inputSmall(){

  int n, i, small;

  Scanner sc = new Scanner(System.in);
  System.out.print("enter no of elements");
  n = sc.nextInt();

  int a[] = new int[n];

  for(i=0; i<n;i++){
    System.out.print("enter a no");
    a[i]=sc.nextInt();
  }
  small = a[0];

  for(i=1;i<n;i++){
  if (small>a[i])
  small = a[i];
  }

  System.out.println(small);
  }



// declare 5 element array
// reverse the array
// insert new element at spesific position
// display it

  public static void insertArray(){
  
  
  int n, i, small;
// no of size
  Scanner sc = new Scanner(System.in);
  System.out.print("enter no of elements");
  n = sc.nextInt();

  int a[] = new int[n];
// insert 
  for(i=0; i<n;i++){
    System.out.print("enter a no");
    a[i]=sc.nextInt();
  }
 
 //revers
  for ( i=n-1;  i >=0; i--){
    System.out.println("a[] : "+a[i]);
  }
//display array
  for ( i=0;  i < n; i++){
    System.out.println("a[] : "+a[i]);
  }

  }

  public static void twoArray(){
    int i, j;

    int marks[][] = {{33,33,33},{22,22,22},{11,11,11}};
    for (i = 0 ;  i<3; i++){
       int sum = 0 ;
      for (j=0; j<3; j++){
        sum = sum + marks[i][j];
      }
      System.out.println("the result of addition is: " + sum);
    }
  }

// display the sum of the diagonal elements of a square matric
public static void sumDiagonal(){
  int i, j;
  int matrix[][] = {{33,33,33},{22,22,22},{11,11,11}};
  int sum = 0; 
  for (i = 0 ; i<3;i++){
  
  for (j = 0; j<3;j++){
  if (i == j){ sum=sum+matrix[i][j];}
  }
  }
 System.out.println(sum);
}

//
public static void sumRow(){
  int i, j;
  int matrix[][] = {{33,33,33},{22,22,22},{11,11,11}};
 
  for (i = 0 ; i<3;i++){
   int sum = 0; 
  for (j = 0; j<3;j++){
  sum = sum + matrix[i][j];
  }
  System.out.println(sum);
  }
 
}
//

public static void sumCol(){
  int i, j;
  int matrix[][] = {{33,33,33},{22,22,22},{11,11,11}};

// 00 10 30
 
  for (i = 0 ; i<3;i++){
   int sum = 0; 
  for (j = 0; j<3;j++){
  sum = sum + matrix[j][i];
  }
  System.out.println(sum);
  }

}

// transpose

public static void transpose(){
  int i, j;
  int a[][] = {{33,33,33},{22,22,22},{11,11,11}};

/*
33 33 33
22 22 22
11 11 11 

33 22 11
33 22 11
33 22 11
*/
System.out.println("Transpose of the matrics :- ");
/*  
for (i = 0 ; i<3;i++){
     for (j = 0; j<3;j++){
  System.out.print(a[j][i] + "\t");
  }
System.out.println();
  
  }
*/
  for (i = 0 ; i<3;i++){
     for (j = 0; j<3;j++){
 int temp = a[i][j];
a[i][j] = a[j][i];
a[j][i] = temp;
System.out.print(a[i][j] + "\t");
  }
System.out.println();
  
  }
}

// 3 student 5 subject marks average of marks each student
public static void avarageMarks(){
int i,j;
int marks[][] = {{44,44,44,44,44},{55,55,55,55,55},{66,66,66,66,66},{77,77,77,77,77},{88,88,88,88,88}} ;
  for (i=0; i<5; i++){
    float sum = 0;
//student wise average 
    for(j=0; j<5; j++){
      sum = sum + marks[i][j];
    }
 float avg = sum / 5;
System.out.println("student " +(i+1)+ " average is " + avg);
  }
}

  public static void main(String[] args){
  
     avarageMarks();
     
  }
}
