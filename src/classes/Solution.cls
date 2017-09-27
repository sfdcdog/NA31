public class Solution{

    public static void mergeSort(Integer[] numArray){
        mergeSort(numArray, new List<Integer>{numArray.size()}, 0, numArray.size() - 1);
    }

    public static void mergeSort(Integer[] numArray,Integer[] temp,Integer leftStart, Integer rightEnd){
        if(leftStart >= rightEnd){
            return;
        }

        Integer middle = (leftStart+rightEnd)/2;
        mergeSort(numArray, temp, leftStart, middle);
        mergeSort(numArray, temp, middle+1, rightEnd);
        mergeHalves(numArray, temp, leftStart, rightEnd);
    }

    public static void mergeHalves(Integer[] numArray, Integer[] temp, Integer leftStart, Integer rightEnd){

        Integer leftEnd = (rightEnd+leftStart)/2;
        Integer rightStart = leftEnd + 1;
        Integer size = rightEnd - leftStart + 1;

        Integer left = leftStart;
        Integer right = rightStart;
        Integer index = leftStart;

        while(left <= leftEnd && right <= rightEnd){
            if(numArray[left] <= numArray[right]){
                temp[index] = numArray[left];
                left++;
            }else{
                temp[index] = numArray[right];
                right++;
            }
            index++;
        }
        system.debug(temp);
        system.debug(left);
        system.debug(right);
        //system.debug(index);

    }

}