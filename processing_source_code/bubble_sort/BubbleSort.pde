class BubbleSort{
  float[] arr;
  
  BubbleSort(float[] numbers){
    arr = numbers;
  }
  
  void sort(){
    for(int i = 0; i < arr.length - 1; i++){
      boolean swapped = false;
      for(int j = 0; j < arr.length - 1; j++){
        if(arr[j] > arr[j+1]){
          swap(j, j+1);
          swapped = true;
        }
      }
      if (!swapped){
        break;
      }
    }
  }
  
  void swap(int left, int right){
    float lVal = arr[left];
    arr[left] = arr[right];
    arr[right] = lVal;
  }
}
