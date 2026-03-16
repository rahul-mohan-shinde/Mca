import java.util.Scanner;

public class SearchName {

    public static void main(String args[]) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Enter name to search: ");
        String search = sc.nextLine();

        boolean found = false;

        for(int i = 0; i < args.length; i++) {

            String name = args[i];

            if(search.length() == name.length()) {

                int j;

                for(j = 0; j < search.length(); j++) {
                    if(search.charAt(j) != name.charAt(j)) {
                        break;
                    }
                }

                if(j == search.length()) {
                    found = true;
                    break;
                }
            }
        }

        if(found)
            System.out.println("Name Found");
        else
            System.out.println("Name Not Found");
    }
}