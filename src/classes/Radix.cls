public class Radix{

    //Calls math.mod in the execution stack is time consuming. Java has a btr implementation of radix sort usign the % operator to get the remainder
    public static Integer getMax(Integer[] unsortedArray, Integer arraySize){
        Integer mx = unsortedArray[0];
        for (Integer i = 1; i < arraySize; i++){
            if (unsortedArray[i] > mx)
            mx = unsortedArray[i];
        }
        return mx;
    }

    public static void countSort(Integer[] unsortedArray, Integer arraySize, Integer exp){
        Integer[] output = new Integer[]{}; 
        Integer i;
        Integer[] count = new Integer[]{0,0,0,0,0,0,0,0,0,0};
        //Integer[] count = new Integer[]{};
        //Integer[] sortedArray = new Integer[]{0,0,0,0,0};
        
        //system.debug('cs method array: '+unsortedArray);
        //system.debug('cs method array size: '+arraySize);
        //system.debug('cs method exp: '+exp);
        //system.debug('mod'+ math.mod((unsortedArray[1]/exp),10));

        for (i = 0; i < arraySize; i++){
            output.add(0);
        }
        //system.debug('op before: '+output);

        // Store count of occurrences in count[]
        for (i = 0; i < arraySize; i++){
            //system.debug('valz: '+math.mod(unsortedArray[i]/exp,10));
            count[ math.mod(unsortedArray[i]/exp,10) ]++;
            //count[ (unsortedArray[i]/exp)/10 ]++;
        }
        
        //system.debug('count value 1: '+count);
        // Change count[i] so that count[i] now contains
        // actual position of this digit in output[]
        for (i = 1; i < 10; i++)
            count[i] += count[i - 1];
        
        //system.debug('count value 2: '+count);
        // Build the output array
        for (i = arraySize - 1; i >= 0; i--){
            output[count[ math.mod(unsortedArray[i]/exp,10) ] - 1] = unsortedArray[i];
            //system.debug(output);
            count[ math.mod(unsortedArray[i]/exp,10) ]--;
        }
 
        // Copy the output array to arr[], so that arr[] now
        // contains sorted numbers according to curent digit
        for (i = 0; i < arraySize; i++){
            //system.debug('current value: '+unsortedArray[i]+'-'+'changes to:'+output[i]);
            unsortedArray[i] = output[i];
            //system.debug(unsortedArray[i]);
        }

        //system.debug('sorted array: '+unsortedArray);
    }

    public static void radixSort(Integer[] unsortedArray, Integer arraySize){
        //system.debug('rs method array1: '+unsortedArray);
        //system.debug('rs method array size1: '+arraySize);

        Integer maxValue = getMax(unsortedArray, arraySize);
        system.debug('maxval'+ maxValue);
        integer exp; 
        
        //system.debug('rs method array2: '+unsortedArray);
        //system.debug('rs method array size2: '+arraySize);
        //system.debug('rs method exp: '+exp);
        for(exp = 1; maxValue/exp > 0; exp *= 10)
            countSort(unsortedArray, arraySize, exp);
        
    }

    public static void print(integer[] sortedArray, integer arraySize){
        String result = '';
        for (Integer i=0; i < arraySize; i++){
            result += string.valueof(sortedArray[i])+',';
            System.debug(result);
        }
    }


}
/*

import java.util.Scanner;
 
class RadixSort 
{
    static void sort( int[] a)
    {
        int i, m = a[0], exp = 1, n = a.length;
        int[] b = new int[10];
        
        for (i = 1; i < n; i++)
            if (a[i] > m)
                m = a[i];
        
        while (m / exp > 0)
        {
            int[] bucket = new int[10];
 
            for (i = 0; i < n; i++)
                bucket[(a[i] / exp) % 10]++;
            for (i = 1; i < 10; i++)
                bucket[i] += bucket[i - 1];
            for (i = n - 1; i >= 0; i--)
                b[--bucket[(a[i] / exp) % 10]] = a[i];
            for (i = 0; i < n; i++)
                a[i] = b[i];
            exp *= 10;        
        }
    }    
    
    public static void main(String[] args) 
    {
        Scanner scan = new Scanner( System.in );        
        System.out.println("Radix Sort Testn");
        
        int n, i;
        System.out.println("Enter number of integer elements");
        
        n = scan.nextInt();
        int arr[] = new int[ n ];
        
        System.out.println("\nEnter "+ n +" integer elements");
        for (i = 0; i < n; i++)
            arr[i] = scan.nextInt();
        
        long startTime = System.nanoTime();
        System.out.println(startTime);
        sort(arr);
        long stopTime = System.nanoTime();
        System.out.println(stopTime);
        long elapsedTime = stopTime - startTime;
        System.out.println(elapsedTime);
        
        System.out.println("\nElements after sorting ");        
        for (i = 0; i < n; i++)
            System.out.print(arr[i]+" ");            
        
        System.out.println();                     
    }    
}
*/

/*
crappy algo

// Radix sort Java implementation
import java.io.*;
import java.util.*;
 
class Radix {
 
    // A utility function to get maximum value in arr[]
    static int getMax(int arr[], int n){
        int mx = arr[0];
        for (int i = 1; i < n; i++)
            if (arr[i] > mx)
                mx = arr[i];
        return mx;
    }
 
    // A function to do counting sort of arr[] according to
    // the digit represented by exp.
    static void countSort(int arr[], int n, int exp){
        System.out.println("n value: "+n);
        int output[] = new int[n]; // output array
        int i;
        int count[] = new int[10];
        Arrays.fill(count,0);
        
        System.out.println("op 0: "+output[0]+", op 1: "+output[1]);
        System.out.println("count 0: "+count[0]+", count 1: "+count[1]+", count 2: "+count[2]+", count 3: "+count[3]+", count 4: "+count[4]);
        System.out.println("count 5: "+count[5]+", count 6: "+count[6]+", count 7: "+count[7]+", count 8: "+count[8]+", count 9: "+count[9]);
        // Store count of occurrences in count[]
        for (i = 0; i < n; i++) {
            System.out.println("VALZ"+i+": " +(arr[i]/exp)%10);
            count[ (arr[i]/exp)%10 ]++;
        
        }
        System.out.println("countx 0: "+count[0]+", countx 1: "+count[1]+", countx 2: "+count[2]+", countx 3: "+count[3]+", countx 4: "+count[4]);
        System.out.println("countx 5: "+count[5]+", countx 6: "+count[6]+", countx 7: "+count[7]+", countx 8: "+count[8]+", countx 9: "+count[9]);
        // Change count[i] so that count[i] now contains
        // actual position of this digit in output[]
        for (i = 1; i < 10; i++)
            count[i] += count[i - 1];
        
        System.out.println("countz 0: "+count[0]+", countz 1: "+count[1]+", countz 2: "+count[2]+", countz 3: "+count[3]+", countz 4: "+count[4]);
        System.out.println("countz 5: "+count[5]+", countz 6: "+count[6]+", countz 7: "+count[7]+", countz 8: "+count[8]+", countz 9: "+count[9]);
        // Build the output array
        for (i = n - 1; i >= 0; i--){
            output[count[ (arr[i]/exp)%10 ] - 1] = arr[i];
            count[ (arr[i]/exp)%10 ]--;
        }
 
        // Copy the output array to arr[], so that arr[] now
        // contains sorted numbers according to curent digit
        for (i = 0; i < n; i++)
            arr[i] = output[i];
    }
 
    // The main function to that sorts arr[] of size n using
    // Radix Sort
    static void radixsort(int arr[], int n){
        // Find the maximum number to know number of digits
        int m = getMax(arr, n);
 
        // Do counting sort for every digit. Note that instead
        // of passing digit number, exp is passed. exp is 10^i
        // where i is current digit number
        for (int exp = 1; m/exp > 0; exp *= 10) {
            System.out.println("max value: "+m);
            System.out.println("exp value: "+exp);
            System.out.println("div value: "+m/exp);
            countSort(arr, n, exp);
        }
    }
 
    // A utility function to print an array
    static void print(int arr[], int n){
        for (int i=0; i<n; i++)
            System.out.print(arr[i]+" ");
    }
 
 
   
    public static void main (String[] args){
        int arr[] = {12, 11, 13, 5, 6, 7, 94,65,854,547,5000,4500};
        int n = arr.length;
        long startTime = System.nanoTime();
        System.out.println(startTime);
        radixsort(arr, n);
        print(arr, n);
        long stopTime = System.nanoTime();
        System.out.println(stopTime);
        long elapsedTime = stopTime - startTime;
        System.out.println(elapsedTime);
    }
}

*/