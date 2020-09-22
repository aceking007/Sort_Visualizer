class InsertionSort{
  float[] arr;
  
  InsertionSort(float[] nums){
    arr = nums;
  }
  
  void sort(){
    for(int i = 1; i < arr.length; i++){
      int j = i;
      while(j > 0 && arr[j-1] > arr[j]){
        swap(j-1, j);
        j -= 1;
      }
    }
  }
  
  void swap(int left, int right){
    float lVal = arr[left];
    arr[left] = arr[right];
    arr[right] = lVal;
  }
}
