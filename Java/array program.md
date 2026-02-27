
# 📘 Java Array Programs 

```java
import java.util.Scanner;

public class ArrayPrograms {

    // 1️⃣ Find Smallest Number (Fixed Array)
    public static void findSmallest() {
        int[] arr = {44, 56, 23, 55, 33};
        int smallest = arr[0];

        for (int i = 1; i < arr.length; i++) {
            if (arr[i] < smallest) {
                smallest = arr[i];
            }
        }

        System.out.println("Smallest number is: " + smallest);
    }

    // 2️⃣ Find Largest Number
    public static void findLargest() {
        int[] arr = {44, 56, 23, 55, 33};
        int largest = arr[0];

        for (int i = 1; i < arr.length; i++) {
            if (arr[i] > largest) {
                largest = arr[i];
            }
        }

        System.out.println("Largest number is: " + largest);
    }

    // 3️⃣ Smallest Number (User Input)
    public static void inputSmallest() {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of elements: ");
        int n = sc.nextInt();

        int[] arr = new int[n];

        for (int i = 0; i < n; i++) {
            System.out.print("Enter number: ");
            arr[i] = sc.nextInt();
        }

        int smallest = arr[0];
        for (int i = 1; i < n; i++) {
            if (arr[i] < smallest) {
                smallest = arr[i];
            }
        }

        System.out.println("Smallest number is: " + smallest);
    }

    // 4️⃣ Reverse Array
    public static void reverseArray() {
        int[] arr = {10, 20, 30, 40, 50};

        System.out.println("Reversed Array:");
        for (int i = arr.length - 1; i >= 0; i--) {
            System.out.print(arr[i] + " ");
        }
        System.out.println();
    }

    // 5️⃣ Insert Element at Specific Position
    public static void insertElement() {
        int[] arr = new int[6];
        arr[0] = 10;
        arr[1] = 20;
        arr[2] = 30;
        arr[3] = 40;
        arr[4] = 50;

        int position = 2;  // insert at index 2
        int element = 99;

        for (int i = 4; i >= position; i--) {
            arr[i + 1] = arr[i];
        }

        arr[position] = element;

        System.out.println("Array after insertion:");
        for (int i = 0; i < 6; i++) {
            System.out.print(arr[i] + " ");
        }
        System.out.println();
    }

    // 6️⃣ Sum of Each Row in 2D Array
    public static void sumRows() {
        int[][] matrix = {
            {33, 33, 33},
            {22, 22, 22},
            {11, 11, 11}
        };

        for (int i = 0; i < matrix.length; i++) {
            int sum = 0;
            for (int j = 0; j < matrix[i].length; j++) {
                sum += matrix[i][j];
            }
            System.out.println("Row " + (i + 1) + " Sum: " + sum);
        }
    }

    // 7️⃣ Sum of Diagonal Elements
    public static void sumDiagonal() {
        int[][] matrix = {
            {33, 33, 33},
            {22, 22, 22},
            {11, 11, 11}
        };

        int sum = 0;
        for (int i = 0; i < matrix.length; i++) {
            sum += matrix[i][i];
        }

        System.out.println("Diagonal Sum: " + sum);
    }

    // 8️⃣ Transpose of Matrix
    public static void transposeMatrix() {
        int[][] matrix = {
            {1, 2, 3},
            {4, 5, 6},
            {7, 8, 9}
        };

        System.out.println("Transpose of Matrix:");

        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix.length; j++) {
                System.out.print(matrix[j][i] + " ");
            }
            System.out.println();
        }
    }

    // 9️⃣ Average Marks of Students
    public static void averageMarks() {
        int[][] marks = {
            {44, 44, 44, 44, 44},
            {55, 55, 55, 55, 55},
            {66, 66, 66, 66, 66}
        };

        for (int i = 0; i < marks.length; i++) {
            float sum = 0;

            for (int j = 0; j < marks[i].length; j++) {
                sum += marks[i][j];
            }

            float avg = sum / marks[i].length;
            System.out.println("Student " + (i + 1) + " Average: " + avg);
        }
    }

    public static void main(String[] args) {

        findSmallest();
        findLargest();
        reverseArray();
        sumRows();
        sumDiagonal();
        transposeMatrix();
        averageMarks();
    }
}
```

---

# ✅ What I Improved

* Proper class name
* Clean formatting
* Removed hardcoded sizes
* Fixed transpose logic
* Better method names
* Professional structure
* DSA-friendly logic

---

