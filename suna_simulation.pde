int[][] data;
int N=100;
int one_size;
int count_frame=0;
int count_frame_size=3;


void data_init(){
   for(int y=0;y<N;y++){
     for(int x=0;x<N;x++){
       data[y][x]=0;
     }
   }
   
}

void setup(){
  frameRate(60);
    data=new int[N][N];
    data_init();
    size(800,800);
    rectMode(CORNER);
    
    stroke(240,238,228);
    fill(240,238,228);
         //cell_generate();
    one_size=800/N;
}

void cell_update(){
   int[][] temp_data=new int[N][N];
   for(int y=0;y<N;y++){
     for(int x=0;x<N;x++){
       temp_data[y][x]=0;
     }
   }

   for(int y=0;y<N;y++){
     for(int x=0;x<N;x++){
       if(data[y][x]==1){
         if(y+1<N){
           if(data[y+1][x]==0){  
             temp_data[y+1][x]=data[y][x];
           }else{
             if(random(0,1)<=0.8){
               if(x-1>=0&&data[y+1][x-1]==0){
                 temp_data[y+1][x-1]=data[y][x];
               }else if(x+1<N&&data[y+1][x+1]==0){
                 temp_data[y+1][x+1]=data[y][x];
               }else{
                 temp_data[y][x]=1;
               }
             }else{
               temp_data[y][x]=2;
             }
           }
         }else{
           temp_data[y][x]=1;
         }
       }
       if(data[y][x]==2){
           temp_data[y][x]=2;
       }
     }     
   }

   for(int y=0;y<N;y++){
     for(int x=0;x<N;x++){
       data[y][x]=temp_data[y][x];
     }
   }
}

void cell_draw(){
   for(int y=0;y<N;y++){
     for(int x=0;x<N;x++){
       if(data[y][x]!=0){
         rect(one_size*x,one_size*y,one_size,one_size);
       }
     }     
   }
}

void cell_generate(){
    data[0][N/2+int(random(-10,10))]=1;
}


void draw(){
  if(keyPressed&&key=='r'){
    data_init();
  }
  background(255);
  cell_update();
  cell_draw();
  if(count_frame==0){
    cell_generate();
  }
  count_frame++;
  count_frame%=count_frame_size;
}
