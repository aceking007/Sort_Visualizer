//Arpit Omprakash
//Bubble sort visualization

//array of numbers to sort
float[] numbers;
//bin size
int n;
//index of current traversal
int a;
//end index of current traversal
int b;
//number of comparisions
int comparision = 0;
//numeber of swaps
int swp = 0;

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
  a = 0;
  b = numbers.length - 1;
}

void draw(){
  //prevents traversal of sorted array elements
  if (a >= b){
    a = 0;
    b -= 1;
    //render final array after sorting
    display(numbers.length + 1);
  } else {
    //render each step
    display(a);
    //if current > next, swap (bubble sort logic)
    if(numbers[a] > numbers[a+1]){
      //increment swaps
      swp++;
      swap(a, a+1);
    }
    //increment current
    a += 1;
    //increment comparision
    comparision += 1;
  }
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

//function to display the sorting
void display(int coloured){
  background(0);
  //print stats
  text("Array size:", 10, 10);
  text(width/n, 100, 10);
  text("Comparisions:", 10, 20);
  text(comparision, 100, 20);
  text("Swaps:", 10, 30);
  text(swp, 100, 30);
  text("% sorted:", 10, 40);
  text(((float) (numbers.length - max(b, 0))/numbers.length) * 100, 100, 40);
  //draw the array with current item highlighted
  render(coloured);
}
