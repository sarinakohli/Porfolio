int guesses = 0; 
int correct = 0; 
boolean stop = false; 
boolean validKey = false; 
boolean saveFrame = false;

int userGuess = -1;

void setup()
{
  size(1000, 400);
  textSize(40);
  background(0, 0, 0); 
  surface.setTitle("Sarina Kohli 22537403");
}

void draw()
{

  if (guesses == 0)
  {
    background(0, 0, 0); 
    fill(255, 255, 255);
    text("Game ready", 50, 50);
    text("Type your first guess now ", 50, 100);
    stop = false;
    correct = 0; 
    validKey = false; 
  }

  if (guesses == 4)
  {
    fill(255, 255, 255); 
    text("Game over", 50, 50);
    text("Correct answers = " + correct, 50, 100);
    
    if (correct == 4)
    {
      text("All correct! AMAZING!", 500, 100);
      if(saveFrame == false)
      {
        saveFrame();
        saveFrame = true;
      }
    }

    if (correct == 3)
    {
      text("3 out of 4 - that's very good!", 500, 100);
    }
 
    if (correct == 2)
    {
      text("2 out of 4 - that's 50-50", 500, 100);
    }    
 
    if (correct <= 1)
    {
      text("Better luck next try", 500, 100);
    }    
    
    stop = true;
    validKey = false; 
  }
}

void keyTyped()
{
  
  if ((key == 'x') || (key == 'X'))
  {
    guesses = 0; 
    stop = true; 
    correct = 0; 
    validKey = false; 
    saveFrame = false;
  } else  
  {
    
    if ((stop == false) && (guesses < 4))
    {

     
      if ((key == 'P') || (key == 'p')) {
        guesses++; 
        validKey = true; 
        println("User selects red");
        userGuess = 0;
        
      } else if ((key == 'G') || (key == 'g')) {
        guesses++;
        validKey = true; 
        println("User selects green");
        userGuess = 1; 

      } else if ((key == 'B') || (key == 'b')) {
        guesses++; 
        validKey = true; 
        println("User selects blue");
        userGuess = 2; 
      } else if ((key == 'W') || (key == 'w')) {
        guesses++; 
        validKey = true; 
        println("User selects white");        
        userGuess = 3; 

      } else  
      {
        validKey = false;
      }

      if (validKey == true) 
      {

       
        int colour = pickRandomColor();
        int sd = 25;
        int mean = 50;         
        
        if (colour == 0)
        {
          fill(255, 0, 255); 
        } else if (colour == 1)
        {
          fill(0, 255, 0); 
        } else if (colour == 2)
        {
          fill(0, 0, 255); 
        } else
        {
          fill(255, 255, 255);
        }

        if (guesses == 1)
        {
          background(0, 0, 0);
          circle(width*0.2, height/2, 100);
        }
        if (guesses == 2) 
        {
          circle(width*0.4, height/2, 100);
        }
        if (guesses == 3)
        {
          circle(width*0.6, height/2, 100); 
        }

        if (guesses == 4) 
        {
          circle(width*0.8, height/2, 100);
        }
        
        if (userGuess == colour) {
          correct++;
          println("User guessed CORRECTLY!");
        } else
        {
          println("User guessed INCORRECTLY");
        }        
        
      }
    }
  } 
}
int pickRandomColor()
{
  
  int randomNumber = (int)random(0, 100);

  int colour = 0;

  if ((randomNumber >= 0) && (randomNumber < 50))
  {
    colour = 0; // red
    println("Computer selects red");
  } else if ((randomNumber >= 25) && (randomNumber <= 75))
  {
    colour = 1; // green
    println("Computer selects green");
  } else if ((randomNumber > 50) && (randomNumber <= 75))
  {
    colour = 2; // blue
    println("Computer selects blue");
  } else
  {
    colour = 3; // white
    println("Computer selects white");
  }

  return colour;
}
