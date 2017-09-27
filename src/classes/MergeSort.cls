public class MergeSort{

    public Integer[] merged(integer[] arr, integer l, integer m, integer r){
        // Find sizes of two subarrays to be merged
        integer n1 = m - l + 1;
        integer n2 = r - m;
 
        /* Create temp arrays */
        integer[] Ls = new integer[]{};
        integer[] Rs = new integer[]{};

        for(Integer i=0; i<n1; i++){
            Ls.add(0);
        }

        for(Integer i=0; i<n2; i++){
            Rs.add(0);
        }
 
        /*Copy data to temp arrays*/
        for (integer i=0; i<n1; i++)
            Ls[i] = arr[l + i];

        for (integer j=0; j<n2; j++)
            Rs[j] = arr[m + 1+ j];
 
 
        /* Merge the temp arrays */
 
        // Initial indexes of first and second subarrays
        integer i = 0, j = 0;
 
        // Initial index of merged subarry array
        integer k = l;
        while (i < n1 && j < n2){
            if (Ls[i] <= Rs[j]){
                arr[k] = Ls[i];
                i++;
            }else{
                arr[k] = Rs[j];
                j++;
            }
            k++;
        }
 
        /* Copy remaining elements of L[] if any */
        while (i < n1){
            arr[k] = Ls[i];
            i++;
            k++;
        }
 
        /* Copy remaining elements of R[] if any */
        while (j < n2){
            arr[k] = Rs[j];
            j++;
            k++;
        }

        return arr;
    }

    public List<Integer> sort(integer[] arr, integer l, integer r){
        Integer[] sortedArray;
        if (l < r){
            // Find the middle point
            integer m = (l+r)/2;
 
            // Sort first and second halves
            sort(arr, l, m);
            sort(arr , m+1, r);
 
            // Merge the sorted halves
            sortedArray = merged(arr, l, m, r);

            
        }
        return sortedArray;
    }
}

/*
// Java program for Merge Sort 
class MergeSort
{
    // Merges two subarrays of arr[].
    // First subarray is arr[l..m]
    // Second subarray is arr[m+1..r]
    void merge(int arr[], int l, int m, int r)
    {
        // Find sizes of two subarrays to be merged
        int n1 = m - l + 1;
        int n2 = r - m;
 
        // Create temp arrays 
        int L[] = new int [n1];
        int R[] = new int [n2];
 
        //Copy data to temp arrays
        for (int i=0; i<n1; ++i)
            L[i] = arr[l + i];
        for (int j=0; j<n2; ++j)
            R[j] = arr[m + 1+ j];
 
 
        // Merge the temp arrays 
 
        // Initial indexes of first and second subarrays
        int i = 0, j = 0;
 
        // Initial index of merged subarry array
        int k = l;
        while (i < n1 && j < n2)
        {
            if (L[i] <= R[j])
            {
                arr[k] = L[i];
                i++;
            }
            else
            {
                arr[k] = R[j];
                j++;
            }
            k++;
        }
 
        // Copy remaining elements of L[] if any 
        while (i < n1)
        {
            arr[k] = L[i];
            i++;
            k++;
        }
 
        // Copy remaining elements of R[] if any 
        while (j < n2)
        {
            arr[k] = R[j];
            j++;
            k++;
        }
    }
 
    // Main function that sorts arr[l..r] using
    // merge()
    void sort(int arr[], int l, int r)
    {
        if (l < r)
        {
            // Find the middle point
            int m = (l+r)/2;
 
            // Sort first and second halves
            sort(arr, l, m);
            sort(arr , m+1, r);
 
            // Merge the sorted halves
            merge(arr, l, m, r);
        }
    }
 
    // A utility function to print array of size n 
    static void printArray(int arr[])
    {
        int n = arr.length;
        for (int i=0; i<n; ++i)
            System.out.print(arr[i] + " ");
        System.out.println();
    }
 
    // Driver method
    public static void main(String args[])
    {
        int arr[] = {12, 11, 13, 5, 6, 7, 94,65,854,547,5000,4500};
 
        System.out.println("Given Array");
        printArray(arr);
        
        long startTime = System.nanoTime();
        System.out.println(startTime);
        MergeSort ob = new MergeSort();
        ob.sort(arr, 0, arr.length-1);
        
 
        System.out.println("\nSorted array");
        printArray(arr);
        long stopTime = System.nanoTime();
        System.out.println(stopTime);
        long elapsedTime = stopTime - startTime;
        System.out.println(elapsedTime);
    }
}
*/