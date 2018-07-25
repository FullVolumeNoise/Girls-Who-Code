import random
alive = False
from random import randint
class life:
    def __init__(self,alive,x,y):
        self.alive= False
        self.x=x
        self.y=y

array=[[0 for i in range(100)] for i in range(100)]
for x in range(100):
    for y in range(100):
       array[x][y] = life(x,y, True)
       
def setup():
    size(1000,1000)
    background(97, 63, 85)
    frameRate(3)
    ra()
    
def draw():
    display()
    update()


       
def display():
    stroke(24, 86, 92)
    for x in range(100):
        for y in range(100):
            if (array[x][y].alive == True):
                fill(242,178,165)
            elif(array[x][y].alive == False):
                fill(234,222,111)
            
            rect(x * 50,y * 50, 50, 50)
        
def update():
    for x in range(100):
        for y in range(100):
            sum = 0
            if (x != 0 and y != 99):
                if(array[x-1][y+1].alive == True):
                    sum = sum + 1
            if (x != 0 and y != 0):
                if(array[x-1][y-1].alive ==True):
                    sum = sum + 1
            if (y != 0 and x != 99):
                if(array[x+1][y-1]):
                    sum = sum + 1
            if (x != 99 and y != 99):
                if (array[x+1][y+1].alive == True):
                    sum = sum + 1
            if (x != 0):
                if(array[x-1][y].alive == True): 
                    sum = sum + 1    
            if (y != 0):
                if(array[x][y-1].alive == True):
                    sum = sum + 1
            if(x != 99):
                if(array[x+1][y].alive == True):
                    sum = sum + 1
            if (y != 99):
                if(array[x][y+1].alive == True):
                    sum = sum + 1
            if (sum <=3 or sum >5):
                array[x][y].alive = False
            else:
                array[x][y].alive = True
                
def ra():
    for x in range(100):
        for y in range(100):
            ran = random.randint(0,100)
            if (ran < 30):
                array[x][y].alive = True
            else:
                array[x][y].alive = False
            


    
