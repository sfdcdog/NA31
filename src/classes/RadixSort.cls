public class RadixSort{

    public static void sort(Integer[] unsortedArray){

        Integer i, m = unsortedArray[0], exp = 1, n = unsortedArray.size();
        Integer[] b = new Integer[]{0,0,0,0,0,0,0,0,0,0};
        
        system.debug('m value: '+m);
        system.debug('exp value: '+exp);
        system.debug('n value: '+n);
        
        for (i = 1; i < n; i++){
            if (unsortedArray[i] > m)
                m = unsortedArray[i];
        }
        
        system.debug('m value 2: '+m);

        while (m / exp > 0){
            system.debug('condition: '+ m/exp);
            Integer[] bucket = new Integer[]{0,0,0,0,0,0,0,0,0,0};
            
            for (i = 0; i < n; i++)
                bucket[math.mod(unsortedArray[i]/exp,10)]++;

            for (i = 1; i < 10; i++)
                bucket[i] += bucket[i - 1];
            
            system.debug('comes here'+ bucket);
            
            for (i = n - 1; i >= 0; i--){
                Integer val = bucket[math.mod(unsortedArray[i]/exp,10)];
                system.debug('The val: '+ bucket[math.mod(unsortedArray[i]/exp,10)]);
                b[--(val)] = unsortedArray[i];
                system.debug('here out: ');
            }
            system.debug('comes here 2'+ b);
            
            for (i = 0; i < n; i++)
                unsortedArray[i] = b[i];
                
            system.debug('comes here 3'+ unsortedArray);

            exp *= 10;        
        }
        
        system.debug('result: '+unsortedArray);
    }
}