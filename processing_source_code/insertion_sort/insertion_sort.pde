//Arpit Omprakash
//Insertion sort visualization

//array of numbers to sort
float[] numbers;
//bin size
int n;
//index of current traversal
int a;
//index of element to be inserted
int b;
//number of comparisions
int comparision = 0;
//numeber of swaps
int swp = 0;
//indicator for current traversal
boolean done = true;

void setup(){
  size(1350, 200);
  background(0);
  n = 5;
  numbers = new float[width/n];
  for(int i = 0; i < numbers.length; i++){
    numbers[i] = random(0, height); //randomly generate numbers
    //numbers[i] = height - 3*i; //reverse sorted array
    //numbers[i] = 3*i; //sorted array
  }
  a = 1;
}

//insertion sort inner loop
void draw(){
  if (toSort()){
    done = true;
    if (b > 0 && numbers[b-1] > numbers[b]){
      done = false;
      display(b);
      swp++;
      swap(b-1, b);
      b -= 1;
    }
    comparision++;
  } else {
    display(numbers.length + 1);
  }
}

//function to determine if array is sorted
boolean toSort(){
  if (a < numbers.length){
    if (done){
      b = a;
      a++;
    }
    return true;
  }
  if(!done){
    return true;
  }
  return false;
}

//function to swap elements
void swap(int left, int right){
  float lVal = numbers[left];
  numbers[left] = numbers[right];
  numbers[right] = lVal;
}

//function to draw the array
//ellipse and bar visualizations
void render(int coloured){
  int x = 0;
  int sz;
  for(int i = 0; i < numbers.length; i++){
    float num = numbers[i];
    if (i == coloured){
      fill(255, 204, 0);
      sz = 10;
    } else {
      fill(255);
      sz = 5;
    }
    //rect(x, height - num, n, num);
    pushMatrix();
    translate(n/2, 0);
    ellipse(x, height - num, sz, sz);
    popMatrix();
    x += n;
  }
}

void display(int coloured){
  background(0);
  //draw the array with current item highlighted
  render(coloured);
  //print stats
  text("Array size:", 10, 10);
  text(width/n, 100, 10);
  text("Comparisions:", 10, 20);
  text(comparision, 100, 20);
  text("Swaps:", 10, 30);
  text(swp, 100, 30);
  text("% sorted", 10, 40);
  text(((float) a/numbers.length) * 100, 100, 40);
}
