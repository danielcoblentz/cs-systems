public class FindLargeSmall {
    public static void main(String[] args) {
        int length = 7;
        int min; 
        int max;
        int[] numbers = {12, 7, -3, 8, -4, 25, 19};

        // set min & max to first array element
        min = numbers[0];
        max = numbers[0];

        // Process through the array to find min and max
        for (int i = 1; i < length; i++) {
            if (numbers[i] < min) {
                min = numbers[i];
            }
            else if (numbers[i] > max) {
                max = numbers[i];
            }
        }

        // Print the results (not included in assembly language program)
        System.out.println("Smallest value: " + min);
        System.out.println("Largest value: " + max);
    }
}
