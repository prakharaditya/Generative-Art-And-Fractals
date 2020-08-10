float[] values;
int i = 0;

void setup() {
  size(800, 500);
  values = new float[width];
  for (int i = 0; i < values.length; ++i) {
    values[i] = random(height);
  }
}

void draw() {
  background(51);
  stroke(255);

  if (i < values.length) {
    for(int j = 0; j < values.length - i - 1; ++j) {
      float a = values[j];
      float b = values[j + 1];
      if (a > b) {
        swap(values, j, j + 1);
      }
    }
  } else {
    noLoop();
  }
  i++;

  for (int i = 0; i < values.length; ++i) {
    line(i, height, i, height - values[i]);
  }
}

void swap(float[] arr, int a, int b) {
  float tmp = arr[a];
  arr[a] = arr[b];
  arr[b] = tmp;
}
