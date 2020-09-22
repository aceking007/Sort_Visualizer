class SelectionSort{
  float[] arr;
  
  SelectionSort(float[] nums){
    arr = nums;
  }
  
  void sort(){
    for(int i = 0; i < arr.length; i++){
      int min_index = i;
      for(int j = i + 1; j < arr.length; j++){
        if(arr[j] < arr[min_index]){
          min_index = j;
        }
      }
      swap(i, min_index);
    }
  }
  
  void swap(int left, int right){
    float lVal = arr[left];
    arr[left] = arr[right];
    arr[right] = lVal;
  }
}
